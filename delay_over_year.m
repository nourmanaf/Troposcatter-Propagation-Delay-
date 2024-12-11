function delay_over_months = delay_over_year(path_length,p,t,e0)

    c = 299792458; % Speed of light in m/s

    H1 = zeros();
    H1(1:1000) = linspace(1,1600,1000);
    H1(1001:2000) = linspace(1600,1,1000);
    
    delay_over_months = zeros();

    for j = 1:24
        e1 = e0(j) * exp(-H1 / 2000);
    for i = 1: 2000
   
    [P, T] = atmosphere_conditions(H1,p(j),t(j)); % Transmitter location
    
    end
   
    n1 = refractive_index(P, T, e1);
   
    delay_path = path_length * (n1 - 1) / (2000);
    delay_path = sum(delay_path);
    
    delay_over_months(j) = delay_path-48;            

    end
        
end