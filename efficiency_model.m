function [energy_total, efficiency] = efficiency_model(time, Power, speed)

% Total energy used (kWh)
energy_total = trapz(time, Power)/3600000;

% Distance travelled (km)
distance = trapz(time, speed)/3600;

% Efficiency (Wh/km)
efficiency = (energy_total*1000)/distance;

end