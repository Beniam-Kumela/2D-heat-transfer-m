function [t, y] = odeRK4(f, tvec, y0)
    % function [t, y] = odeRK4(f, tvec, y0)
    % 
    % This function integrates an ODE using the 4th order Runge-Kutta Method.
    %
    % ODE: y' = f(t,y)
    %

    % Initialize variables
    t = tvec;
    N = length(t);
    y = zeros(N, 1);
    dt = t(2) - t(1);
    dt2 = 0.5*dt;
    y(1) = y0;
    maxIter = 100;
    tol = sqrt(eps);

    % Integrate with 4th order Runge-Kutta Method
    for n=1:N-1
        k1 = f(t(n), y(n));
        k2 = f(t(n) + dt2, y(n) + dt2*k1);
        k3 = f(t(n) + dt2, y(n) + dt2*k2);
        k4 = f(t(n) + dt, y(n) + dt*k3);
        y(n+1) = y(n) + dt*((k1/6) + (k2/3) + (k3/3) + (k4/6));
    end
end
