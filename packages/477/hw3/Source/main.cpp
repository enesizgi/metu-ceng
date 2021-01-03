#include <iostream>
#include "parser.h"
#include <GL/glew.h>
#include <GLFW/glfw3.h>

//////-------- Global Variables -------/////////

GLuint gpuVertexBuffer;
GLuint gpuNormalBuffer;
GLuint gpuIndexBuffer;

// Sample usage for reading an XML scene file
parser::Scene scene;
static GLFWwindow* win = NULL;

static void errorCallback(int error, const char* description) {
    fprintf(stderr, "Error: %s\n", description);
}

static void keyCallback(GLFWwindow* window, int key, int scancode, int action, int mods) {
    if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS)
        glfwSetWindowShouldClose(window, GLFW_TRUE);
}


parser::Vec3f cross(parser::Vec3f const &a, parser::Vec3f const &b)
{
	parser::Vec3f tmp;
	
	tmp.x = a.y*b.z-b.y*a.z;
	tmp.y = b.x*a.z-a.x*b.z;
	tmp.z = a.x*b.y-b.x*a.y;
	
	return tmp;
}


parser::Vec3f add(parser::Vec3f const &a, parser::Vec3f const &b)
{
	parser::Vec3f tmp;
	tmp.x = a.x+b.x;
	tmp.y = a.y+b.y;
	tmp.z = a.z+b.z;
	
	return tmp;
}

parser::Vec3f mult(parser::Vec3f const& a, double const &c)
{
	parser::Vec3f tmp;
	tmp.x = a.x*c;
	tmp.y = a.y*c;
	tmp.z = a.z*c;
	
	return tmp;
}

float length(parser::Vec3f const& v)
{
	return sqrt(v.x*v.x+v.y*v.y+v.z*v.z);
}

parser::Vec3f normalize(parser::Vec3f const &v)
{
	parser::Vec3f tmp;
	float d;
	
	d = length(v);
	tmp.x = v.x/d;
	tmp.y = v.y/d;
	tmp.z = v.z/d;
	
	return tmp;
}

void turnOnLights(){
    glEnable(GL_LIGHTING);
    glEnable(GL_LIGHT0);
    GLfloat zero[] = {0,0,0,1.0f};
    GLfloat ambient[] = {scene.ambient_light.x, scene.ambient_light.y, scene.ambient_light.z, 1.0f};
    glLightfv(GL_LIGHT0 , GL_POSITION, zero);
    glLightfv(GL_LIGHT0 , GL_AMBIENT, ambient);
    glLightfv(GL_LIGHT0 , GL_DIFFUSE, zero);
    glLightfv(GL_LIGHT0 , GL_SPECULAR, zero); 

    for (int i=0; i<scene.point_lights.size();i++){
        glEnable(GL_LIGHT1 +i);
        GLfloat col[] = { scene.point_lights[i].intensity.x, scene.point_lights[i].intensity.y, scene.point_lights[i].intensity.z, 1.0f};
        GLfloat pos[] = {scene.point_lights[i].position.x, scene.point_lights[i].position.y, scene.point_lights[i].position.z, 1.0f};    

        glLightfv(GL_LIGHT1 + i, GL_POSITION, pos);
        glLightfv(GL_LIGHT1 + i, GL_AMBIENT, zero);
        glLightfv(GL_LIGHT1 + i, GL_DIFFUSE, col);
        glLightfv(GL_LIGHT1 + i, GL_SPECULAR, col);
    }
}

void turnOffLights() {
    glDisable(GL_LIGHTING);
    for(int i =0; i < i<scene.point_lights.size()+1; i++) 
        glDisable(GL_LIGHT0 + i);
}

