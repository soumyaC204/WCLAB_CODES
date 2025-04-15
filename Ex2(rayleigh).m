clc
clear all
close all
% Define the parameters of the Rayleigh Distribution
% Standard deviation
sigma_1 = 1;
sigma_2 = 1.75;
sigma_3 = 2.5;
% Generate random samples from the Rayleigh Distribution
sample_size = 1000;
random_samples_1 = sigma_1 * randn(sample_size, 1);
random_samples_2 = sigma_2 * randn(sample_size, 1);
random_samples_3 = sigma_3 * randn(sample_size, 1);
% x = Range of values for PDF & CDF
x = linspace(0, 10, 1000);
% Compute the PDF & CDF
pdf_values_1 = (x / sigma_1^2) .* exp(-(x.^2) / (2*sigma_1^2));
pdf_values_2 = (x / sigma_2^2) .* exp(-(x.^2) / (2*sigma_2^2));
pdf_values_3 = (x / sigma_3^2) .* exp(-(x.^2) / (2*sigma_3^2));
cdf_values_1 = 1 - exp(-(x.^2) / (2*sigma_1^2));
cdf_values_2 = 1 - exp(-(x.^2) / (2*sigma_2^2));
cdf_values_3 = 1 - exp(-(x.^2) / (2*sigma_3^2));
% Plot the PDF
figure;
plot(x, pdf_values_1, 'r-', 'LineWidth', 2); hold on
plot(x, pdf_values_2, 'g--', 'LineWidth', 2);
plot(x, pdf_values_3, 'b-.', 'LineWidth', 2); hold off
legend("σ = 1","σ = 1.75","σ = 2.5");
title('Probability Density Function (PDF) of Rayleigh Distribution');
xlabel('Random Variable (X)');
ylabel('PDF f(x)');
grid on;
% Plot the CDF
figure;
plot(x, cdf_values_1, 'r-', 'LineWidth', 2); hold on
plot(x, cdf_values_2, 'g--', 'LineWidth', 2);
plot(x, cdf_values_3, 'b-.', 'LineWidth', 2); hold off
legend("σ = 1","σ = 1.75","σ = 2.5");
title('Cumulative Distribution Function (CDF) of Rayleigh Distribution');
xlabel('Random Variable (X)');
ylabel('CDF f(x)');
grid on;
