% This script tests the function convPlateFD
%
% Define parameters,
% Thermal diffusivities (copper and plastic) obtained from: 
% https://www.engineersedge.com/heat_transfer/thermal_diffusivity_table_13953.htm
%
% Diamond (99% 12C) obtained from following paper:
% https://web.stanford.edu/group/fayer/articles/176.pdf
%
% a = thermal diffusivity of material (m^2/s)
% t = total time observing is (s)
% N = length of square grid
% k = thermal conductivity (W/mC)

% Case 1 - copper
a = 1e-4;
t = 100;
N = 50;
k = 386;

% Case 2 - PVC plastic
% a = 8e-8;
% t = 100;
% N = 200;
% k = 0.19;

% Case 3 - Diamond
% a = 1.2e-3;
% t = 100;
% N = 14;
% k = 2200;

h = 60; % heat transfer coefficient (W/m^2C)
nt = 100; % number of time steps
length = 1; % length of square plate (m)
T_inf = 100; % temperature of surrounding air (C)
T_init = 200; % inital temperature of square copper plate (C)

% Call function to obtain spatial temperature vs time grid
[T] = convPlateFD(a, t, nt, length, T_inf, T_init, N, h, k);

% Plot contour heat map of spatial temperature time evolution
figure(1)
for i = 2:nt
    [C, h] = contourf(T(:, :, i));
    title(['2D-transient heat transfer with convection for ' ...
        , num2str(i*(t/nt)), ' seconds.'])
    xlabel(['Length (1/', num2str(N), ' m)'])
    ylabel(['Width (1/', num2str(N), ' m)'])
    clabel(C,h);
    hold off
    drawnow
    pause(0.1)
end