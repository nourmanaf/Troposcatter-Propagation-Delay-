% Function to calculate refractive index as a function of height (Saastamoinen model)
% n = 1 + (P / T) * (a + b * e)
% where P = atmospheric pressure, T = temperature, e = water vapor pressure

% Model of refractive index (simplified)
function n = refractive_index(P, T, e)
  % P: atmospheric pressure (hPa), T: temperature (K), e: water vapor pressure (hPa)
    % Using the formula n = (77.6*P/T - 5.6*e/T + 3.75e5*e^2/T^2) * 10^-6 + 1
    
    n = (77.6 .* P ./ T - 5.6 .* e ./ T + 3.75e5 .* e ./ (T.^2)) * 1e-6 + 1;
end