//Sistema del doble pendulo
//aproximacion de Euler
//se puede mejorar con la de Runge-Kutta
//Largo de las barras (metros)
float l1 = 20.0;
float l2 = 10.0;
//Masa de las barras (kilogramos)
float m1 = 100.0;
float m2 = 100.0;
//Valores iniciales de la posicion de los angulos
float cita1 = radians(90.0);
float cita2 = radians(90.0);
//Velocidades angulares (rad/s)
float w1 = 0.0;
float w2 = 0.0;
//posicion al final de las barras
float x1,x2,y1,y2;
//Aceleracion gravitacional (m/s2)
float g = 1.0;
//Diferencial del tiempo
float dcita1;
float dw1;
float dcita2;
float dw2;
float dt = 0.02;
//ArrayList<PVector> points1 = new ArrayList<PVector>();
//ArrayList<PVector> points2 = new ArrayList<PVector>();

void setup() {
  size(800, 600);
  background(0);
  frameRate(60);
}

void draw() {
  
  background(0);
  //Definicion de los diferenciales de los angulos 
  //y velocidades angulares con el sistema de 
  //ecuaciones diferenciales.
   dw1 = ((-g*(2*m1+m2)*sin(cita1)-m2*g*sin(cita1-2*cita2)
              -2*sin(cita1-cita2)*m2*(w2*w2*l2+w1*w1*l1*cos(cita1-cita2)))/(l1*(2*m1
              +m2-m2*cos(2*cita1-2*cita2))))*dt;
              
   dw2 = ((2*sin(cita1-cita2)*(w1*w1*l1*(m1+m2)+g*(m1+m2)*cos(cita1)
              +w2*w2*l2*m2*cos(cita1-cita2)))/(l2*(2*m1+m2-m2*cos(2*cita1-2*cita2))))*dt;
  
  //Se suma el aporte del diferencial al angulo y 
  //velocidades angulares.
  w1 += dw1;
  w2 += dw2;
  cita1 += w1;
  cita2 += w2;
  
  w1 *= 0.99;
  w2 *= 0.99;
  

  x1 = -l1*sin(-cita1);
  y1 = l1*cos(-cita1);

  x2 = x1 - l2*sin(-cita2);
  y2 = y1 + l2*cos(-cita2); 

  //points1.add(new PVector(x1,y1));
  //points2.add(new PVector(x2,y2));
  
  translate(width/2,height/2);
  scale(10);
  stroke(255);
  strokeWeight(1);
  line(0,0,x1,y1);
  line(x1,y1,x2,y2);
  //stroke(0,0,255);
  //strokeWeight(0.2);
  //for (PVector v : points1){
  //  point(v.x,v.y);
  //}
  //for (PVector v : points2){
  //  point(v.x,v.y);
  //}
}