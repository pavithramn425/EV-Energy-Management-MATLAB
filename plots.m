function plots(time, speed, Power, SOC)

figure
plot(time, speed)
xlabel('Time')
ylabel('Speed (km/h)')
title('EV Drive Cycle')

figure
plot(time, Power/1000)
xlabel('Time')
ylabel('Power (kW)')
title('Motor Power Consumption')

figure
plot(time, SOC)
xlabel('Time')
ylabel('Battery SOC (%)')
title('Battery State of Charge')

figure
range = (SOC/100) * 400;
plot(time, range)
xlabel('Time (seconds)')
ylabel('Estimated Range (km)')
title('EV Remaining Driving Range')
grid on

end