void drawObjects (parser::Mesh& m) {
    glBegin(GL_TRIANGLES);
    auto &c = scene.materials[m.material_id-1];
    GLfloat ambColor[ 4 ]   ={c.ambient.x,c.ambient.y,c.ambient.z,1.0};
    GLfloat diffColor[ 4 ]   ={c.diffuse.x,c.diffuse.y,c.diffuse.z,1.0};
    GLfloat specColor[ 4 ]   ={c.specular.x,c.specular.y,c.specular.z,1.0};
    GLfloat specExp[ 1 ]   ={c.phong_exponent};

    glMaterialfv(GL_FRONT,GL_AMBIENT,ambColor) ;
    glMaterialfv(GL_FRONT,GL_DIFFUSE,diffColor) ;
    glMaterialfv(GL_FRONT,GL_SPECULAR,specColor) ;
    glMaterialfv(GL_FRONT,GL_SHININESS,specExp) ;

    std::vector<std::vector<parser::Vec3f>> normal_data(scene.vertex_data.size());

    for (auto& f : m.faces) {
        parser::Vec3f a(scene.vertex_data[f.v0_id-1].x,scene.vertex_data[f.v0_id-1].y,scene.vertex_data[f.v0_id-1].z);
        parser::Vec3f b(scene.vertex_data[f.v1_id-1].x,scene.vertex_data[f.v1_id-1].y,scene.vertex_data[f.v1_id-1].z);
        parser::Vec3f c(scene.vertex_data[f.v2_id-1].x,scene.vertex_data[f.v2_id-1].y,scene.vertex_data[f.v2_id-1].z);

        parser::Vec3f b_a, c_b,normal;

        b_a = add(b, mult(a, -1));
        c_b = add(c, mult(b, -1));
        normal = cross(b_a,c_b);
        normal = normalize(normal);

        normal_data[f.v0_id-1].push_back(normal);
        normal_data[f.v1_id-1].push_back(normal);
        normal_data[f.v2_id-1].push_back(normal);
    }

    for (auto& i : normal_data) {
        if (i.size() == 0) continue;
        parser::Vec3f sum(0,0,0);
        for (auto& j : i) {
            sum.x += j.x;
            sum.y += j.y;
            sum.z += j.z;
        }
        
        /*
        sum.x = sum.x / i.size();
        sum.y = sum.y / i.size();
        sum.z = sum.z / i.size();
        */
        sum = normalize(sum);
        i.clear();
        i.push_back(sum);
    }

    for (auto& f : m.faces) {

        auto &n = normal_data[f.v0_id-1][0];

        parser::Vec3f a(scene.vertex_data[f.v0_id-1].x,scene.vertex_data[f.v0_id-1].y,scene.vertex_data[f.v0_id-1].z);
        parser::Vec3f b(scene.vertex_data[f.v1_id-1].x,scene.vertex_data[f.v1_id-1].y,scene.vertex_data[f.v1_id-1].z);
        parser::Vec3f c(scene.vertex_data[f.v2_id-1].x,scene.vertex_data[f.v2_id-1].y,scene.vertex_data[f.v2_id-1].z);
        parser::Vec3f normal = {n.x,n.y,n.z};
        glNormal3f(normal.x,normal.y,normal.z);
        glVertex3f(a.x,a.y,a.z);

        n = normal_data[f.v1_id-1][0];
        normal = {n.x,n.y,n.z};
        glNormal3f(normal.x,normal.y,normal.z);
        glVertex3f(b.x,b.y,b.z);

        n = normal_data[f.v2_id-1][0];
        normal = {n.x,n.y,n.z};
        glNormal3f(normal.x,normal.y,normal.z);
        glVertex3f(c.x,c.y,c.z);
    }
    glEnd();
}

void setCamera (int width, int height) {
    auto& c = scene.camera;
    glViewport(0,0,width,height);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    gluLookAt(c.position.x,c.position.y,c.position.z,
    c.position.x + c.gaze.x,c.position.y + c.gaze.y, c.position.z + c.gaze.z,
    c.up.x, c.up.y, c.up.z);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glFrustum(c.near_plane.x,c.near_plane.y,c.near_plane.z,c.near_plane.w,
    c.near_distance,c.far_distance);
    

}

void init () {
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_NORMALIZE);

    glShadeModel(GL_SMOOTH);
}



int main(int argc, char* argv[]) {
    scene.loadFromXml(argv[1]);

    glfwSetErrorCallback(errorCallback);

    if (!glfwInit()) {
        exit(EXIT_FAILURE);
    }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 2);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);
    
    win = glfwCreateWindow(scene.camera.image_width, scene.camera.image_height, "CENG477 - HW3", NULL, NULL);
    if (!win) {
        glfwTerminate();
        exit(EXIT_FAILURE);
    }
    init();
    glfwMakeContextCurrent(win);
    

    GLenum err = glewInit();
    if (err != GLEW_OK) {
        fprintf(stderr, "Error: %s\n", glewGetErrorString(err));
        exit(EXIT_FAILURE);
    }

    glfwSetKeyCallback(win, keyCallback);

    turnOnLights();

    while(!glfwWindowShouldClose(win)) {
        int width,height;
        glfwGetFramebufferSize(win,&width,&height);

        
        setCamera(width,height);
        //glViewport(0,0,width,height);
        glClearColor(0,0,0,1);
        glClearDepth(1.0f);
        glClearStencil(0);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT);
        glShadeModel(GL_SMOOTH);
        glEnable(GL_DEPTH_TEST);
        glEnable(GL_RESCALE_NORMAL);

        if (scene.culling_enabled)
            glEnable(GL_CULL_FACE);
        else
            glDisable(GL_CULL_FACE);
        
        if (scene.culling_face)
            glCullFace(GL_FRONT);
        else
            glCullFace(GL_BACK);
        
        //glDepthFunc(GL_LEQUAL);
        
        //glEnable(GL_NORMALIZE);
        glMatrixMode(GL_MODELVIEW);
        
        for (auto& i : scene.meshes) {
            if (i.mesh_type == "Solid")
                glPolygonMode(GL_FRONT_AND_BACK,GL_FILL);
            else if (i.mesh_type == "Wireframe")
                glPolygonMode(GL_FRONT_AND_BACK,GL_LINE);

            glPushMatrix();
            for (int j = i.transformations.size() - 1; j >= 0 ;j--) {
                auto& k = i.transformations[j];
                if (k.transformation_type == "Translation") {
                    auto& t = scene.translations[k.id-1];
                    glTranslatef(t.x,t.y,t.z);
                }
                else if (k.transformation_type == "Rotation") {
                    auto& r = scene.rotations[k.id-1];
                    glRotatef(r.x,r.y,r.z,r.w);
                }
                else if (k.transformation_type == "Scaling") {
                    auto& s = scene.scalings[k.id-1];
                    glScalef(s.x,s.y,s.z);
                }
            }
            drawObjects(i);
            glPopMatrix();
        }
        

        glfwWaitEvents();


        glfwSwapBuffers(win);
    }

    glfwDestroyWindow(win);
    glfwTerminate();

    exit(EXIT_SUCCESS);

    return 0;
}
