
% BANKING
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

T_i = 8; %I-gain 8
K_p = 15; %Proportional gain for new loans 0.5

% REAL ECONOMY 
tx = 0.25; 
gov = 0.5; %gov spend split between households and firms

%%% TIME LAGS
T_g = 1; %Government, one year
T_f = 0.5; %Firms, half a year
T_h = 0.1; %Households, one month


sim_time = 50;

out = sim('sim_bank_centralbank', sim_time);

time = out.D.time;
length_index = size(time,1);

R_vector = R*ones(1,length_index);

% PLOTS

% Growth in M, D and R
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

% Income, debt service and taxes
figure('rend','painters','pos',[1 600 750 400])
hold on;
plot(out.Debt_service);
plot(out.Income);
plot(out.Taxes);
plot(out.Debt_service+out.Taxes);
plot(out.bank_profits);
title("Income, debt service and taxes");
xlabel("Time [Year]");
ylabel("");
grid on;
hold off;
legend({"Debt service", "Income", "Taxes", "Debt service + Taxes", "bank profits"}, "Location", "northeast");
