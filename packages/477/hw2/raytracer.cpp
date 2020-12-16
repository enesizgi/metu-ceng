#include <iostream>
#include <limits>
#include <cmath>
#include <thread>
#include <mutex>
#include <algorithm>
#include <string>
#include <cmath>

#include "parser.h"
#include "math.h"
#include "ppm.h"
#include "matrixInverse.h"
#include "BVH.h"

std::mutex m1;
unsigned char* image;

using namespace parser;
typedef unsigned char RGB[3];
 
 
struct Ray 
{
    Vec3f a;
    Vec3f b;
} ;

template <class T>
T GetMax (T a, T b) {
	return a > b ? a : b ;
}

template <class T>
T GetMin (T a, T b) {
	return a < b ? a : b ;
}

Vec3f cross(Vec3f const &a, Vec3f const &b)
{
	Vec3f tmp;
	
	tmp.x = a.y*b.z-b.y*a.z;
	tmp.y = b.x*a.z-a.x*b.z;
	tmp.z = a.x*b.y-b.x*a.y;
	
	return tmp;
}

double dot(Vec3f const &a, Vec3f const &b)
{
	return (a.x*b.x)+(a.y*b.y)+(a.z*b.z);
}

double length2(Vec3f const& v)
{
	return (v.x*v.x+v.y*v.y+v.z*v.z);
}

double length(Vec3f const& v)
{
	return sqrt(length2(v));
}

Vec3f normalize(Vec3f const &v)
{
	Vec3f tmp;
	double d;
	
	d = length(v);
	tmp.x = v.x/d;
	tmp.y = v.y/d;
	tmp.z = v.z/d;
	
	return tmp;
}

Vec3f add(Vec3f const &a, Vec3f const &b)
{
	Vec3f tmp;
	tmp.x = a.x+b.x;
	tmp.y = a.y+b.y;
	tmp.z = a.z+b.z;
	
	return tmp;
}

Vec3f mult(Vec3f const& a, double const &c)
{
	Vec3f tmp;
	tmp.x = a.x*c;
	tmp.y = a.y*c;
	tmp.z = a.z*c;
	
	return tmp;
}

Vec4f homogenize(Vec3f& v1) {
	Vec4f v2;
	v2.x = v1.x;
	v2.y = v1.y;
	v2.z = v1.z;
	v2.w = 1;
	return v2;
}

double distance(Vec3f const &a, Vec3f const &b)
{
    return sqrt((a.x-b.x)*(a.x-b.x)+(a.y-b.y)*(a.y-b.y)+(a.z-b.z)*(a.z-b.z));
}

void get_cam_u(Camera &cam){
	cam.u = cross(cam.gaze,cam.up);
	cam.u = normalize(cam.u);
}

Ray generateRay(int const& i, int const &j, Camera const &cam)
{   
	double x,y,z,w;
    int W,H;
    x = cam.near_plane.x;
    y = cam.near_plane.y;
    z = cam.near_plane.z;
    w = cam.near_plane.w;
    W = cam.image_width;
    H = cam.image_height;
    double pixelW = (y-x)/W;
    double halfPixelW = pixelW*0.5;
    double pixelH = (w-z)/H;
    double halfPixelH = pixelH*0.5;    
	Ray tmp;
	Vec3f su,sv,s;
	
	tmp.a = cam.position;
	
	su = mult(cam.u,x+(i*pixelW)+halfPixelW);
	sv = mult(cam.up,w-(j*pixelH)+halfPixelH);
	
	s = add(su,sv);
	
	tmp.b = add(mult(cam.gaze,cam.near_distance),s);
    
	
	return tmp;
}

