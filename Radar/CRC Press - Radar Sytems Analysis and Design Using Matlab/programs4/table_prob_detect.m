% This program is used to produce Table C.1
clear all
fid = fopen('Prob_Table','w');
index = 0;
for snr = 1:0.05:16
   index = index +1;
   a = sqrt(2.0 * 10^(.1*snr));
   for nfa = 2:1:15
      b = sqrt(-2.0 * log(10^(-nfa)));
      pro(index,nfa) = marcumsq(a,b);
      fprintf(fid,'%5.4f  ',(pro(index,nfa)));
   end
   index = 0;
   fprintf(fid,'\n');
end
fclose(fid);
fid = fopen ('SNR','w')
snr = 1:.05:16;
fprintf(fid,'%5.3f \n',snr')
fclose(fid)