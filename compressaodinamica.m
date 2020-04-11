function matriz = compressaodinamica(matriz)

matriz = double(matriz);
matriz = log10(1+matriz);
matriz = round(matriz/max(max(matriz))*255);
matriz = uint8(matriz);