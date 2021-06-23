function [ Ry ] = generate_points( number_of_curves, smoothnest)

number_of_points = 4;
for i = 1:number_of_curves-1
    number_of_points = number_of_points + 3;
end

Ry = [];
for i = 1:number_of_points
    Ry = [Ry randi([10 100],1) /100];
end

for i = 1 : length(Ry)
   Ry(i) = Ry(i) - 0.5;
end    

if(smoothnest)
    pre_last = 3;
    last = 4;
    second = 5;
    for i = 1:number_of_curves
        Ry = [Ry randi([10 100],1) /100];
        if(Ry(pre_last) >= Ry(second))
            Ry(pre_last) = Ry(second) * (-1);
        else     
            Ry(second) = Ry(pre_last) * (-1);
        end
        Ry(last) = (Ry(pre_last) + Ry(second))/ 2;
        pre_last = pre_last + 3;
        second = second + 3;
        last  = last +3;

    end
    for i = 1:5
        Ry(end) = [];
    end
end

for i = 1 : length(Ry)
   Ry(i) = Ry(i) + 0.5;
end 
