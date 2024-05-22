function secante(f::Function, x1, x2, erro::Float64)::Tuple
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