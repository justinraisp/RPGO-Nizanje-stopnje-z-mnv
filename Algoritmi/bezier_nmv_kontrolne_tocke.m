function C = bezier_nmv_kontrolne_tocke(B, k,alpha)
% Opis:
% bezier_degree_reduction_iterative zmanjša stopnjo Bézierjeve krivulje z iterativnim postopkom.
%
% Definicija:
% C = bezier_degree_reduction_iterative(B, k)
%
% Vhodni podatki:
% B matrika velikosti (n+1) x d, kjer n predstavlja stopnjo
% začetne Bézierjeve krivulje in d dimenzionalnost prostora,
% k število iteracij za znižanje stopnje (za vsako iteracijo se stopnja zmanjša za 1).
%
% Izhodni podatek:
% C matrika velikosti (n-k+1) x d, ki predstavlja kontrolne
% točke Bézierjeve krivulje po znižanju stopnje.

    n = size(B, 1) - 1;
    d = size(B, 2);
    lambda = compute_lambda(n,alpha);
    C = NaN(n,d);
    C(1,:) = B(1,:);
    C(n,:) = B(n+1,:);
    C1 = C;
    C2 = C;
    if k > n
        error('Število iteracij za znižanje stopnje ne sme presegati začetne stopnje.');
    end
    
    % Iterativno nizanje stopnje
    while k > 0
        
        for i=1:(n-2)
            C1(i+1,:) = ((n .* B(i+1,:)) - i .* C1(i,:))/(n-i);
        end
        for i=(n-1):-1:2
            C2(i,:) = (n .* B(i+1,:) - (n-i) .* C2(i+1,:))/i;
        end
        for i=1:(n-2)
            C(i+1,:) = (1-lambda(i+1)) .* C1(i+1,:) +  lambda(i+1) .* C2(i+1,:);
        end
        k = k-1;
    end
end
            %C2(n-i,:) = ((n .* B(n-i+2)) - (i-1) .* C2(n-i+1,:))/(n-i+1);