function [sig] = FindStable(sig0)
    % Split signal into 3 equal part and take the middle (the most stable part)
    sig0_length = length(sig0);
    n_divide = 3;
    sig_first = floor(sig0_length / n_divide);
    sig_last = floor(sig0_length / n_divide * 2);
    sig = sig0(sig_first:sig_last);
end
