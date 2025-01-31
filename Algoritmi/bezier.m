function b = bezier(B,t)
% Opis:
% bezier vrne točke na Bezierjevi krivulji pri danih parametrih
%
% Definicija:
% b = bezier(B,t)
%
% Vhodna podatka:
% B matrika velikosti n+1 x d, ki predstavlja kontrolne točke
% Bezierjeve krivulje stopnje n v d-dimenzionalnem prostoru,
% t seznam parametrov dolžine k, pri katerih računamo vrednost
% Bezierjeve krivulje
%
% Izhodni podatek:
% b matrika velikosti k x d, kjer i-ta vrstica predstavlja točko
% na Bezierjevi krivulji pri parametru iz t na i-tem mestu
    k = length(t);
    d = length(B(1,:));
    b = NaN(k,d);
    for j = 1:k
        for i = 1:d
            matrika = decasteljau(B(:,i),t(j));
            b(j,i) = matrika(1,end);
        end
    end
end