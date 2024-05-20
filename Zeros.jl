"""
Verifica se há pelo menos um zero no intervalo dado.\n 
Argumentos:\n 
    f::função anônima
    a::numerico .:. inicio do intervalo\n 
    b::numerico .:. fim do intervalo\n 
Retorno:
    true(sim) ou false(não)
"""
function bolzano(f, a, b)
    return (f(a)*f(b)<0)
end


"""
Calcula uma aproximação de um zero mediante o método da secante.\n
Argumentos: \n
    f::função anônima\n
    x1::numerico .:. primeiro chute\n
    x2::numerico .:. chute anterior\n
    erro::Float\n
Retorno:\n
    (x, n° de iterações)\n
"""
function solvesecante(f, x1, x2, erro::Float64)
    contador::Int64 = 1;
    while true
        # x aproximado
        x = x1 - ((x1-x2)*f(x1) / (f(x1) - f(x2)));
        
        # verificar o erro
        if abs(x-x1) < erro
            return x, contador
        end

        # redefinir x1 e x2
        x2 = x1;
        x1 = x;
        contador += 1;
    end
end


"""
Calcula uma aproximação de um zero mediante o método da bissecção.\n
Argumentos:\n
    f::função anônima\n
    intervalo::Vector\n
    erro::Float64\n
Retorno:\n
    (x, n° de iterações)\n
"""
function solvebiseccao(f, intervalo::Vector, erro::Float64)
    sort!(intervalo); # organizar intervalo
    a, b = intervalo; # desempacotar intervalo
    bolzano(f, a, b) || error("O intervalo dado não possui zeros!") # verificrar se há zeros
    contador = 1; # contador de iterações
    while true
        x = (a+b)/2; # x aproximado

        if abs(b-a)/2 < erro
            return x, contador
        end

        if f(a)*f(b)<0 # redefinir intervalo
            b = x;
        else
            a = x;
        end
        contador += 1; # atualização do contador
    end
end
