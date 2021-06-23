function [ resampled_colection ] = resample_colection ( control_colection_Y, n )
resampled_colection = [];
for i = 1:n
    resampled_colection(i) = control_colection_Y(i);
end  

end

