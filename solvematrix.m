function R = solvematrix(a)
% entre com uma matriz a triangular inferior e receba uma matriz solução R
    n = size(a,1); % n° de linhas de a
    R = zeros(n, 1); % gerar matriz nula como 1° iteração de R
    k = 0;
    while k < n % para percorrer as linhas
        c = 0;
        i = n-k;
        s = a(i, n+1);
        while c<n % para percorrer as colunas
            j = n-c;
            % formula: X_i = (a_i,n+1 - SOMA(a_i,j * X_j))/a(i,i)
            s = s - a(i,j)*R(j); 
            c = c+1;
        end
        R(i) = s/a(i,i); % atualizar linha de R
        k = k+1;
    end
end

