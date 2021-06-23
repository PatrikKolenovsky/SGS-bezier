number_of_curves = 12;
smoothnest = true;
population_size = 100;
max_fes = 150000;

result = create_bezier(number_of_curves, smoothnest, population_size, max_fes);
plot(result)