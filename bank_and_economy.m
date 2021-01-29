% Defining constants
D = 0; %bank's outstanding loans
M = 0; %deposit money 
R = 1; %bank's reserves at Central Bank 
K = D+R-M; %bank's capital 
%i_l = 0.055; %interest rate on loans Trond 
i_l = 0.075; %interest rate on loans
i_m = 0.03; %interest rate on deposit money 
i_diff = 0.02; %interest diff between loan and deposit
lambda = 0.002; %pre-crisis loss rate on loans
rate = 0.1; %loan repayment rate
sigma = 0.28; %share of net income left for the bank
K_0 = 0.08; %min.(C/A) ratio

T_i = 8; %I-gain
K_p = 0.5; %Proportional gain for new loans

%%%

c_fi = 0.25; %financialisation coefficient
l_k = 0.005; %non-crises loss-rate 
r_k = 0.1; %repayment rate to capitalists
i_k = 0.04; % return/interest for capitalists
T_kf = 0.25; %quarter of a year
s_kf = 0.75; % share of lending vs. consumption for capitalists
s_k = 0.25; %share of real-economic lending vs. consumption

%%%

T_g = 1; %one year
T_f = 0.5; %half a year
T_h = 0.1; % one month
T_k = 0.25; %quarter of a year

pi = 0.5; 
tx = 0.5; 

temp = 1;
start_g = temp;
start_f = temp; 
start_h = temp;

%%%

sim_time = 50;

%out = sim('sim_bank_and_economy', sim_time);

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


% Plot
figure('rend','painters','pos',[1 600 750 400])
hold on;
plot(out.GDP);
title("Ratios");
xlabel("Time [Year]");
ylabel("");
grid on;
hold off;
legend({"GDP"}, "Location", "northeast");

% Plot
figure('rend','painters','pos',[1 600 750 400])
hold on;
plot(out.D_to_I);
plot(out.D_to_GDP);
title("Ratios");
xlabel("Time [Year]");
ylabel("");
grid on;
hold off;
legend({"Debt to income", "Debt to GDP"}, "Location", "northeast");