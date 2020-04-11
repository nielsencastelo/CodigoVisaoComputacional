function z = descf(s)

[np, nc] = size(s);
if nc ~= 2 
   error('S precisa ser de tamanho np-por-2.'); 
end
if np/2 ~= round(np/2); % verifica se é par
   s(end + 1, :) = s(end, :);
   np = np + 1;
end

% cria uma sequencia alternada de 1s e -1s para usar na centralização
% da transformada
x = 0:(np - 1);
m = ((-1) .^ x)';
 
% multiplica a sequencia de entrada alternando 1s e -1s
% para centralizar a transformada
s(:, 1) = m .* s(:, 1);
s(:, 2) = m .* s(:, 2);

% converte as coordenadas para números complexos
s = s(:, 1) + i*s(:, 2);

% calcula os descritores
z = fft(s);