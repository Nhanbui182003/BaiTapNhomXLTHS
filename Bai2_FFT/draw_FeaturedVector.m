function draw_FeaturedVector(db, n_fft)

    figure('Name', 'FFT Featured Vector Of 5 Vowels', 'NumberTitle', 'off');
    color = ['r', 'g', 'b', 'm', 'k'];
    p = [];

    hold on;

    for i = 1:5

        plot(db(i, :), color(i));

    end

    title(strcat('FFT Featured Vector Of 5 Vowels, NFFT = ', num2str(n_fft)));
    legend(p, '/a/', '/e/', '/i/', '/o/', '/u/');
    hold off;

end
