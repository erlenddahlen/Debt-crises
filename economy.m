

T_g = 1; 
T_f = 1; 
T_h = 1; 
T_k = 1; 

pi = 0.5; 
tx = 0.5; 

start_g = 100;
start_f = 100; 
start_h = 100;

sim_time = 50;

out = sim('economy_sim', sim_time);

% Plot
figure('rend','painters','pos',[1 600 750 400])
hold on;
plot(out.GDP);
title("GDP");
xlabel("Time [Year]");
ylabel("");
grid on;
hold off;
legend({"GDP"}, "Location", "northeast");