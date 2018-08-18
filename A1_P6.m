function ML = A1_P6(tt0,TT,times)
%Assinment #1, P. #6 Unbinned Maximum-Likelihood Analysis
s=2.2;%sigma value
[t0,T,t]=meshgrid(tt0,TT,times);%making the grid
m=log(exp(s^2./(2*T.^2)-(t-t0)./T)./(2*T).*(erf((t-t0)/sqrt(2*s^2)-s./sqrt(2*T.^2))+1));%taking log after substitution of data in the guessed pdf
ML=sum(m,3);%calculation of the Likelihood

%ANSWER TO THE QUESTION:
% using 0.001 grid size for both t0 and T, I found: log(ML)_max = -1527.9 for
% (t0,T) = (13.952,5.645).