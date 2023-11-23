function [accuracy] = Accuracy(trueVowel, predictVowel)
    % The fuction to calculate the accuracy of the prediction
    % Input: trueVowel, predictVowel
    % Output: accuracy
    count = 0;
    accuracy = 0;

    for i = 1:length(trueVowel)

        if trueVowel(i) == predictVowel(i)
            count = count + 1;
        end

    end

    accuracy = count / length(trueVowel) * 100;
end
