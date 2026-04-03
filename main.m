clc
clear
close all

[time, speed] = drive_cycle();

Power = power_model(time, speed);

SOC = battery_model(time, Power);

[energy_total, efficiency] = efficiency_model(time, Power, speed);

range = range_estimator(SOC);

temperature = thermal_model(time, Power);

plots(time, speed, Power, SOC);

figure
plot(time, temperature)
xlabel('Time (seconds)')
ylabel('Battery Temperature (°C)')
title('Battery Temperature Simulation')
grid on

figure
energy = cumtrapz(time, Power)/3600000; % cumulative energy in kWh

plot(time, energy)
xlabel('Time (seconds)')
ylabel('Energy Used (kWh)')
title('EV Energy Consumption Over Time')
grid on

disp(['Total Energy Used (kWh): ', num2str(energy_total)])
disp(['EV Efficiency (Wh/km): ', num2str(efficiency)])
disp(['Estimated Remaining Range (km): ', num2str(range(end))])

figure('Name','EV Smart Energy Dashboard','Color','w')

subplot(3,2,1)
plot(time, speed,'LineWidth',2)
title('EV Speed')
xlabel('Time (s)')
ylabel('Speed (km/h)')
grid on

subplot(3,2,2)
plot(time, Power/1000,'LineWidth',2)
title('Motor Power')
xlabel('Time (s)')
ylabel('Power (kW)')
grid on

subplot(3,2,3)
plot(time, SOC,'LineWidth',2)
title('Battery SOC')
xlabel('Time (s)')
ylabel('SOC (%)')
grid on

subplot(3,2,4)
plot(time, range,'LineWidth',2)
title('Remaining Range')
xlabel('Time (s)')
ylabel('Range (km)')
grid on

subplot(3,2,5)
plot(time, temperature,'LineWidth',2)
title('Battery Temperature')
xlabel('Time (s)')
ylabel('Temperature (°C)')
grid on

subplot(3,2,6)
energy = cumtrapz(time, Power)/3600000;
plot(time, energy,'LineWidth',2)
title('Energy Consumption')
xlabel('Time (s)')
ylabel('Energy (kWh)')
grid on