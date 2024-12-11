% Latitude and Longitude for the transmitter and receiver
lat1 = 30.018055555555556; % Latitude of transmitter (in degrees)
lon1 = 32.47777777777778; % Longitude of transmitter (in degrees)

lat2 = 27.231666666666666; % Latitude of receiver (in degrees)
lon2 = 33.79194444444444; % Longitude of receiver (in degrees

elev_angle = 45;
distance = haversine(lat1, lon1, lat2, lon2);
elev_rad = deg2rad(elev_angle);
path_length =  distance / cos(elev_rad);

    %p = [1017,1016,1015,1014,1012,1011,1009,1009,1011,1014,1016,1017];
    %t = [287,289,293,297,300,305,307,307,304,299,294,289];
   % e0 = [7,8,9,10,11,12,13,13,11,10,8,7];
p = [1013, 1010, 1005, 1000, 995, 990, 985, 990, 995, 1000, 1005, 1010];

% Monthly Average Temperature (K)
t = [273, 278, 283, 288, 293, 298, 303, 302, 297, 290, 280, 275];

% Monthly Average Water Vapor Pressure (hPa)
e0 = [5, 6, 8, 10, 12, 15, 14, 13, 11, 9, 7, 6];    % Sample pressure (in hPa) over 72 hours (typical atmospheric pressure range)

% Pressure fluctuates around 1013 hPa
pressure = [1013.2, 1013.3, 1013.4, 1013.5, 1013.4, 1013.2, 1013.1, 1013.1, 1013.2, 1013.3, ...
            1013.4, 1013.5, 1013.6, 1013.7, 1013.8, 1013.8, 1013.7, 1013.6, 1013.5, 1013.4, ...
            1013.4, 1013.3, 1013.2, 1013.2];  % 24-hour pressure data

% Sample temperature (in Kelvin) over 24 hours
temperature = [298.1, 298.2, 298.4, 298.5, 298.7, 298.9, 299.0, 299.1, 299.2, 299.3, ...
              299.5, 299.6, 299.7, 299.8, 300.0, 300.1, 300.3, 300.4, 300.5, 300.7, ...
              300.8, 300.9, 301.0, 301.1];  % 24-hour temperature data

% Sample energy change (arbitrary units) based on temperature fluctuations
% Energy change is modeled as a simple function of temperature
energy_change = 8.2 + 0.4 * (temperature - 298) + randn(1,24) * 0.2;  % Energy change over 24 hours



%delay_path  = calculate_delay( path_length,p(1),t(1),e0(1))
delay_over_months = delay_over_year(path_length,pressure,temperature,energy_change);
%mean(delay_over_months)

%dev = (abs(delay_over_months(1)-delay_over_months(4)) + abs(delay_over_months(5)-delay_over_months(8)) +abs(delay_over_months(9)-delay_over_months(12)))/3

plot(delay_over_months)
xlabel('Hours');
ylabel('Delay(m)');
title('Delay Vs Day');
% Print results
%fprintf('Geometric delay: %.6f seconds\n', delay_geometric);
%fprintf('Path delay due to refractive index: %.9e seconds\n', delay_path);




