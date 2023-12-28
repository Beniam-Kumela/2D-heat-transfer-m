% This script solves the lumped parameter heat analysis problem of the
% form:
%
% rho*Cp*V*dT/dt = -hA(T-T_surr)
%
% using the RK4 method.
%

% Initialize variables
N = 50;
tvec = linspace(0, 200, N)';
T_init = 25 + 273;
T_surr = 200 + 273;
rho = 8500;
Cp = 400;
k = 20;
h = 400;
d = 0.004;
Bi = h*d/k;

% Check validity of lumped parameter analysis
if (Bi < 0.1)
    disp(['Lumped parameter analysis is valid. Biot Number: ', num2str(Bi)])
else
    disp(['Lumped parameter analysis is not valid. Biot Number: ', num2str(Bi) ...
        , ' It needs to be less than 0.1'])
end

% Integrate with Runge-Kutta
[t, T_numerical] = odeRK4((@(t, T) -h * (T-T_surr)/(rho * Cp * d)) ...
    , tvec, T_init);

% Analytical solution
T_actual = T_surr - (T_surr - T_init) * exp((-h / (rho * Cp * d)) * t);

% Compute error
error = norm(T_actual-T_numerical);

% Plot solution
figure(1)
plot(t, T_numerical, 'o', t, T_actual, 'g')
title('Lumped System Analysis Transient Heat Flow (RK4 Method)')
xlabel('Time (s)')
ylabel('Temperature (K)')
legend('Numerical Solution', 'Analytical Solution')
grid