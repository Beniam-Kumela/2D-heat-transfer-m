# Multi-dimensional Unsteady State Heat Transfer (MATLAB)

This repository contains a MATLAB implementation of modelling 2D unsteady state heat transfer. 3 scenarios are tested:

1. 2D Transient Conduction on Square Plate with Convective Fluid Boundary Conditions.
2. 2D Transient Conduction on Square Plate with Constant Temperature Boundary Conditions
3. Transient Conduction on Thermocouple Head (Lumped Parameter Analysis Heat Transfer).

A variety of different materials were chosen to evaluate the effect of thermal diffusivity and conductivity have on the transient temperature profile including:

<img width="485" alt="image" src="https://github.com/Beniam-Kumela/2D-heat-transfer-m/assets/106757076/31f23544-0814-45f4-89c3-1edebb26a38a">

## Table of Contents

1. [Features](/README.md#features)
2. [Dependencies](/README.md#dependencies)
3. [Building and Running](/README.md#building-and-running)
4. [Examples](/README.md#examples)
5. [Contributing](/README.md#contributing)
6. [Research Paper](/README.md#research-paper).
7. [License](/README.md#license)

## Features

- convPlateFD.m – function which solves Scenario 1 (convection boundary condition) using finite difference method.
- test_convPlateFD.m – test script for convPlateFD.m.
- condPlateFD.m – function which solves Scenario 2 (constant temperature boundary conditions) finite difference method.
- test_condPlateFD.m – test script for function
- odeRK4.m – function solver for 4th order Runge-Kutta method
- lumpCondIVP.m – test script for Scenario 3 (lumped parameter heat analysis)

## Dependencies

This project depends on the following being installed with appropriate license

- MATLAB

## Building and Running

1. Download the .zip file by pressing the green "Code" button and selecting "Download ZIP".
2. Extract all components of the .zip file to the location on your computer where the MATLAB program is running.
3. Add files to MATALB path (ex: https://www.mathworks.com/help/matlab/matlab_env/what-is-the-matlab-search-path.html)
4. Run test scripts to view results

### Customization

If any edits want to be made to the code, navigate to the function files discussed in the Features section. Some interesting edits to make include: using other materials with different thermal conductivity and/or diffusivity values, trying varying initial temperature profiles, changing convective fluid properties such as convection heat transfer coefficient (h) and/or heat capacity (C_p).

## Examples

Temperature profile for copper plate, convection boundary conditions, after 100 seconds.

![image](https://github.com/Beniam-Kumela/2D-heat-transfer-m/assets/106757076/460b7a0b-4c20-4901-9021-6a10e5641360)


Temperature profile for plastic plate, constant temperature boundary conditions, after 100 seconds.

![image](https://github.com/Beniam-Kumela/2D-heat-transfer-m/assets/106757076/1f8b89f5-3509-4a7b-a509-bada7574949f)

Lumped system analysis treatment for geometry given in Scenario 3 with numerical approximation (RK4) compared with analytical solution over 200 seconds.

![image](https://github.com/Beniam-Kumela/nD-heat-transfer-m/assets/106757076/da79bf9d-b7cd-46da-a7ae-d70db99749fa)

## Contributing

Contributions are welcome! Please feel free to open an issue or submit a pull request if you find a bug, have a feature request, or would like to improve the project in any way. 

For the future, maybe some implicit, direct, and linear algebra-based schemes could have been used for Scenarios 1 and 2 to reduce computation time needed for the iterative finite difference method utilized. This also reduces the restriction required for stability so smaller time steps or grid sizes could be used. A slightly more accurate model for Scenario 1 would have included forced convection and temperature dependent thermal conductivity.

## Research Paper

More information on numerical method derivations, assumptions, problem statements, results, interpretations, and resources can be found in the following paper I wrote:

[MATLAB nD-Heat Transfer Simulations.pdf](https://github.com/Beniam-Kumela/2D-heat-transfer-m/files/13784634/MATLAB.nD-Heat.Transfer.Simulations.pdf)

## License

This project is licensed under the MIT License.
