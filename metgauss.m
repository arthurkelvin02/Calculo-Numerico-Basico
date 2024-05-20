function C = metgauss(A, B)
    % recebe duas matrizes e retorna uma matriz triangular inferior
    C = [A B]; % matriz ampliada
    n = size(C, 1); % qnt de linhas da matriz C
    
    for j = 1:(n-1) % coluna
        pivo = C(j,j);
        if pivo == 0
            error("Pivô nulo! \nElemento problemático: a(%d,%d)", j,j)
        end
        for i = (j+1):n % linha
            k = C(i,j)/pivo;
            C(i,:) = C(i,:) - (k*C(j,:)); % atualização de linha
        end
    end
end

