%Assinment #1, P. #8 Error Analysis Via Bootstrap Resampling

%ANSWER TO THE QUESTIONS:
%Here I've just useed the ML method and again for 100 bootstrap resampled
%set of data. Running below code once, I got these results:

%mean(t0,T)=(13.9568,5.6938); var(t0,T)=(0.0477,0.1006);
%68% Confidence Intervals: 13.73<t0<14.10 and 5.36<T<5.98
%95% Confidence Intervals: 13.61<t0<14.40 and 5.19<T<6.29
%Correlation(t0,T) = -0.4304

BS=times(ceil(rand(500*100,1)*500));
BS=reshape(BS,500,100);
tt0=12.8:.01:14.6;%defining the grid and limits of t0
TT=4.6:0.01:7.7;%defining the grid and limits of T
t0_T_min=zeros(2,100);
for k=1:100
    ML = A1_P6(tt0,TT,BS(:,k));%calculation of Likelihood
    [a,b]=ind2sub(size(ML),find(ML==max(max(ML))));%finding ML
    %finding the associated t0 and T for ML
    t0_T_min(1,k)=tt0(b);
    t0_T_min(2,k)=TT(a);
end
%evaluation of correlation(t0,T)
m=mean(t0_T_min,2)*ones(1,100);
cor=sum(prod(t0_T_min-m))/(99*sqrt(prod(var(t0_T_min'))));
%68%confidence interval
data=sort(t0_T_min,2);
ind=zeros(2,1);
l=10*ones(2,1);
interval68=zeros(2,2);
for k=1:33
    for p=1:2
        if data(p,67+k)-data(p,k)<l(p)
            l(p)=data(p,67+k)-data(p,k);
            ind(p)=k;
        end
    end
end
for p=1:2
    interval68(p,1)=data(p,ind(p));
    interval68(p,2)=data(p,ind(p)+67);
end

%95% confidence interval
l=10*ones(2,1);
interval95=zeros(2,2);
for k=1:6
    for p=1:2
        if data(p,94+k)-data(p,k)<l(p)
            l(p)=data(p,94+k)-data(p,k);
            ind(p)=k;
        end
    end
end
for p=1:2
    interval95(p,1)=data(p,ind(p));
    interval95(p,2)=data(p,ind(p)+94);
end