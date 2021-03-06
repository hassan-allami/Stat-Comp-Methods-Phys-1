%Assinment #1, P. #7 Error Analysis Via Simulation

%ANSWER TO THE QUESTIONS:
%I've written this code using both ML (Maximum-Likelihood) and X2
%(Chi-Squared) methods for fitting. It's evident from the results that ML gives
%better fit, since t0 and T have smaller variance in this method and
%also they are less biassed, specially "T". However, ML is more time-consuming because it
%works on unbinned data whch are 20 times more than binned data.

%avoiding from consuming too much time for simulation, I've run the siulations just 100
%times in both methods. Here are the results came out running the below
%code:

%for X2: mean(t0,T)=(13.7255,6.2919); var(t0,T)=(0.0517,0.2069);
%68% Confidence Intervals: 13.51<t0<13.93 and 5.75<T<6.56
%95% Confidence Intervals: 13.27<t0<14.15 and 5.38<T<7.2
%Correlation(t0,T) = -0.6086

%for ML: mean(t0,T)=(13.9786,5.6325); var(t0,T)=(0.0472,0.1199);
%68% Confidence Intervals: 13.74<t0<14.15 and 5.31<T<5.90
%95% Confidence Intervals: 13.66<t0<14.42 and 4.99<T<6.27
%Correlation(t0,T) = -0.6101
%--------------------------------------------------------------------------

clear
t0=13.952;T=5.645;%derived from problem 6
tt0=12.8:.01:14.6;%defining the grid and limits of t0
TT=4.6:0.01:7.7;%defining the grid and limits of T
t0_T_min=zeros(4,100);

%running both fitting methods 100 times
for k=1:100
    times = A1_P2_3(t0,T);%running sumulation
    X2 = A1_P5(tt0,TT,times);%calculation of X2
    ML = A1_P6(tt0,TT,times);%calculation of Likelihood
    [a,b]=ind2sub(size(X2),find(X2==min(min(X2))));%finding min X2
    [c,d]=ind2sub(size(ML),find(ML==max(max(ML))));%finding ML
    %finding the associated t0 and T for min-X2 and ML
    t0_T_min(1,k)=tt0(b);
    t0_T_min(2,k)=TT(a);
    t0_T_min(3,k)=tt0(d);
    t0_T_min(4,k)=TT(c);    
end

%evaluation of correlation(t0,T)
m=mean(t0_T_min,2)*ones(1,100);
cor_X2=sum(prod(t0_T_min(1:2,:)-m(1:2,:)))/(99*sqrt(prod(var(t0_T_min(1:2,:)'))));
cor_ML=sum(prod(t0_T_min(3:4,:)-m(3:4,:)))/(99*sqrt(prod(var(t0_T_min(3:4,:)'))));

%68%confidence interval
data=sort(t0_T_min,2);
ind=zeros(4,1);
l=10*ones(4,1);
interval68=zeros(4,2);
for k=1:33
    for p=1:4
        if data(p,67+k)-data(p,k)<l(p)
            l(p)=data(p,67+k)-data(p,k);
            ind(p)=k;
        end
    end
end
for p=1:4
    interval68(p,1)=data(p,ind(p));
    interval68(p,2)=data(p,ind(p)+67);
end

%95% confidence interval
l=10*ones(4,1);
interval95=zeros(4,2);
for k=1:6
    for p=1:4
        if data(p,94+k)-data(p,k)<l(p)
            l(p)=data(p,94+k)-data(p,k);
            ind(p)=k;
        end
    end
end
for p=1:4
    interval95(p,1)=data(p,ind(p));
    interval95(p,2)=data(p,ind(p)+94);
end