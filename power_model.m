function Power = power_model(time, speed)

m = 150; % mass of vehicle (kg)

v = speed / 3.6; % convert km/h to m/s

dv = gradient(v, time); % acceleration

Power = m .* v .* dv; % simple power

Power(Power < 0) = 0; % remove negative values

end