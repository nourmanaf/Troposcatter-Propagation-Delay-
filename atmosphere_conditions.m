function [P, T] = atmosphere_conditions( H ,p,t)
    % lat: Latitude of the location (in degrees)
    % H: Altitude in meters
    P0_standard =  p; % Standard pressure at sea level in hPa
    T0_standard =  t; % Standard temperature at sea level in K
    % Standard temperature and pressure at sea level
    P0 = P0_standard; % Pressure at sea level (hPa)
    T0 = T0_standard; % Temperature at sea level (K)
    g = 9.81; % Gravitational acceleration in m/s^2
    % Temperature adjustment based on latitude (simplified for demonstration)
    % Assume near constant temperature adjustment per degree of latitude for simplicity
    % Real models would use more complex meteorological data.
    L = 0.0065; % Temperature lapse rate (K/m)
    M = 0.0289644; % Molar mass of Earth's air in kg/mol
    % Adjust temperature for latitude (example: temperature decreases slightly with latitude)
    % This is a simplified model, real models would consider seasonal variations.
    T = T0 - L * H; % Linear lapse rate
    R_gas = 8.31447; % Universal gas constant in J/(mol*K)
    % Use the ISA model to calculate the pressure at given altitude
    P = P0 * (1 - L * H / T0).^(g * M / (R_gas * L)); % Pressure in hPa
end