double intersectSphere(Ray const &r,Sphere const &s,Scene const &scene){
    double A,B,C,delta;
    Vec3f center;
    double radius,t,t1,t2;
    //center = scene.vertex_data[s.center_vertex_id-1];
	center = s.center;
    radius = s.radius;

    C = (r.a.x-center.x)*(r.a.x-center.x)+(r.a.y-center.y)*(r.a.y-center.y)+(r.a.z-center.z)*(r.a.z-center.z)-radius*radius;

	B = 2*r.b.x*(r.a.x-center.x)+2*r.b.y*(r.a.y-center.y)+2*r.b.z*(r.a.z-center.z);
	
	A = r.b.x*r.b.x+r.b.y*r.b.y+r.b.z*r.b.z;
	
	delta = B*B-4*A*C;
	
	if (delta < 0)
		return -1;

	else if (delta == 0)
	{
		t = -B / (2*A);
	}

	else		
	{
		delta = sqrt(delta);
		A *= 2;
	
		t1 = GetMin( ((-B + delta) / A), ((-B - delta) / A) );
		
		t = (t1 >= 0) ? t1 : -1.0f ;
		
	}

	return t;

}


double intersectTriangle(Ray const &r,Triangle const &tr,Scene const &scene){
	double  a,b,c,d,e,f,g,h,i,j,k,l;
	double beta,gamma,t;
	
	double eimhf,gfmdi,dhmeg,akmjb,jcmal,blmkc;

	double M;
	
	double dd;
	Vec3f ma,mb,mc;

	/*
	ma = scene.vertex_data[tr.indices.v0_id-1];
	mb = scene.vertex_data[tr.indices.v1_id-1];
	mc = scene.vertex_data[tr.indices.v2_id-1];
	*/
	ma = tr.vertices[0];
	mb = tr.vertices[1];
	mc = tr.vertices[2];
	
	a = ma.x-mb.x;
	b = ma.y-mb.y;
	c = ma.z-mb.z;

	d = ma.x-mc.x;
	e = ma.y-mc.y;
	f = ma.z-mc.z;
	
	g = r.b.x;
	h = r.b.y;
	i = r.b.z;
	
	j = ma.x-r.a.x;
	k = ma.y-r.a.y;
	l = ma.z-r.a.z;
	
	eimhf = e*i-h*f;
	gfmdi = g*f-d*i;
	dhmeg = d*h-e*g;
	akmjb = a*k-j*b;
	jcmal = j*c-a*l;
	blmkc = b*l-k*c;

	M = a*eimhf+b*gfmdi+c*dhmeg;
    if (M==0) return -1;
	
	t = -(f*akmjb+e*jcmal+d*blmkc)/M;

	if (t<scene.shadow_ray_epsilon) return -1;
	
	
	gamma = (i*akmjb+h*jcmal+g*blmkc)/M;
	
	if (gamma<0 || gamma>1) return -1;
	
	beta = (j*eimhf+k*gfmdi+l*dhmeg)/M;
	
	if (beta<0 || beta>(1-gamma)) return -1;
	
	return t;
}

Vec3f Diffuse_shading(Vec3f const &kd,Vec3f const &n, Vec3f const &x, PointLight const &p){
	Vec3f wo;
	Vec3f wi = add(p.position,mult(x,-1.0f));
	double r = length2(wi);
	wi = normalize(wi);
	double cos = GetMax((double)0, dot(wi,n)) ;
	Vec3f E = mult(p.intensity,1/r);
	wo.x = kd.x*cos*E.x;
	wo.y = kd.y*cos*E.y;
	wo.z = kd.z*cos*E.z;
	return wo;

}

Vec3f Ambient_Shading(Vec3f const &ka,Vec3f const &Ia){
	Vec3f wo;
	wo.x = ka.x*Ia.x;
	wo.y = ka.y*Ia.y;
	wo.z = ka.z*Ia.z;
	return wo;
}


