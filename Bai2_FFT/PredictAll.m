function [trueVal, predict] = PredictAll(testfolder, db, n_fft)
    % Read all files in testfolder
    % Return their true and predicted vowels (in numbers 1-5 for a,e,i,o,u respectively)
    count = 0;
    % trueVal contain the true values of the vowels, based on the file name
    trueVal = [];
    % predict contain the predicted values of the vowels, based on the model
    predict = [];
    dir_content = dir(testfolder);

    for i = 3:length(dir_content)
        subdir_name = getfield(dir_content(i), 'name');
        subdir_content = dir(strcat(testfolder, '\', subdir_name));

        for j = 3:length(subdir_content)
            filename = getfield(subdir_content(j), 'name');
            filepath = strcat(testfolder, '\', subdir_name, '\', filename);

            if filename == 'a.wav'
                count = count + 1;
                trueVal(count) = 1;
                predict(count) = Predict1Signal(filepath, db, n_fft);
                continue
            end

            if filename == 'e.wav'
                count = count + 1;
                trueVal(count) = 2;
                predict(count) = Predict1Signal(filepath, db, n_fft);
                continue
            end

            if filename == 'i.wav'
                count = count + 1;
                trueVal(count) = 3;
                predict(count) = Predict1Signal(filepath, db, n_fft);
                continue
            end

            if filename == 'o.wav'
                count = count + 1;
                trueVal(count) = 4;
                predict(count) = Predict1Signal(filepath, db, n_fft);
                continue
            end

            if filename == 'u.wav'
                count = count + 1;
                trueVal(count) = 5;
                predict(count) = Predict1Signal(filepath, db, n_fft);
            end

        end

    end

end
