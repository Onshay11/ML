TotalMessages = 9559;
TrainLength = 86031;
% TotalMessages = 3;
% TrainLength = 27;
messagerw = 1;
bit = [];
TotMess = [];
n = 2;
a =0;
b = 0;
c = 0;
d = 0;
e = 0;

while n < TrainLength
    mess = LabData(n:n+7,:);
    mess = mess(:);
    mess = mess';
    TotMess = [TotMess; mess];
    bit = [bit LabData(n,8)];
    n = n +9;
end
TrainLength = 8603;
BitLength = 956;
TotMess;
bit = bit';
%[dest_norm, dest_med, dest_stndev] = [];

[func_norm ,func_med, func_stndev] = normalize_col(TotMess);

X_train = func_norm(1:TrainLength,:);
X_test = func_norm(TrainLength+1 : end ,:);
y_train = bit(1:TrainLength,:);
y_test = bit(TrainLength+1 : end ,:);

for elm = y_test'
    if elm == 98
        a = a+1;
    elseif elm == 99
        b = b+1;
    elseif elm == 101
        c = c+1;
    elseif elm == 102
        d = d+1;
    elseif elm == 103
        e = e+1;
    end
end

Mdl = fitcnb(X_train,y_train);

rng(1);
CVMdl1 = fitcnb(X_train,y_train,'CrossVal','on');
t = templateNaiveBayes();
CVMdl2 = fitcecoc(X_test,y_test,'CrossVal','on','Learners',t);

classErr1 = kfoldLoss(CVMdl1,'LossFun','ClassifErr')
classErr2 = kfoldLoss(CVMdl2,'LossFun','ClassifErr')
