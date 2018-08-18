function X2 = A1_P5(tt0,TT,times)
%Assinment #1, P. #5 Binned Chi-Squared Analysis
s=2.2;%sigma value
[nn tt]=hist(times,25);%number of data in the bins
[t0,T,t]=meshgrid(tt0,TT,tt);[t0,T,n]=meshgrid(tt0,TT,nn);%making the grid
dt=tt(2)-tt(1);%determining width of the bins
m=exp(s^2./(2*T.^2)-(t-t0)./T)./(2*T).*(erf((t-t0)/sqrt(2*s^2)-s./sqrt(2*T.^2))+1)*dt*500;%calculation of mj from pdf at each bin
X2=sum((n-m).^2./m,3);%calculation of Chi-Square

%ANSWER TO THE QUESTION:
% using 0.001 grid size for both t0 and T I found: X_min = 31.5683 for
% (t0,T) = (13.634,6.278), So min Reduced-Chi-Square is 31.5683/23 = 1.3725
% with my bining (I have 25 bins).