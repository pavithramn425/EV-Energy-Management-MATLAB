function temperature = thermal_model(time, Power)

% Initial battery temperature
T0 = 25; % °C

% Heat generation coefficient
k = 0.0005;

temperature = zeros(size(time));
temperature(1) = T0;

for i = 2:length(time)
    
    heat_generated = k * abs(Power(i));
    
    temperature(i) = temperature(i-1) + heat_generated;

end

end