Vec3f Specular_Shading(Material const &mat, Vec3f const &n, Vec3f const& x, Ray const &ray, PointLight const &p){
	Vec3f wi = add(p.position, mult(x, -1));
	double r = length2(wi);
	wi = normalize(wi);
	Vec3f wo = add(ray.a, mult(x, -1));
	wo = normalize(wo);
	Vec3f h = add(wi,wo);
	h = normalize(h);
	double cos = GetMax((double)0,dot(n,h));
	cos = pow(cos,mat.phong_exponent);
	Vec3f E = mult(p.intensity,1/r);
	Vec3f L;
	L.x = mat.specular.x*cos*E.x;
	L.y = mat.specular.y*cos*E.y;
	L.z = mat.specular.z*cos*E.z;
	
	return L;
}


Vec3f getColor(Scene & scene, int maxDepth, Ray ray) {

	double t_min;
	Vec3f x;
	Vec3f normal;
	Material mat;

	double t_s = __FLT_MAX__;
	int closest_s = -1;
	
	for(int k=0; k<scene.spheres.size();k++ ){
		double t;
		t = intersectSphere(ray,scene.spheres[k],scene);
		if(t>0){
			if(t<t_s){
				t_s = t;
				closest_s = k;
			}
		}
	}


	double t_tr = __FLT_MAX__;
	int closest_tr = -1;
	
	for(int k= 0;k<scene.triangles.size(); k++ ){
		double t;
		t = intersectTriangle(ray,scene.triangles[k],scene);
		if(t>0 && t<t_tr){
			
			t_tr = t;
			closest_tr = k;
		}

	}

	double t_mesh = __FLT_MAX__;
	int closest_mesh = -1;
	double t_face = __FLT_MAX__;
	double closest_face = -1;


	for(int k = 0; k<scene.meshes.size(); k++){
		

		for(int l = 0; l<scene.meshes[k].faces.size(); l++){
			
			
			double t;
			Triangle tr = scene.meshes[k].m_triangles[l];
			/*
			tr.indices.v0_id = scene.meshes[k].faces[l].v0_id;
			tr.indices.v1_id = scene.meshes[k].faces[l].v1_id;
			tr.indices.v2_id = scene.meshes[k].faces[l].v2_id;
			*/

			t = intersectTriangle(ray,tr,scene);
			if(t>0 && t<t_face){
				t_face = t;
				closest_face = l;
			}
		}

		if(t_face<t_mesh){
			t_mesh = t_face;
			closest_mesh = k;
		}
	}

	if(t_mesh<= t_tr){
		t_min = t_mesh;
	}
	else{	
		t_min = t_tr;
	}
	if(t_s<t_min){
		t_min = t_s;
	}
	if(t_min != __FLT_MAX__){
		x = add(ray.a,mult(ray.b,t_min));
		if(t_min == t_s){
			
			//Vec3f center = scene.vertex_data[scene.spheres[closest_s].center_vertex_id-1];
			Vec3f center = scene.spheres[closest_s].center;
			/*
			std::vector<double> hom_center{center.x,center.y,center.z,1};
			std::vector<double> hom2_center(4);
			matrixMult(scene.spheres[closest_s].transformation_matrix,hom_center,hom2_center);
			*/
			center =mult(center,-1);
			normal = add(x,center);
			normal = normalize(normal);
			mat = scene.materials[scene.spheres[closest_s].material_id-1];
		}
		if(t_min == t_tr){
			Triangle tr;
			
			Vec3f a, b, c, b_a, c_b;
			tr = scene.triangles[closest_tr];
			//scene.triangles[closest_tr].transformation_matrix
			/*
			a = scene.vertex_data[tr.indices.v0_id-1];
			b = scene.vertex_data[tr.indices.v1_id-1];
			c = scene.vertex_data[tr.indices.v2_id-1];
			*/
			a = tr.vertices[0];
			b = tr.vertices[1];
			c = tr.vertices[2];

			b_a = add(b, mult(a, -1));
			c_b = add(c, mult(b, -1));
			normal = cross(b_a, c_b);
			normal = normalize(normal);
			mat = scene.materials[tr.material_id-1];
		}
		
		if(t_min == t_mesh){
			Face face;
			Vec3f a, b, c, b_a, c_b;
			face = scene.meshes[closest_mesh].faces[closest_face];
			
			//scene.meshes[closest_mesh].transformation_matrix
			/*
			a = scene.vertex_data[face.v0_id-1];
			b = scene.vertex_data[face.v1_id-1];
			c = scene.vertex_data[face.v2_id-1];
			*/

			a = scene.meshes[closest_mesh].m_triangles[closest_face].vertices[0];
			b = scene.meshes[closest_mesh].m_triangles[closest_face].vertices[1];
			c = scene.meshes[closest_mesh].m_triangles[closest_face].vertices[2];
			 
			b_a = add(b, mult(a, -1));
			c_b = add(c, mult(b, -1));
			normal = cross(b_a, c_b);
			normal = normalize(normal);
			mat =scene.materials[scene.meshes[closest_mesh].material_id-1];
		}


Vec3f La = Ambient_Shading(mat.ambient, scene.ambient_light);

for(std::vector<PointLight>::iterator light = scene.point_lights.begin();light != scene.point_lights.end();light++) {
	Ray shadow ;
	shadow.b =  ( add( (*light).position , mult(x,-1) ) );
	Vec3f wi = normalize(shadow.b);
	shadow.a = add(x,mult(normal,scene.shadow_ray_epsilon));
	
	double t1 = -1;

	for(int k=0; k<scene.spheres.size();k++ ){

		double t;
		t = intersectSphere(shadow,scene.spheres[k],scene);
		if (t < 0 || t>1 )
			continue;

		else {
			t1 = t;
			break;
		}

	}

	if (t1 != -1) 
		continue;
	
	for(int k= 0;k<scene.triangles.size(); k++ ){
		double t;
		t = intersectTriangle(shadow,scene.triangles[k],scene);
		if (t < 0 || t > 1)
			continue;

		else {
			t1 = t;
			break;
		}

	}

	if (t1 != -1) 
		continue;

	for(int k = 0; k<scene.meshes.size(); k++){
		
		double t2 = -1;
		for(int l = 0; l<scene.meshes[k].faces.size(); l++){
						
			double t;
			Triangle tr = scene.meshes[k].m_triangles[l];
			/*
			tr.indices.v0_id = scene.meshes[k].faces[l].v0_id;
			tr.indices.v1_id = scene.meshes[k].faces[l].v1_id;
			tr.indices.v2_id = scene.meshes[k].faces[l].v2_id;
			*/

			t = intersectTriangle(shadow,tr,scene);
			if (t < 0 || t > 1)
				continue;

			else {
				t2 = t;
				break;
			}
		}

		if (t2 == -1)
			continue;

		else {
			t1 = t2;
			break;
		}

	}
	

	if (t1 != -1) 
		continue;
	
	Vec3f Ld = Diffuse_shading(mat.diffuse,normal,x,*light);
	Vec3f Ls = Specular_Shading(mat,normal,x,ray,*light);
	La = add(La,add(Ld,Ls));
}
		if(maxDepth == 0){
		return La;
	}

	Vec3f Lm;
	Vec3f wr,wo;
	wo = add(ray.a,mult(x,-1));
	wo = normalize(wo);
	wr = add(mult(wo,-1),mult(mult(normal,2),dot(normal,wo)));
	wr = normalize(wr);
	Ray mirror_ray;
	mirror_ray.a = x;
	mirror_ray.b = wr;


	Lm = getColor(scene,maxDepth-1,mirror_ray);
	Vec3f km = mat.mirror ;
	Lm.x = Lm.x*km.x;
	Lm.y = Lm.y*km.y;
	Lm.z = Lm.z*km.z;

	return add(La,Lm);

	}


	Vec3f tmp;
	tmp.x = scene.background_color.x;
	tmp.y = scene.background_color.y;
	tmp.z = scene.background_color.z;
	return tmp;


}

