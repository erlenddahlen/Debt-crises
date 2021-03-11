
% BANKING
D = 0; %bank's outstanding loans
M = 0; %deposit money 
R = 1; %bank's reserves at Central Bank 
K = D+R-M; %bank's capital 
i_cb = 0.1; %central bank interest rate 
i_diff = 0.025; %interest-margin for banks
%i_l = 0.055; %interest rate on loans
%i_m = 0.03; %interest rate on deposit money 
lambda = 0.002; %pre-crisis loss rate on loans
rate = 0.1; %loan repayment rate
sigma = 0.28; %share of net income left for the bank
K_0 = 0.08; %min.(C/A) ratio
buffer = 0.0; %counter-cyclical capital buffer
hike = 0.01; %interest rate hike

T_i = 8; %I-gain 8
K_p = 15; %Proportional gain for new loans 0.5

% REAL ECONOMY 
tx = 0.3; 
gov = 0.5; %gov spend split between households and firms
c_d = 0.3; %Financialisation: How much money is invested financially
c_s = 0.5; 
c_g = 0.2;
s_k = 0.2; %Share being consumed vs. re-lent
w = 0.4; %share of output going to wages
re = 0.3; %re-investments for firms
pi = 0.4; 

% MARKET
i_k_p = 0.05; %interest rate premium on D_k

r_k = 0.1; %repayment rate on D_k
lambda_k = 0.005; %loss rate on D_k

% TIME LAGS
T_g = 1; %Government, one year
T_f = 0.5; %Firms, half a year
T_h = 0.1; %Households, one month
T_k = 0.1; %Capitalists, one month

% SIMULATION
sim_time = 50;
out = sim('sim_part1', sim_time);

% PLOTTING  
eps = 0.00001; %Used to avoid diving by zero in some instances
time = out.D.time;
length_index = size(time,1);
R_vector = R*ones(1,length_index);

% PLOTS

% Growth in M, D and R
figure('rend','painters','pos',[1 600 750 400])
hold on;
plot(out.M, 'b:', 'LineWidth',2);
plot(out.D, 'c', 'LineWidth',2);
plot(time,R_vector, 'r--', 'LineWidth',2);
title("Money, debt and reserves for a bootstrapped bank");
xlabel("Time [Year]");
ylabel("");
grid on;
hold off;
legend({"M", "D", "R"}, "Location", "northeast");

% Income, debt service and taxes
figure('rend','painters','pos',[1 600 750 400])
hold on;
plot(out.Income, 'b:', 'LineWidth',2);
plot(out.Debt_service, 'c', 'LineWidth',2);
plot(out.Flow, 'r--', 'LineWidth',2);
axis([0 sim_time 0 20])
title("Income, debt service and new loans for households");
xlabel("Time [Year]");
ylabel("");
grid on;
hold off;
legend({"Income", "Debt service", "New loans"}, "Location", "northeast");

% Non-Bank Debt, Equity Invested and Yo
figure('rend','painters','pos',[1 600 750 400])
hold on;
plot(out.D_k, 'b:', 'LineWidth',2);
plot(out.equity, 'c', 'LineWidth',2);
plot(out.D_g, 'g', 'LineWidth',2);
plot(out.Yo, 'r--', 'LineWidth',2);
title("Non-bank debt, Equity and Yo");
xlabel("Time [Year]");
ylabel("");
grid on;
hold off;
legend({"D_k", "Equity", "D_g", "Yo"}, "Location", "northeast");

% Debt service level and debt ratio
figure('rend','painters','pos',[1 600 750 400])
hold on;
plot(out.Dc_ratio, 'c', 'LineWidth',2);
plot(out.Dh_ratio, 'r--', 'LineWidth',2);
plot(out.Dg_ratio, 'g', 'LineWidth',2);
title("Debt ratios");
xlabel("Time [Year]");
ylabel("");
grid on;
hold off;
legend({"D_c ratio", "D_h ratio", "D_g ratio"}, "Location", "northeast");

% Growth rate & rates
figure('rend','painters','pos',[1 600 750 400])
hold on;
plot(out.y_g, 'b:', 'LineWidth',2);
plot(out.i_cb, 'c', 'LineWidth',2);
plot(out.m_g, 'r--', 'LineWidth',2);
axis([0 sim_time -0.02 0.12])
title("Growth rate");
xlabel("Time [Year]");
ylabel("");
grid on;
hold off;
legend({"y_g", "i_cb", "m_g"}, "Location", "northeast");

% Loss rates 
figure('rend','painters','pos',[1 600 750 400])
hold on;
plot(out.loss_b, 'b:', 'LineWidth',2);
plot(out.loss_f, 'c', 'LineWidth',2);
axis([0 sim_time 0 0.05])
title("Loss rates");
xlabel("Time [Year]");
ylabel("");
grid on;
hold off;
legend({"l_b", "l_f"}, "Location", "northeast");

% DSL 
figure('rend','painters','pos',[1 600 750 400])
hold on;
plot(out.DSL_h, 'b:', 'LineWidth',2);
plot(out.DSL_f, 'c', 'LineWidth',2);
%axis([0 sim_time -0.04 0.12])
title("Debt service levels");
xlabel("Time [Year]");
ylabel("");
grid on;
hold off;
legend({"housing", "firms"}, "Location", "northeast");



