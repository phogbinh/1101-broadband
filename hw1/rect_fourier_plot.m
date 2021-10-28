%% set params
TIME_INTERVAL = 0.01;
POINTS_N = 500;
Y1_WIDTH = 1;
Y2_WIDTH = 0.5;
FREQUENCY_INTERVAL = POINTS_N / TIME_INTERVAL;
%% create functions
t = (-POINTS_N / 2) * TIME_INTERVAL:TIME_INTERVAL:(POINTS_N / 2 - 1) * TIME_INTERVAL;
x1 = rectpuls(t, Y1_WIDTH);
x2 = rectpuls(t, Y2_WIDTH);
y1 = fft(x1);
y2 = fft(x2);
%% plot
figure(1);
plot(t, x1);
xlabel('Time (seconds)');
ylabel('Amplitude');
hold on;
plot(t, x2);
hold off;

f = (-POINTS_N / 2) * FREQUENCY_INTERVAL:FREQUENCY_INTERVAL:(POINTS_N / 2 - 1) * FREQUENCY_INTERVAL;
figure(2);
plot(f, fftshift( abs( y1 ) ) );
xlabel('Frequency (Hz)');
ylabel('Magnitude');
hold on;
plot(f, fftshift( abs( y2 ) ) );
hold off;
