function ret = create_curve(Px0, Px1, Px2, Px3, Py0, Py1, Py2, Py3, n)

cx3=-Px0 + 3*(Px1-Px2) + Px3;
cy3=-Py0 + 3*(Py1-Py2) + Py3;
cx2=3*(Px0-2*Px1+Px2); 
cy2=3*(Py0-2*Py1+Py2);
cx1=3*(Px1-Px0);
cy1=3*(Py1-Py0);
cx0=Px0;
cy0=Py0;

dt=1/n;
Qx(1)=Px0; % Qx at t=0
Qy(1)=Py0; % Qy at t=0

for i=1:n  
    t=i*dt;
    Qx(i+1)=((cx3*t+cx2)*t+cx1)*t + cx0;
    Qy(i+1)=((cy3*t+cy2)*t+cy1)*t + cy0;  
end

ret = Qy;

end


