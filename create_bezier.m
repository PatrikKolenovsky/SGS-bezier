function [ control_colection] = create_bezier(number_of_curves, smoothnest, population_size, max_fes)

% number_of_curves = 12;
% smoothnest = true;
% population_size = 50;
% max_fes = 150000;

function_length = max_fes / population_size;
Ry = generate_points(number_of_curves, smoothnest);
Points_Y = [];
Points_X = [];

index = 1;
step_x = (function_length / (length(Ry) + 1));
thickness = function_length / number_of_curves;

for i = 1 : number_of_curves
    if(i == 1)
        Points_Y = [Ry(index) Ry(index + 1) Ry(index + 2) Ry(index + 3)];
        Points_X = [0 step_x (step_x * (index + 1)) (step_x * (index + 2))];
    else
        Points_Y = [Points_Y, Ry(index + 1) Ry(index + 2) Ry(index  + 3)];
        if (i == number_of_curves)
           Points_X = [Points_X, (step_x * index) (step_x * (index + 1)) function_length];
        else
           Points_X = [Points_X, (step_x * index) (step_x * (index + 1)) (step_x * (index + 2))];
        end 
    end 
    index = index + 3; 

end 

curves = [];
index = 1;
for i = 1 : number_of_curves
    Px0 = Points_X(index);
    Px1 = Points_X(index + 1);
    Px2 = Points_X(index + 2);
    Px3 = Points_X(index + 3);
    Py0 = Points_Y(index);
    Py1 = Points_Y(index + 1);
    Py2 = Points_Y(index + 2);
    Py3 =  Points_Y(index + 3);
    new_curve = create_curve(Px0, Px1, Px2, Px3, Py0, Py1, Py2, Py3, thickness);
    curves = [curves, new_curve];   
    index = index + 3;
end 

control_colection = resample_colection(curves, function_length);
plot(control_colection)