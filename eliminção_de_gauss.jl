function metgauss(A::Matrix, B::Vector)::Matrix
    # recebe duas matrizes e retorna uma matriz triangular inferior
    C = [A B];
    C = convert(Matrix{Float64}, C); # matriz ampliada
    n = size(C, 1); # qnt de linhas da matriz C
    
    for j = 1:(n-1) # coluna
        pivo = C[j,j];
        if pivo == 0
            error("Pivô nulo! \nElemento problemático: a(#d,#d)", j,j)
        end
        for i = (j+1):n # linha
            k = C[i,j]/pivo;
            C[i,:] -= (k * C[j,:]); # atualização de linha
        end
    end
    # SAÍDA
    return C
end


# para solucionar o sistema já triangulado
function solvematrix(a::Matrix)::Matrix
    # entre com uma matriz a triangular inferior e receba uma matriz solução R
    n = size(a,1); # n° de linhas de a
    R = zeros(n, 1); # gerar matriz nula como 1° iteração de R
    k = 0;
    while k < n # para percorrer as linhas
        c = 0;
        i = n-k;
        s = a[i, n+1];
        while c<n # para percorrer as colunas
            j = n-c;
            # formula: X_i = (a_i,n+1 - SOMA(a_i,j * X_j))/a(i,i)
            s = s - a[i,j]*R[j]; 
            c = c+1;
        end
        R[i] = s/a[i,i]; # atualizar linha de R
        k = k+1;
    end
    return R
end