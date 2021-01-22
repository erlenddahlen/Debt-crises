
% Defining constants
D = 0; %bank's outstanding loans
M = 0; %deposit money 
R = 1; %bank's reserves at Central Bank 
K = D+R-M; %bank's capital 
i_l = 0.055; %interest rate on loans
i_m = 0.03; %interest rate on deposit money 
lambda = 0.002; %pre-crisis loss rate on loans
rate = 0.1; %loan repayment rate
sigma = 0.28; %share of net income left for the bank
K_0 = 0.08; %min.(C/A) ratio

T_i = 8; %I-gain
K_p = 0.5; %Proportional gain for new loans

sim_time = 50;

out = sim('bank_bootstrapping', sim_time);

time = out.D.time;
length_index = size(time,1);

R_vector = R*ones(1,length_index);

% Plot
figure('rend','painters','pos',[1 600 750 400])
hold on;
plot(time,R_vector);
plot(out.M);
plot(out.D);
title("Money, debt and reserves for a bootstrapped bank");
xlabel("Time [Year]");
ylabel("");
grid on;
hold off;
legend({"R", "M", "D"}, "Location", "northeast");