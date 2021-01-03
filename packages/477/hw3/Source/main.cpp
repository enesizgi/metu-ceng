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

void init () {
    glEnable(GL_DEPTH_TEST);
}

void turnOnLights(){
    glEnable(GL_LIGHTING);
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
        glLightfv(GL_LIGHT1 + i, GL_AMBIENT, GLfloat*);
        glLightfv(GL_LIGHT1 + i, GL_DIFFUSE, col);
        glLightfv(GL_LIGHT1 + i, GL_SPECULAR, col);
    }
}

void turnOffLights() {
glDisable(GL_LIGHTING);
for(int i =0; i < i<scene.point_lights.size(); i++) 
glDisable(GL_LIGHT0 + i);}

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

    while(!glfwWindowShouldClose(win)) {
        int width,height;
        glfwGetFramebufferSize(win,&width,&height);
        setCamera(width,height);
        //glViewport(0,0,width,height);
        glClearColor(0,0,0,1);
        glClearDepth(1.0f);
        glClearStencil(0);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT);
        glMatrixMode(GL_MODELVIEW);
        

        for (auto& i : scene.meshes) {
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
        
        //glTranslatef(-1,-1,0);
        //glRotatef(70.0,0,0,1);

        glfwWaitEvents();


        glfwSwapBuffers(win);
    }

    glfwDestroyWindow(win);
    glfwTerminate();

    exit(EXIT_SUCCESS);

    return 0;
}
