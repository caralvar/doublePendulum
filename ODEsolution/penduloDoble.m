function ssPenduloDoble = penduloDoble(t,x)
    l = 10.0;
    g = 9.80;
    
    theta1 = x(1);
    theta2= x(2);
    w1 = x(3);
    w2 = x(4);

    dtheta1=0;
    dtheta2=0;
    dw1=0;
    dw2=0;
    
    dtheta1 = w1;
    dtheta2 = w2;
    
    dw1 = (-9/8)*(g/l)*sin(theta1)-(3/8)*dw2*cos(theta1-theta2)-(3/8)*w2*w2*sin(theta1-theta2);
    dw2 = (-3/2)*(g/l)*sin(theta2)-(3/2)*dw1*cos(theta1-theta2)+(3/2)*w1*w1*sin(theta1-theta2);
    
    
    ssPenduloDoble = [dtheta1;dtheta2;dw1;dw2]
  
end
    