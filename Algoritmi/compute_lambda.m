function lambda = compute_lambda(n, alpha)
% Opis:
% compute_lambda izračuna uteži lambda za znižanje stopnje Bézierjeve krivulje.
%
% Definicija:
% lambda = compute_lambda(n, alpha)
%
% Vhodni podatki:
% n začetna stopnja Bézierjeve krivulje,
% alpha parameter, ki vpliva na pozicijo kontrolnih točk pri znižanju stopnje.
%
% Izhodni podatek:
% lambda seznam dolžine n+1, ki vsebuje uteži za vsako kontrolno točko.

    lambda = zeros(1, n); % Inicializacija lambda
    faktor = 1 / (nchoosek(2 * n, n + 2 * alpha)); % Faktor za normalizacijo

    for i = 1:(n)
        vsota = 0;
        for j = 0:(i-1)
            if (j-alpha >= 0) && (j-alpha <= n) && (j+alpha >= 0) && (j+alpha <= n)
                vsota = vsota + nchoosek(n, j-alpha) * nchoosek(n, j+alpha);
            end
        end
        lambda(i) = faktor * vsota;
    end
end
