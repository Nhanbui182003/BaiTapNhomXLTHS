function [frames, n_frame] = Framing(data, Fs)
    % frame length = 30ms, frame shift = 20ms
    t_frame = 0.03;
    shift = 0.02;
    frame_Size = t_frame * Fs;
    shift = shift * Fs;
    % number of frames
    n_frame = floor((length(data) - (frame_Size - shift)) / shift);

    for i = (1:n_frame)
        frame = data(shift * (i - 1) + 1:shift * (i - 1) + frame_Size);
        h = hamming(frame_Size);
        frames(i, :) = h .* frame;
    end

end
