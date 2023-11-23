clear;
clc;
close all;
warning('off', 'all');
draw_step1();
n_fft = [512 1024 2048];

for i = 1:3
feature_matrix = Training(n_fft(i));
[trueVal, predict] = PredictAll('.\NguyenAmKiemThu-16k', feature_matrix, n_fft(i));
cm = confusionmat(trueVal, predict);
acc = Accuracy(trueVal, predict);
draw_FeaturedVector(feature_matrix, n_fft(i));
disp(cm);
disp(strcat('Accuracy of NFFT =  ', num2str(n_fft(i)), ' -> ', num2str(acc)));
end

draw_confustionmatrix(cm);
