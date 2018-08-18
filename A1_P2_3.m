function mes_t = A1_P2_3(t0,T)
%Assinment #1, P. #2 Simulation and Rough Estimation
%T is decay time
%t0 is starting time
sig=2.2;%measurment error deviation
x=rand(500,1);%uniform random series
em_t=t0-T*log(1-x);%real time of emission
x=rand(500,1);%new uniform random series
er_mes=sqrt(2*sig^2)*erfinv(2*x-1);%time error in measurment
mes_t=em_t+er_mes;%recorded time for emission
%t_mes=linspace(min(mes_t),max(mes_t),25);%assigned bins
%figure
%hist(mes_t,t_mes)

%ANSWER FOR PROBLEM 3:
%By some trying my rough estimation for (t0,T) is (14,6)