TotalMessages = 9559;
TrainLength = 86031;
% TotalMessages = 3;
% TrainLength = 27;
messagerw = 1;
bit = [];
TotMess = [];
n = 2;

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
n = 2;


norm = [func_norm];%,dest_norm];

rate = .001;
iter = 500;
theta = zeros(128, 1);
theta  = update(norm(1:BitLength,:),bit(1:BitLength,:), rate, iter, theta);

test_func = normalize_col(norm(BitLength+1 : end ,:));

tbit = abs(test_func*theta)

% X_train = norm(1:BitLength,:);
% X_test = norm(BitLength+1 : end ,:);
% y_train = bit(1:BitLength,:);
% y_test = bit(BitLength+1 : end ,:);
% 
% f1 = figure; hold all
% plot(X_train(y_train==0,1),X_train(y_train==0,2),'o')
% plot(X_train(y_train==1,1),X_train(y_train==1,2),'o')
% title('Training data')
% 
% clf = LogisticRegression;
% 
% clf.fit(X_train,y_train);
% 
% proba = clf.predict_proba(X_test);
% 
% [perfx,perfy,T,AUC] = perfcurve(y_test,proba,true);
% 
% fprintf('AUC = %.4f\n',AUC)
% 
% f2 = figure; plot(perfx,perfy)
% xlabel('False positive rate')
% ylabel('True positive rate')
% title('ROC for Classification by Logistic Regression')
