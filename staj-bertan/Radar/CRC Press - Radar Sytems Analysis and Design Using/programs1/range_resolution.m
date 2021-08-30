function [delta_R] = range_resolution(bandwidth,indicator)
% This function computes radar range resolution in meters
% the bandwidth must be in Hz ==> indicator = Hz.
% Bandwidth may be equal to (1/pulse wdith)==> indicator = seconds
c = 3.e+8;
if(indicator == 'hz')
   delta_R = c / (2.0 * bandwidth); 
else
   delta_R = c * bandwidth / 2.0;
end
return





