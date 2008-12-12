


filename = 'output.log';

display('Lecture telemetrie ...')
tableau = telemetry(filename);
display('Fin telemetrie')
clear filename;

affich_telemetry(tableau);

% titre
subplot(2, 1, 1);
title('input : pseudorandom noise');

subplot(2, 1, 2);
title('filtered output');


tableau = tableau(2:end, :);


% display spectrums


figure;
Y1 = fft(tableau(:, 1),512);
Pyy1 = Y1.* conj(Y1) / 512;
f = 1000*(0:256)/512;
semilogy(f,Pyy1(1:257))

hold on;

Y1 = fft(tableau(:, 2),512);
Pyy1 = Y1.* conj(Y1) / 512;
f = 1000*(0:256)/512;
semilogy(f,Pyy1(1:257), '-r')

xlabel('frequency (Hz)')
legend('in', 'out');