% Great Circle Distance (Haversine formula) between two geographic points
function distance = haversine(lat1, lon1, lat2, lon2)
    % lat1, lon1: Latitude and Longitude of first point (in degrees)
    % lat2, lon2: Latitude and Longitude of second point (in degrees)
    
    % Convert degrees to radians
    lat1 = deg2rad(lat1);
    lon1 = deg2rad(lon1);
    lat2 = deg2rad(lat2);
    lon2 = deg2rad(lon2);
    
    % Haversine formula
    dlat = lat2 - lat1;
    dlon = lon2 - lon1;
    
    a = sin(dlat/2)^2 + cos(lat1) * cos(lat2) * sin(dlon/2)^2;
    c = 2 * atan2(sqrt(a), sqrt(1-a));
    R = 6371e3; % Earth radius in meters
    
    distance = R * c; % Distance in meters
end