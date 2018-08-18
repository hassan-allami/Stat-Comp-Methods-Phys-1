%Assinment #1, P. #9 Error Analysis Via Baysian Posterior

%Here I'm plotting 68% and 95% area of posterior probability which is
%simply the normalized Likelihood function confined in the prior region
t0=13:.01:15;T=4:0.01:7;%making prior region
ML=A1_P6(t0,T,times);%calculation of log-likelihood
ml=exp(ML-max(max(ML)));ml=ml/sum(sum(ml))*100^2;%making normalized likelihood or the posterior probability

%here I'm finding the indices crrespond to 68% of highest likelihood
ml68=zeros(size(ml));
lml=reshape(ml,numel(ml),1);
lmls=sort(lml,'descend');lmlsc=cumsum(lmls)*.01^2;
ind=find(lmlsc>.68, 1 );
indu=find(ml>=lmls(ind));
indd=find(ml<lmls(ind));
ml68(indu)=1;ml68(indd)=0;
contourf(t0,T,ml68)

%here I'm finding the indices crrespond to 95% of highest likelihood
ml95=zeros(size(ml));
ind=find(lmlsc>.95, 1 );
indu=find(ml>=lmls(ind));
indd=find(ml<lmls(ind));
ml95(indu)=1;ml95(indd)=0;
figure
contourf(t0,T,ml95)