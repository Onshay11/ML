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
[func_norm ,func_med, func_stndev] = normalize_col(TotMess);

Mdl = fitcnb(func_norm,bit);
