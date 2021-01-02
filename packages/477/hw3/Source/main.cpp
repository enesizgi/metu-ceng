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

void drawObject () {
    
    glBegin(GL_TRIANGLES);
    for (auto& mesh : scene.meshes) {
        for (auto& face : ) {

        }
    }

    glEnd();
    
}

void customizedRenderFunction () {

    glClearColor(0,0,0,1);
    glClearDepth(1.0f);
    glClearStencil(0);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT);
    drawObject();
}

void setCamera () {
    auto& c = scene.camera;
    glViewport(0,0,c.image_width,c.image_height);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    GLfloat d[] = {c.gaze.x + c.position.x,c.gaze.y + c.position.y, c.gaze.z + c.position.z};
    gluLookAt(c.position.x,c.position.y,c.position.z,d[0],d[1],d[2],c.up.x,c.up.y,c.up.z);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glFrustum(c.near_plane.x,c.near_plane.y,c.near_plane.z,c.near_plane.w,c.near_distance,c.far_distance);
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

    setCamera();

    while(!glfwWindowShouldClose(win)) {
        glfwWaitEvents();
        customizedRenderFunction();
        glfwSwapBuffers(win);
    }

    glfwDestroyWindow(win);
    glfwTerminate();

    exit(EXIT_SUCCESS);

    return 0;
}
