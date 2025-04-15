clc;
clear all;
close all;


clear
N = 10^6 ;
ip = rand(1,N)>0.5 ;
s = 2*ip-1;

Eb_N0_dB = [-3:35];

for ii = 1:length(Eb_N0_dB)

   n = 1/sqrt(2)*[randn(1,N) + j*randn(1,N)];
   x_1 = [randn(1,N) ];
   x_2 = [randn(1,N) ];
   h = sqrt(x_1.^2+x_2.^2);
   y = h.*s + 10^(-Eb_N0_dB(ii)/10)*n;
     y2= s + 10^(-Eb_N0_dB(ii)/10)*n;
   yHat = y./h;
   ipHat = real(yHat)>0;
   ipHat2=real(y2)>0;
   nErr(ii) = size(find([ip- ipHat]),2);
   nErr2(ii)=size(find([ip- ipHat2]),2);

end

simBer = nErr/N;
simBer2 = nErr2/N;

close all
figure
semilogy(Eb_N0_dB,simBer,'cd-','LineWidth',2);
hold on
semilogy(Eb_N0_dB,simBer2,'bp-','LineWidth',2);
grid on
legend('Rayleigh-Theory','AWGN-Theory');
xlabel('Eb/No, dB');
ylabel('Bit Error Rate');
title('BER for BPSK modulation in Rayleigh channel');
