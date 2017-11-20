function [ norm, avg , stndev ] = normalize_col( x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    avg = mean(x);
    norm = x - mean(avg);
    stndev = std(x(:));
    %stndev'
    norm = norm / stndev;
end