static void LoadImages(int height, int width,
float threadCounter, float numberofThreads,Camera cam, Scene scene) {
	
	long long w;
	float j,finish;

	
	j = std::ceil( (threadCounter/numberofThreads)*height );

	finish = std::ceil( ((threadCounter+1)/numberofThreads)*height );

	w = j*3*width;

	//std::cout << j << " " << finish << " " << w << " " << "\n";

	for(;j<finish;j++){
		for(int i=0;i<width;i++){

			Ray r;
			r = generateRay(i,j,cam);

			Vec3f color;
			color = getColor(scene,scene.max_recursion_depth,r);
			color.x = color.x > 255 ? 255 : round(color.x) ;
			color.y = color.y > 255 ? 255 : round(color.y) ;
			color.z = color.z > 255 ? 255 : round(color.z) ;

			m1.lock();
			image[w++] = color.x;
			image[w++] = color.y;
			image[w++] = color.z;
			m1.unlock();
			
			}

	}
	
}

void Identity (std::vector<double>& r) {
	if (r.size() != 16)
		r.resize(16);
	r[0] = 1; r[1] = 0; r[2] = 0; r[3] = 0;
	r[4] = 0; r[5] = 1; r[6] = 0; r[7] = 0;
	r[8] = 0; r[9] = 0; r[10] = 1; r[11] = 0;
	r[12] = 0; r[13] = 0; r[14] = 0; r[15] = 1;
}

