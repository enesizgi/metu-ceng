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
    center = scene.vertex_data[s.center_vertex_id-1];
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

	ma = scene.vertex_data[tr.indices.v0_id-1];
	mb = scene.vertex_data[tr.indices.v1_id-1];
	mc = scene.vertex_data[tr.indices.v2_id-1];
	
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
	int size_s = scene.spheres.size();
	
	for(int k=0; k<size_s;k++ ){
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
	int size_tr =scene.triangles.size();
	
	for(int k= 0;k<size_tr; k++ ){
		double t;
		t = intersectTriangle(ray,scene.triangles[k],scene);
		if(t>0 && t<t_tr){
			
			t_tr = t;
			closest_tr = k;
		}

	}

	double t_mesh = __FLT_MAX__;
	int closest_mesh = -1;
	int size_m = scene.meshes.size();
	double t_face = __FLT_MAX__;
	double closest_face = -1;

	for(int k = 0; k<size_m; k++){
		

		int size_f = scene.meshes[k].faces.size();
		

		for(int l = 0; l<size_f; l++){
			
			
			double t;
			Triangle tr;
			tr.indices.v0_id = scene.meshes[k].faces[l].v0_id;
			tr.indices.v1_id = scene.meshes[k].faces[l].v1_id;
			tr.indices.v2_id = scene.meshes[k].faces[l].v2_id;

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
			
			Vec3f center = scene.vertex_data[scene.spheres[closest_s].center_vertex_id-1];

			center =mult(center,-1);
			normal = add(x,center);
			normal = normalize(normal);
			mat = scene.materials[scene.spheres[closest_s].material_id-1];
		}
		if(t_min == t_tr){
			Triangle tr;
			Vec3f a, b, c, b_a, c_b;
			tr = scene.triangles[closest_tr];
			a = scene.vertex_data[tr.indices.v0_id-1];
			b = scene.vertex_data[tr.indices.v1_id-1];
			c = scene.vertex_data[tr.indices.v2_id-1];
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
			a = scene.vertex_data[face.v0_id-1];
			b = scene.vertex_data[face.v1_id-1];
			c = scene.vertex_data[face.v2_id-1];
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
	
	int size_s = scene.spheres.size();

	for(int k=0; k<size_s;k++ ){

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

	int size_tr = scene.triangles.size();
	
	for(int k= 0;k<size_tr; k++ ){
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
	
	int size_m = scene.meshes.size();

	for(int k = 0; k<size_m; k++){
		int size_f = scene.meshes[k].faces.size();
		
		double t2 = -1;
		for(int l = 0; l<size_f; l++){
						
			double t;
			Triangle tr;
			tr.indices.v0_id = scene.meshes[k].faces[l].v0_id;
			tr.indices.v1_id = scene.meshes[k].faces[l].v1_id;
			tr.indices.v2_id = scene.meshes[k].faces[l].v2_id;

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

	float sinr = std::sin(rotation.angle);
	float cosr = std::cos(rotation.angle);
	std::vector<double> v1(16);
	std::vector<double> inv_v1(16);
	Vec3f t1,inv_t1;
	t1.x = rotation.x; t1.y = rotation.y; t1.z = rotation.z;
	inv_t1.x = -rotation.x; inv_t1.y = -rotation.y; inv_t1.z = -rotation.z;
	Translate(t1,v1);
	Translate(inv_t1,inv_v1);



	r[0] = 1; r[1] = 0; r[2] = 0; r[3] = 0;
	r[4] = 0; r[5] = 1; r[6] = 0; r[7] = 0;
	r[8] = 0; r[9] = 0; r[10] = 1; r[11] = 0;
	r[12] = 0; r[13] = 0; r[14] = 0; r[15] = 1;

	// Tam değil
	// plane'e göre rotation alınması gerekiyor sanırım.

}

void Scale (Vec3f& s, std::vector<double>& r) {
	if (r.size() != 16)
		r.resize(16);
	r[0] = s.x; r[1] = 0; r[2] = 0; r[3] = 0;
	r[4] = 0; r[5] = s.y; r[6] = 0; r[7] = 0;
	r[8] = 0; r[9] = 0; r[10] = s.z; r[11] = 0;
	r[12] = 0; r[13] = 0; r[14] = 0; r[15] = 1;
}



int main(int argc, char* argv[])
{
    parser::Scene scene;
    scene.loadFromXml(argv[1]);

	std::vector<std::string> transforms;
	for (auto mesh : scene.meshes) {

		std::string temp = "";
		for (char i : mesh.transformations) {
			
			if (i == ' ') {
				transforms.push_back(temp);
				temp = "";
			}
			else {
				temp += i;
			}
		}
		transforms.push_back(temp);
	}

	std::vector<double> result(16) ; // transformation matris hesaplanıp resultda tutulacak.
	Identity(result);
	for (auto i : transforms) {
		int temp = std::stoi(i.substr(1,i.size())); // transform id'yi str'den int'e çeviriyor.

		if (i[0] == 't') { // translation
			std::vector<double> m2;
			std::vector<double> m1(16);
			m2 = result;
			Translate(scene.translations[temp-1],m1);
			matrixMult(m1,m2,result);
		}

		else if (i[0] == 'r') { // rotation
			scene.rotations[temp-1];
		}

		else if (i[0] == 's') { // scaling
			
		}
	}

	// aynı işlem triangle ve sphere için de yapılacak.

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
