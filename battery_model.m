function SOC = battery_model(time, Power)

Capacity = 4000; % Wh

Energy = cumtrapz(time, Power) / 3600; % convert to Wh

SOC = 1 - (Energy / Capacity);

end