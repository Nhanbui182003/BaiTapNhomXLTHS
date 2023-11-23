function feature_matrix = Training(n_fft)
    subFolder = ['23MTL', '24FTL', '25MLM', '27MCM','28MVN', '29MHN', '30FTN', '32MTP','33MHP','34MQP','35MMQ','36MAQ','37MDS','38MDS','39MTS','40MHS','41MVS','42FQT','43MNT','44MTT','45MDV'];
    vowelFile = ['a'
            'e'
            'i'
            'o'
            'u'
            ];

    feature_matrix = [];

    for i = 1:length(vowelFile) 
        vowelFeature = zeros(1, n_fft / 2);

        for j = 1:length(subFolder)/5
            % main code goes here
            signal=subFolder((j-1)*5+1:5*j);
       
            filename = ['D:/Subjects/XLTHS/BaiTapNhom/Bai2_FFT-20231123T081457Z-001/Bai2_FFT/NguyenAmHuanLuyen-16k/' signal '/' vowelFile(i)  '.wav'];
           
            [cutSilenceSignal, Fs] = SpeechSilence(filename);
            [stable_signal] = FindStable(cutSilenceSignal);
            
            [Frames, n_frame] = Framing(stable_signal, Fs);

            FFT_file = zeros(1, n_fft / 2);

            for index = 1:n_frame
                FFT_frame = FFT(Frames(index, :), n_fft);
                FFT_file = FFT_file + FFT_frame;
            end

            fileFeatured = FFT_file ./ n_frame;
            k = 1:n_fft;
            w = k * Fs / n_fft;
            w = w(1:n_fft / 2);
            vowelFeature = vowelFeature + fileFeatured;
        end

        vowelFeature = vowelFeature ./ length(subFolder);
        feature_matrix = [feature_matrix; vowelFeature];
    end

end
