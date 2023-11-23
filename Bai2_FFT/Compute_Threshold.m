function [threshHold] = Compute_Threshold(STE_PowFrame_Matrix, Weight)
    % Compute_Threshold: Computes the threshold for each frame using Histogram
    % Input: STE_PowFrame_Matrix: Matrix of the STE of each frame, Weight
    % Output: threshHold: Threshold for a signal
    [histSTE, x_STE] = hist(STE_PowFrame_Matrix, round(length(STE_PowFrame_Matrix) / 0.5));
    % hist STE  là tần suất xuất hiện  giá trị STE mỗi frame tại các vị trí X_STE
    % Vector histSTE: lưu tần suất xuất hiện (số lần xuất hiện) giá trị STE của mỗi frame ( STE_PowFrame_Matrix) tại các vị trí x_STE.
    % Vector x_STE: lưu giá trị STE của mỗi frame ( STE_PowFrame_Matrix) tại các vị trí x_STE.
    % round(length(STE_PowFrame_Matrix) / 0.5): số lượng giá trị STE của mỗi frame ( STE_PowFrame_Matrix) tại các vị trí x_STE
    T1 = 0;
    T2 = 0;
    % Vị trí của giá trị STE có tần suất xuất hiện lớn nhất và lớn thứ 2
    Index1 = 0;
    Index2 = 0;
    % Tìm các giá trị STE có tần suất xuất hiện lớn nhất và lớn thứ 2
    % Duyệt kết quả tần suất xuất hiện (hist STE) giá trị STE mỗi frame tại các vị trí X_STE
    for i = 2:length(histSTE) - 1
        previous = i - 1;
        next = i + 1;

        % Define postion
        while (histSTE(i) == histSTE(next))
            next = next + 1;
        end

        % Check if histSTE(i) is a local maximum (histSTE(i) > histSTE(previous) && histSTE(i) > histSTE(next))
        if (histSTE(i) > histSTE(previous) && histSTE(i) > histSTE(next))

            if (Index1 == 0)
                T1 = histSTE(i);
                Index1 = i;
            else
                T2 = histSTE(i);
                Index2 = i;
                break;
            end

        end

        i = next;
    end

    T1 = x_STE(Index1); % Kết quả giá trị STE có tần suất xuất hiện lớn nhất
    T2 = x_STE(Index2); % Kết quả giá trị STE có tần suất xuất hiện lớn thứ 2
    % Threshold = (W * T1 + T2) / (W + 1)
    threshHold = (Weight * T1 + T2) / (Weight + 1);
end
