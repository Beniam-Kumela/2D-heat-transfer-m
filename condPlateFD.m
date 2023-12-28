function [T] = condPlateFD(a, t, nt, length, T_surr, T_init, N)
    % [T] = condPlateFD(a, t, nt, length, T_surr, T_init, N)
    %
    % This function solves a PDE boundary value problem for heat
    % conduction on a square plate of form:
    %
    % d^T/dx^2 + d^2T/dy^2 = (1/a)*(dT/dt)
    % on the domain 0 <= x <= 1, 0 <= y <= 1
    % 
    % with boundary conditions:
    %
    % T(x=0, y, t) = T(x=L, y, t) = T(y=0, x, t) = T(y=L, x, t) = T_surr
    % T(x, y, t=0) = T_init
    %
    % using the Forward Time-Centered Scheme finite difference method.
    %
    % Inputs:
    % a = thermal diffusivity (m^2/s)
    % t = total time (s)
    % nt = number of time steps
    % length = length of square plate side (m)
    % T_surr = surrounding boundary temperature (C)
    % T_init = initial temperature (C)
    % N = spatial grid size
    %
    % Outputs:
    % T = NxN array
    %
    % Written by Beniam Kumela 10/31/2023
    
    % Error checking
    if (a <= 0)
        error('condPlateFD: a must be greater than 0.')
    end
    
    if (t <= 0)
        error('condPlateFD: t must be greater than 0.')
    end

    if (nt <= 0)
        error('condPlateFD: nt must be greater than 0.')
    end
    if (length <= 0)
        error('condPlateFD: length must be greater than 0.')
    end

    if (T_surr == T_init)
        error('condPlateFD: T_surr cannot be equal to T_init.')
    end

    if (round(N) ~= N || (N < 3))
        error('condPlateFD: N must be positive integer greater than 3.')
    end

    % Initialize time step, step length, and dimensionless 
    % diffusion number.
    dt = (t/nt);
    dx = (length/N);
    d = (a*dt)/(dx^2);
    
    % Initialize temperature grids
    T_old = zeros(N, N);
    T_new = zeros(N, N);
    
    % Initial temperature distribution of plate
    T_old(:, :, 1) = T_init;
    T_new(:, :, 1) = T_init;
    
    % FTCS finite difference method algorithm derived from heat equation
    for n=1:nt
        for i=2:N-1
            for j=2:N-1
                T_new(i, j, n+1) = T_new(i, j, n) + d * (T_new(i+1, j, n) ...
                    + T_new(i, j+1, n) + T_new(i-1, j, n) + T_new(i, j-1, n) ...
                    - 4 * T_new(i, j, n));
            end
        end
        
        % Establish boundary conditions
        T_new(:, 1, n+1) = T_surr;
        T_new(1, :, n+1) = T_surr;
        T_new(:, N, n+1) = T_surr;
        T_new(N, :, n+1) = T_surr;

        % Swap grids
        T_old = T_new;

    end

    % Check that solution obtained was numerically stable.
    if (d <= 0.25)
        disp(['condPlateFD: Solution converged. D = ', num2str(d), ' and is' ...
            ' numerically stable.'])
    else
        disp(['condPlateFD: Solution did not converge. D = ', num2str(d), ...
            ' needs to be <= 0.25.'])
    end

    % Return final grid
    T = T_new;
end