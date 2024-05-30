# ENTRADA: n pontos (x,y)
# PROCESSAMENTO: 
# 1- gerar matrizes b e de vondemonde
# 2- resolver o sistema linear(os coeficientes são as icógnitas!)
# SAÍDA: um f(x) polinomial do (n-1)° grau

# INTERPOLAÇÃO POLINOMIAL
# entrada
x = (0, 1, 2, 3, 10);
y = (2, 0.5, 2, 0.5, 2);

# processando
n = length(x);
Mᵥ= ones(n, n);
B = ones(n, 1);

# formar matriz de vondemonde
for i = 1:n
    B[i] = y[i];
    for j = 2:n
        Mᵥ[i,j] = x[i]^(j-1); 
    end
end

# resolver sistema linear
include("eliminção_de_gauss.jl");
reduzida = metgauss(Mᵥ, B);
aᵢ = solvematrix(reduzida);
# saída
println("aᵢ=")
display(aᵢ)
println("em que i vai de 0 a $(n-1)")