void Translate (Vec3f& t, std::vector<double>& r) {
	if (r.size() != 16)
		r.resize(16);
	r[0] = 1; r[1] = 0; r[2] = 0; r[3] = t.x;
	r[4] = 0; r[5] = 1; r[6] = 0; r[7] = t.y;
	r[8] = 0; r[9] = 0; r[10] = 1; r[11] = t.z;
	r[12] = 0; r[13] = 0; r[14] = 0; r[15] = 1;
}

void Rotate (Rotation& rotation, std::vector<double>& r) {
	if (r.size() != 16)
		r.resize(16);

	Vec3f u,v,w;
	u.x = rotation.x; u.y = rotation.y; u.z = rotation.z;
	u = normalize(u);

	float temp = GetMin(GetMin(u.x,u.y),u.z);

	if (temp == u.x) {
		v.x = 0;
		v.y = -u.z;
		v.z = u.y;
	}

	else if (temp == u.y) {
		v.x = -u.z;
		v.y = 0;
		v.z = u.x;
	}

	else if (temp == u.z) {
		v.x = -u.y;
		v.y = u.x;
		v.z = 0;
	}

	w = cross(u,v);
	v = normalize(v);
	w = normalize(w);

	std::vector<double> m(16);
	std::vector<double> inv_m(16);

	m[0] = u.x; m[1] = u.y; m[2] = u.z; m[3] = 0;
	m[4] = v.x; m[5] = v.y; m[6] = v.z; m[7] = 0;
	m[8] = w.x; m[9] = w.y; m[10] = w.z; m[11] = 0;
	m[12] = 0; m[13] = 0; m[14] = 0; m[15] = 1;

	invert(m,inv_m);

	std::vector<double> r_x(16);
	float sinr = std::sin((M_PI*rotation.angle)/180);
	float cosr = std::cos((M_PI*rotation.angle)/180);
	
	r_x[0] = 1; r_x[1] = 0; r_x[2] = 0; r_x[3] = 0;
	r_x[4] = 0; r_x[5] = cosr; r_x[6] = -sinr; r_x[7] = 0;
	r_x[8] = 0; r_x[9] = sinr; r_x[10] = cosr; r_x[11] = 0;
	r_x[12] = 0; r_x[13] = 0; r_x[14] = 0; r_x[15] = 1;

	matrixMult(r_x,m,r);

	std::vector<double> tmp(16);
	tmp = r;

	matrixMult(inv_m,tmp,r);

}

