filename = 'gooselist.dat';
delimiterIn = ' ';
headerlinesIn = 1;
A = importdata(filename);
func = A.data(:,1);
dest = A.data(:,2);

train = floor(length(dest)*.7);

[func_norm ,func_med, func_stndev]  = normalize_col(sqft(1:train));
[dest_norm, dest_med, dest_stndev] = normalize_col(bed(1:train));

norm = [func_norm,dest_norm];

rate = .1;
iter = 500;
theta = zeros(3, 1);

theta  = update(norm, price(1:train), rate, iter, theta);

test_func = normalize_col(func_norm(train+1:end));

tdest = abs(test_func*theta);

f1 = figure; hold all
plot(func_norm(dest_norm==0,1),func_norm(dest_norm==0,2),'o')
plot(func_norm(dest_norm==1,1),func_norm(dest_norm==1,2),'o')
title('Training data')

clf = LogisticRegression;

clf.fit(func_norm,dest_norm);

proba = clf.predict_proba(tdest);

[perfx,perfy,T,AUC] = perfcurve(tdest,proba,true);

fprintf('AUC = %.4f\n',AUC)

f2 = figure; plot(perfx,perfy)
xlabel('False positive rate')
ylabel('True positive rate')
title('ROC for Classification by Logistic Regression')
