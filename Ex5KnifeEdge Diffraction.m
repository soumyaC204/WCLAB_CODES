clc;
close all;
clear;
v = -5:1:5;
Gd1 = zeros(size(v));
Gd2 = zeros(size(v));
for i = 1:length(v)
 Gd1(i) = approximatedGd(v(i));
end
for i = 1:length(v)
 Gd2(i) = complexGd(v(i));
 Gd2(i) = 20 * log10(abs(Gd2(i)));
end
figure;
hold on;
plot(v, Gd1, 'b-', 'LineWidth', 2);
plot(v, Gd2, 'r--', 'LineWidth', 2);
grid on;
xlabel('$v$ (Fresnel Diffraction Parameter)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$G_d$ (dB)', 'Interpreter', 'latex', 'FontSize', 14);
title('Diffraction Gain vs. Fresnel Diffraction Parameter', 'FontSize', 16);
legend({'Approximated $G_d$', 'Complex $G_d$'}, 'Interpreter', 'latex', 'FontSize', 12, 'Location', 'Best');

function Gd = approximatedGd(v)
 if v <= -1
 Gd = 0;
 elseif -1 < v && v <= 0
 Gd = 20 * log10(0.5 - 0.62 * v);
 elseif 0 < v && v <= 1
 Gd = 20 * log10(0.5 * exp(-0.95 * v));
 elseif 1 < v && v <= 2.4
 Gd = 20 * log10(0.4 - sqrt(0.1184 - (0.38 - 0.1 * v)^2));
 else
 Gd = 20 * log10(0.225 / v);
 end
end

function Gd = complexGd(v)
 var = complex(0,1);
 f1 = @(t) exp((-var * pi * t.^2) / 2);
 f2 = integral(f1, v, 1000);
 Gd = ((1 + var) / 2) * f2;
end
