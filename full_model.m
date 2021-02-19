
% BANKING
D = 0; %bank's outstanding loans
M = 0; %deposit money 
R = 1; %bank's reserves at Central Bank 
K = D+R-M; %bank's capital 
i_cb = 0.03; %central bank interest rate 
i_diff = 0.025; %interest-margin for banks
%i_l = 0.055; %interest rate on loans
%i_m = 0.03; %interest rate on deposit money 
lambda = 0.002; %pre-crisis loss rate on loans
rate = 0.1; %loan repayment rate
sigma = 0.28; %share of net income left for the bank
K_0 = 0.08; %min.(C/A) ratio
buffer = 0.0; %counter-cyclical capital buffer
hike = 0.0; %interest rate hike

T_i = 8; %I-gain 8
K_p = 15; %Proportional gain for new loans 0.5

% REAL ECONOMY 
tx = 0.3; 
gov = 0.5; %gov spend split between households and firms
%c_fi = 0.2; %Financialisation: How much money is invested financially
sigma_k = 0.25; %Share being consumed vs. re-lent
w = 0.7; %share of output going to wages
re = 0.3; %re-investments for firms

% MARKET
i_k = 0.04; %interest rate on D_k
r_k = 0.1; %repayment rate on D_k
lambda_k = 0.005; %loss rate on D_k



%%% TIME LAGS
T_g = 1; %Government, one year
T_f = 0.5; %Firms, half a year
T_h = 0.1; %Households, one month
T_k = 0.1; %Capitalists, one month


sim_time = 50;

out = sim('sim_full', sim_time);

time = out.D.time;
length_index = size(time,1);

R_vector = R*ones(1,length_index);

% PLOTS

% Growth in M, D and R
figure('rend','painters','pos',[1 600 750 400])
hold on;
plot(out.M, 'b:', 'LineWidth',2);
plot(out.D, 'c', 'LineWidth',2);
plot(out.D_k, 'g', 'LineWidth',2);
plot(time,R_vector, 'r--', 'LineWidth',2);
title("Money, debt and reserves for a bootstrapped bank");
xlabel("Time [Year]");
ylabel("");
grid on;
hold off;
legend({"M", "D", "D_k", "R"}, "Location", "northeast");

% Income, debt service and taxes
figure('rend','painters','pos',[1 600 750 400])
hold on;
plot(out.Income, 'b:', 'LineWidth',2);
plot(out.Debt_service, 'c', 'LineWidth',2);
%plot(out.Taxes);
%plot(out.Debt_service+out.Taxes);
plot(out.Flow, 'r--', 'LineWidth',2);
title("Income, debt service and new loans for households");
xlabel("Time [Year]");
ylabel("");
grid on;
hold off;
legend({"Income", "Debt service", "New loans"}, "Location", "northeast");
