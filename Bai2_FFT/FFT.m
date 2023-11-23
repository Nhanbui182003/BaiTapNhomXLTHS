function FFT = FFT(frame, n_fft)
    % abs to take FFT module ()
    FFT = abs(fft(frame, n_fft));
    FFT = FFT(1:length(FFT) / 2);
    % The FFT is symmetry, the first half is real, the second half is imaginary
end
