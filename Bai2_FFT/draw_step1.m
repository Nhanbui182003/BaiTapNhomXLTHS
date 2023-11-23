function draw_step1()
    % Draw step 1: remove silence and find stable regions
    filename = 'NguyenAmHuanLuyen-16k/23MTL/e.wav';

    [x, fs] = audioread(filename);
    t = 0:1 / fs:(length(x) - 1) / fs;

    % normalize signal and STE
    x = x ./ max(abs(x));

    figure('Name', 'Find silence and stable regions');
    plot(t, x);
    title('Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');
    [cutSilenceSignal, f_cut, t_s, t_e] = SpeechSilence(filename);

    t1 = (1 / fs) * t_s;
    t2 = (1 / fs) * t_e;
    line([t1 t1], [-1 1], 'Color', 'r', 'LineWidth', 1);
    line([t2 t2], [-1 1], 'Color', 'r', 'LineWidth', 1);

    sig0_length = length(cutSilenceSignal);
    n_divide = 3;
    sig_first = floor(sig0_length / n_divide);
    sig_last = floor(sig0_length / n_divide * 2);

    ts1 = t1 + (1 / f_cut) * sig_first;
    ts2 = t1 + (1 / f_cut) * sig_last;

    line([ts1 ts1], [-1 1], 'Color', 'g', 'LineWidth', 1);
    line([ts2 ts2], [-1 1], 'Color', 'g', 'LineWidth', 1);

end
