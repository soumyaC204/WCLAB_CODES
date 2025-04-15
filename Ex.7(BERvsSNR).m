clc;
clear all;
close all;
clear
N = 10^6;
ip = rand(1,N)>0.5;
s = 2*ip-1;
Eb_N0_dB = [-3:35];
for ii = 1:length(Eb_N0_dB)
 n = 1/sqrt(2)*[randn(1,N) + j*randn(1,N)];
 x_1 = [randn(1,N) ];
 x_2 = [randn(1,N) ];
 h = sqrt(x_1.^2+x_2.^2);
 y2 = h.*s + 10^(-Eb_N0_dB(ii)/10)*n;
 y1 = s + 10^(-Eb_N0_dB(ii)/10)*n;
 y2Hat = y2./h;
 ip2Hat = real(y2Hat)>0;
 ip1Hat = real(y1)>0;
 nErr2(ii) = size(find([ip- ip2Hat]),2);
 nErr1(ii) = size(find([ip- ip1Hat]),2);
end
simBerAWGN = nErr1/N;
simBer = nErr2/N;
theoryBerAWGN = 0.5*erfc(sqrt(10.^(Eb_N0_dB/10)));
EbN0Lin = 10.^(Eb_N0_dB/10);
theoryBer = 0.5.*(1-sqrt(EbN0Lin./(EbN0Lin+1)));
close all
figure
semilogy(Eb_N0_dB,simBerAWGN,'rs-','LineWidth',2);hold on
semilogy(Eb_N0_dB,theoryBerAWGN,'cd-','LineWidth',2);
semilogy(Eb_N0_dB,simBer,'mx-','LineWidth',2);
semilogy(Eb_N0_dB,theoryBer,'bp-','LineWidth',2);
axis([-3 35 10^-5 0.5])
grid on
title('BER for BPSK modulation in AWGN & Rayleigh channel');
xlabel('Eb/No, dB');
ylabel('Bit Error Rate');
legend('AWGN-Simulation', 'AWGN-Theory', 'Rayleigh-Simulation', 'Rayleigh-Theory');
