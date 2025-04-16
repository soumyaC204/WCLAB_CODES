clc;
clear all;
close all;

delay_us = [0,1,3,5];
power_dB =[-20,-10,0,-10];

power_linear=10.^(power_dB/10);
figure;

stem(delay_us,power_dB,'filled');
xlabel('Delay(/mus)');
ylabel('Power(dB)');
title('Power Delay Profile');
grid on;

mean_delay= sum(delay_us.* power_linear)/ sum(power_linear);

rms_delay_spread = sqrt(sum(power_linear.*(delay_us - mean_delay).^2)/sum(power_linear));

delay_spread = max(delay_us) - min(delay_us);
fprintf('Mean Delay(us):%4f\n', mean_delay);
fprintf('RMS Delay Spread(us):%4f\n', rms_delay_spread);
fprintf('Delay Spread(us):%4f\n',delay_spread);
