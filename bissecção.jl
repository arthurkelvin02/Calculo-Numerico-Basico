function bisseccao(f::Function, intervalo::Vector, erro::Float64)::Tuple
    sort!(intervalo); # organizar intervalo
    a, b = intervalo; # desempacotar intervalo
    (f(a)*f(b)<0) || error("Não é possível determinar se há zeros em $(intervalo)!") # verificrar se há zeros
    contador = 1; # contador de iterações
    while true
        x = (a+b)/2; # x aproximado

        if abs(b-a)/2 < erro
            return x, contador
        end

        if f(a)*f(x)<0 # redefinir intervalo
            b = x;
        else
            a = x;
        end
        contador += 1; # atualização do contador
    end
end