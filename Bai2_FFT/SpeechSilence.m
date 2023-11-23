function [sig, Fs1, t_start, t_end] = SpeechSilence(fileName)
    % Function to remove silence from speech signal
    % Input: fileName - name of the file to be processed
    % Output: sig - processed signal
    % Fs1 - sampling frequency of the processed signal
    % t_start - start time of the processed signal
    % t_end - end time of the processed signal
    
    if exist(fileName, 'file') == 2
        [x1,Fs1] = audioread(fileName);
    else
        error('The specified audio file does not exist: %s', fileName);
    end
    t = 0:1 / Fs1:(length(x1) - 1) / Fs1;

    % Split into 20ms frame to cal STE
    frame_len = round(0.02 * Fs1);
    N = length(x1);
    num_frame = floor(N / frame_len);

    % calculate the short time energy of each frame
    for i = 1:num_frame
        frame = x1(frame_len * (i - 1) + 1:frame_len * i);
        x1_2 = frame .* frame;
        STE(i) = sum(x1_2);
    end

    % normalize signal and STE
    x1 = x1 ./ max(abs(x1));
    STE = STE ./ max(STE);

    T = Compute_Threshold(STE, 100);
    %find silence
    % ste_nor = 0 if STE < T (silence) and 1 otherwise (vowel)
    ste_nor = STE > T;
    out = [];
    % minimum frame of silence (300ms)
    num = 0.3/0.02 + 1;

    u = 1; i_time = 1;

    while (u <= length(ste_nor))
        d = 0;
        inte = u;

        % find the first frame of speech
        while (ste_nor(u) == 0 && u < length(ste_nor))
            d = d + 1;
            u = u + 1;
        end

        % if silence is longer than 300ms, remove it
        if (d >= num)

            % u is the first frame of vowel ( u-1 is the last frame of silence)
            if (u < length(ste_nor))
                u = u - 1;
            end

            out(i_time) = inte;
            i_time = i_time + 1;
            out(i_time) = u;
            i_time = i_time +1;
        end

        u = u + 1;
    end

    t_start = 0;
    t_end = t;

    if (length(out) >= 4)
        dau = floor((out(2) - 1) * 0.02 * Fs1);
        cuoi = floor((out(3) -1) * 0.02 * Fs1);
        t_start = dau;
        t_end = cuoi;
        sig = x1(dau:cuoi);
    else
        sig = x1;
    end

end