void Scale (Vec3f& s, std::vector<double>& r) {
	if (r.size() != 16)
		r.resize(16);

	r[0] = s.x; r[1] = 0; r[2] = 0; r[3] = 0;
	r[4] = 0; r[5] = s.y; r[6] = 0; r[7] = 0;
	r[8] = 0; r[9] = 0; r[10] = s.z; r[11] = 0;
	r[12] = 0; r[13] = 0; r[14] = 0; r[15] = 1;

	// doğru olmayabilir kontrol et
}



int main(int argc, char* argv[])
{
    parser::Scene scene;
    scene.loadFromXml(argv[1]);


	// mesh icin
	for (int j = 0;j<scene.meshes.size();j++) {

		auto& mesh = scene.meshes[j];

		std::vector<std::string> transforms;
		std::string temp = "";

		for (int k = 0;k<mesh.transformations.size();k++) {
			auto& i = mesh.transformations[k];
			
			if (i == ' ') {
				transforms.push_back(temp);
				temp = "";
			}
			else {
				temp += i;
			}
		}
		transforms.push_back(temp);

		std::vector<double> result(16) ; // transformation matris hesaplanıp resultda tutulacak.
		Identity(result);
		for (int k = 0;k<transforms.size();k++) {
			auto& i = transforms[k];
			int temp = std::stoi(i.substr(1,i.size())); // transform id'yi str'den int'e çeviriyor.

			std::vector<double> m2;
			std::vector<double> m1(16);
			m2 = result;

			if (i[0] == 't') { // translation
				Translate(scene.translations[temp-1],m1);
			} 

			else if (i[0] == 'r') { // rotation
				Rotate(scene.rotations[temp-1],m1);
			}

			else if (i[0] == 's') { // scaling
				Scale(scene.scalings[temp-1],m1);
			}

			matrixMult(m1,m2,result);
		}

		mesh.transformation_matrix = result ;

		for (int k = 0;k<mesh.faces.size();k++) {
			auto& i = mesh.faces[k];
			Triangle tr;
			tr.vertices.push_back(scene.vertex_data[i.v0_id-1]);
			tr.vertices.push_back(scene.vertex_data[i.v1_id-1]);
			tr.vertices.push_back(scene.vertex_data[i.v2_id-1]);
			mesh.m_triangles.push_back(tr);
			/*
			mesh.m_triangles.push_back(scene.vertex_data[i.v0_id-1]);
			mesh.m_triangles.push_back(scene.vertex_data[i.v1_id-1]);
			mesh.m_triangles.push_back(scene.vertex_data[i.v2_id-1]);*/
		}

		for (int k = 0;k<mesh.m_triangles.size();k++) {
			auto& i = mesh.m_triangles[k];

			for (int l = 0;l<i.vertices.size();l++) {
				auto& vertex = i.vertices[l];
				std::vector<double> v1{vertex.x,vertex.y,vertex.z,1};
				std::vector<double> v2(4);
				matrixMult(mesh.transformation_matrix,v1,v2);
				vertex.x = v2[0];
				vertex.y = v2[1];
				vertex.z = v2[2];
			}

		}

	}

	//sphere icin
	for (int j = 0;j<scene.spheres.size();j++) {
		auto& sphere = scene.spheres[j];

		std::vector<std::string> transforms;
		std::string temp = "";

		for (int k = 0;k<sphere.transformations.size();k++) {
			auto& i = sphere.transformations[k];
			
			if (i == ' ') {
				transforms.push_back(temp);
				temp = "";
			}
			else {
				temp += i;
			}
		}
		if (temp != "")
			transforms.push_back(temp);

		std::vector<double> result(16) ; // transformation matris hesaplanıp resultda tutulacak.
		Identity(result);
		for (int k = 0;k<transforms.size();k++) {
			auto& i = transforms[k];
			int temp = std::stoi(i.substr(1,i.size())); // transform id'yi str'den int'e çeviriyor.

			std::vector<double> m2;
			std::vector<double> m1(16);
			m2 = result;

			if (i[0] == 't') { // translation
				Translate(scene.translations[temp-1],m1);
			}

			else if (i[0] == 'r') { // rotation
				Rotate(scene.rotations[temp-1],m1);
			}

			else if (i[0] == 's') { // scaling
				Scale(scene.scalings[temp-1],m1);
			}

			matrixMult(m1,m2,result);
		}

		sphere.transformation_matrix = result;

		sphere.center = scene.vertex_data[sphere.center_vertex_id-1];

	}

	//triangle icin
	for (auto& triangle : scene.triangles) {

		std::vector<std::string> transforms;
		std::string temp = "";

		for (auto &i : triangle.transformations) {
			
			if (i == ' ') {
				transforms.push_back(temp);
				temp = "";
			}
			else {
				temp += i;
			}
		}
		transforms.push_back(temp);

		std::vector<double> result(16) ; // transformation matris hesaplanıp resultda tutulacak.
		Identity(result);
		for (auto &i : transforms) {
			int temp = std::stoi(i.substr(1,i.size())); // transform id'yi str'den int'e çeviriyor.

			std::vector<double> m2;
			std::vector<double> m1(16);
			m2 = result;

			if (i[0] == 't') { // translation
				Translate(scene.translations[temp-1],m1);
			}

			else if (i[0] == 'r') { // rotation
				Rotate(scene.rotations[temp-1],m1);
			}

			else if (i[0] == 's') { // scaling
				Scale(scene.scalings[temp-1],m1);
			}

			matrixMult(m1,m2,result);
		}

		triangle.transformation_matrix = result;

		triangle.vertices.push_back(scene.vertex_data[triangle.indices.v0_id-1]);
		triangle.vertices.push_back(scene.vertex_data[triangle.indices.v1_id-1]);
		triangle.vertices.push_back(scene.vertex_data[triangle.indices.v2_id-1]);

		for (auto &i : triangle.vertices) {
			std::vector<double> v1{i.x,i.y,i.z,1};
			std::vector<double> v2(4);
			matrixMult(triangle.transformation_matrix,v1,v2);
			i.x = v2[0];
			i.y = v2[1];
			i.z = v2[2];
		}

	}

	// transformationların tamamı intersect fonksiyonlarından önce uygulanacak.

	// kamera transformationı da lazım sanırım.

	//scene.vertex_data[scene.triangles[0].indices.v2_id - 1];
	

	for(std::vector<Camera>::iterator cam = scene.cameras.begin();cam != scene.cameras.end();cam++){
		int width = (*cam).image_width;
		int height = (*cam).image_height;
		get_cam_u(*cam);
		bool tmp = (*cam).u.y == 0;
		image = new unsigned char[width*height*3];

		unsigned int numberofThreads = std::thread::hardware_concurrency();

		numberofThreads;

		std::vector<std::thread> threads;

		for (int i = 0;i<numberofThreads;i++) {
			
			threads.push_back(std::thread(LoadImages,height,width,i,numberofThreads,*cam,scene));
			//std::cout << "Thread " << i << " opening..." << "\n";
		}
		
		for (int i = 0;i<numberofThreads;i++) {
			if (threads[i].joinable()) {
				threads[i].join();
			}
			//std::cout << "Thread " << i << " closing..." << "\n";
		}

		std::string temp =  (*cam).image_name;
		char* temp2 = new char[temp.size()+1];
		char* temp3 = temp2;
		for (int h = 0;h<temp.size();h++) {
			(*temp3) = temp[h];
			temp3++;
		}
		*temp3 = '\0';

		write_ppm(temp2, image, (*cam).image_width, (*cam).image_height);



		}

		


		
}
