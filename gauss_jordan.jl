function metgaussjordan(A::Matrix, B::Matrix)::Matrix
    # Tentando converter para frações
    try
        global C = Rational.([ A B ]);
    catch
        global C = [ A B ];
    end

    n = size(C, 1); # n° de linhas de C 

    # Diagonalizar C - parcial I
    for j = 1:n # coluna
        pivo = C[j,j];

        # verificar se o pivo é nulo
        (pivo != 0) || error("Pivô nulo! \nElemento problemático: A(",j,", ",j,")")

        for i = 1:n # linha
            if i==j
                continue
            else
                # multiplicador de linha
                try
                    global mtl = C[i,j]//pivo;
                catch
                    global mtl = C[i,j]/pivo;
                end

                # atualizar a linha
                C[i,:] = C[i,:] - (mtl * C[j,:]);
            end
        end
    end

    # Diagonalizar C - parcial II
    for i = 1:n
        C[i,:] = C[i,:]/C[i,i];
    end

    # SAIDA
    X = C[:,end]; 
    X = X[:,:];
    return X

end