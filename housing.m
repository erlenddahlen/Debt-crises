
% Defining constants
T_d = 20; %Duration on loans 
i = 0.04; %interest-rate on loans
T_b = 1; %Time-lag banks 

T_h = 1; %Time-lag housing
T_f = 1; %Time-lag firms 

D_0 = 1; %Initial debt in the system 

sim_time = 50;

out = sim('bank_housing', sim_time);

% Plot
figure('rend','painters','pos',[1 600 750 400])
hold on;
plot(out.D);
plot(out.I);
plot(out.profit);
title("Household debt");
xlabel("Time [Year]");
ylabel("");
grid on;
hold off;
legend({"D", "I", "profit"}, "Location", "northeast");