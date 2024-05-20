function [x, contador] = secante(f, x1, x2, erro)
    
    contador = 1; % contador de iterações
    while true
        % x aproximado
        x = x1 - ((x1-x2)*f(x1) / (f(x1) - f(x2)));
        
        % verificar o erro
        if abs(x-x1) < erro
            return
        end

        % redefinir x1 e x2
        x2 = x1;
        x1 = x;
        contador = contador + 1;
    end
end

