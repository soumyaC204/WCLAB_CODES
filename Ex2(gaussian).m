1) Gaussian Random Variable: -
clc
clear all
close all
% Define the parameters of the Gaussiam Distribution
% Mean
mu_1 = -1;
mu_2 = 0;
mu_3 = 2;
% Standard deviation
sigma_1 = 1;
sigma_2 = 1.25;
sigma_3 = 1.5;
% Generate random samples from the Gaussian Distribution
sample_size = 1000;
random_samples_1 = mu_1 + sigma_1 * randn(sample_size, 1);
random_samples_2 = mu_2 + sigma_2 * randn(sample_size, 1);
random_samples_3 = mu_3 + sigma_3 * randn(sample_size, 1);
% Compute the PDF & CDF
% x = linspace(mu - 4*sigma, mu + 4*sigma, 1000)
% x = Range of values for PDF & CDF
x = linspace(-5, 5, 1000);
pdf_values_1 = (1 / (sigma_1 * sqrt(2*pi))) * exp(-(x - mu_1).^2 / (2*sigma_1^2));
pdf_values_2 = (1 / (sigma_2 * sqrt(2*pi))) * exp(-(x - mu_2).^2 / (2*sigma_2^2));
pdf_values_3 = (1 / (sigma_3 * sqrt(2*pi))) * exp(-(x - mu_3).^2 / (2*sigma_3^2));
cdf_values_1 = 0.5 * (1 + erf((x - mu_1) / (sigma_1 * sqrt(2))));
cdf_values_2 = 0.5 * (1 + erf((x - mu_2) / (sigma_2 * sqrt(2))));
cdf_values_3 = 0.5 * (1 + erf((x - mu_3) / (sigma_3 * sqrt(2))));
% Plot the PDF
figure;
plot(x, pdf_values_1, 'r-', 'LineWidth', 2);
hold on
plot(x, pdf_values_2, 'g--', 'LineWidth', 2);
plot(x, pdf_values_3, 'b-.', 'LineWidth', 2);
title('Probability Density Function (PDF) of Gaussian Distribution');
legend("μ=-1, σ=1","μ=0, σ=1.25","μ=2, σ=1.5");
xlabel('Random Variable (X)');
ylabel('PDF f(x)');
grid on;
% Plot the CDF
figure;
plot(x, cdf_values_1, 'r-', 'LineWidth', 2);
hold on
plot(x, cdf_values_2, 'g--', 'LineWidth', 2);
plot(x, cdf_values_3, 'b-.', 'LineWidth', 2);
title('Cumulative Distribution Function (PDF) of Gaussian Distribution');
legend("μ=-1, σ=1","μ=0, σ=1.25","μ=2, σ=1.5", Location="northwest");
xlabel('Random Variable (X)');
ylabel('CDF F(x)');
grid on;
