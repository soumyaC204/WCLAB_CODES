clc;
clear all;
close all;
frequency = 2.4e9;
speed_of_light = 3e8;
velocity_receiver = 30;
wavelength = speed_of_light / frequency;
t = linspace(0, 10, 100);
doppler_shift_increasing = zeros(size(t));
doppler_shift_decreasing = zeros(size(t));
doppler_shift_constant = zeros(size(t));
for i = 1:length(t)
 theta_increasing = pi * t(i) / 10;
 theta_decreasing = pi - pi * t(i) / 10;
 theta_constant = pi / 2;
 
 doppler_shift_increasing(i) = (velocity_receiver / wavelength) * cos(theta_increasing);
 doppler_shift_decreasing(i) = (velocity_receiver / wavelength) * cos(theta_decreasing);
 doppler_shift_constant(i) = (velocity_receiver / wavelength) * cos(theta_constant);
end
figure;
plot(t, doppler_shift_increasing, 'b', 'LineWidth', 2);
hold on;
plot(t, doppler_shift_decreasing, 'r', 'LineWidth', 2);
plot(t, doppler_shift_constant, 'g', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Doppler shift (Hz)');
title('Doppler Shift for Different Values of Theta');
legend('Increasing Theta', 'Decreasing Theta', 'Constant Theta');
grid on;
