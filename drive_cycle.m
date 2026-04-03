function [time, speed] = drive_cycle()

time = 0:1:600;

speed = 40 + 10*sin(0.02*time) + 5*sin(0.08*time);

speed(speed < 0) = 0;

end