TotalMessages = 9559;
TrainLength = 27;
messagerw = 1;
bit = [];
TotMess = [];
n = 2;

while n < TrainLength
    mess = LabData(n:n+7,:);
    mess = mess(:);
    mess = mess'
    TotMess = [TotMess; mess];
    bit = [bit LabData(n,8)];
    n = n +9;
end

bit
TotMess