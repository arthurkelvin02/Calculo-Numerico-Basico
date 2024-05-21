function [x, contador] = bisseccao(f, intervalo, erro)
    % desmontar intervalo
    intervalo = sort(intervalo);
    a = intervalo(1);
    b = intervalo(2);
    % há raizes em intervalo?
    if f(a)*f(b) > 0
        error("não é possível determinar se há raizes no intervalo dado!")
    end

    contador = 1; % vai contar o n° de iterações
    while true
        % x aproximado
        x = (a+b)/2;
        % verificar erro
        if (b-a)/2 < erro
            return
        end
        % redefinir intervalo
        if f(a)*f(x) < 0
            b = x;
        else
            a = x;
        end
        contador = contador + 1; % atualizar contador
    end
end

