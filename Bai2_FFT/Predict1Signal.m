% Predict vowel (1 signal) based on given database
function [vowelPosition, euc_dis] = Predict1Signal(inputFile, database, n_fft)
    % 1,2,3,4,5 = a,e,i,o,u
    [cutSilenceSignal, Fs] = SpeechSilence(inputFile);
    [stable_signal] = FindStable(cutSilenceSignal);
    [Frames, n_frame] = Framing(stable_signal, Fs);

    FFT_file = zeros(1, n_fft / 2);

    for index = 1:n_frame
        FFT_frame = FFT(Frames(index, :), n_fft);
        FFT_file = FFT_file + FFT_frame;
    end

    current_fvector = FFT_file ./ n_frame;

    euc_dis = zeros(5, 1);

    for i = 1:5
        euc_dis(i) = sqrt(sum((current_fvector - database(i, :)).^2));
    end

    vowelPosition = find(euc_dis == min(euc_dis));

end
