[y, fs] = audioread('audio.wav');
dct_y = dct(y);
umbral = 0.1
dct_y_comprimido = dct_y.*(abs(dct_y)>umbral);
y_comprimido = idct(dct_y_comprimido);
t = ((0:length(y)-1)/fs);
t_comp = ((0:length(y_comprimido))/fs);

t= (0:length(y)-1)/fs;
t_comp = (0:length(y_comprimido)-1)/fs;

subplot(2,1,1);
plot(t,y)
xlabel("Tiempo [s]");
ylabel("Amplitud");
title("Archivo de audio original");

subplot(2,1,2);
plot(t_comp,y_comprimido);
xlabel("Tiempo [s]");
ylabel("Amplitud");
title("Archivo de audio comprimido");


audiowrite('audio_comprimido.wav', y_comprimido, fs);