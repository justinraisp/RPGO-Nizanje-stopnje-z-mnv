function p = plotbezier(B, t, c)
% Opis:
% plotbezier nariše Bézierjevo krivuljo za dane kontrolne točke in
% seznam parametrov
%
% Definicija:
% p = plotbezier(B, t, c)
%
% Vhodni podatki:
% B matrika velikosti n+1 x d, ki predstavlja kontrolne točke
% Bézierjeve krivulje stopnje n v d-dimenzionalnem prostoru,
% t seznam parametrov dolžine k, pri katerih računamo vrednost
% Bézierjeve krivulje,
% c opcijski parameter, ki določa barvo krivulje
%
% Izhodni podatek:
% p grafični objekt, ki določa krivuljo

    d = size(B, 2);  % Dimenzionalnost kontrolnih točk
    b = bezier(B, t); % Izračun točk Bézierjeve krivulje

    if nargin < 3
        c = 'k'; % Privzeta barva krivulje je črna
    end

    if d == 1
        % 1D primer (ni pogosto uporabljen, zato lahko ostane prazen)
    elseif d == 2
        hold on
        % Barva kontrolnega poligona (lahko jo pustimo privzeto)
        p_cpol = plot(B(:,1), B(:,2), '--', 'Color', [0.5, 0.5, 0.5]);

        % Rdeče točke z manjšim markerjem
        p_cpts = scatter(B(:,1), B(:,2), 40, 'r', 'filled');

        % Bézierjeva krivulja s podano barvo
        p = plot(b(:,1), b(:,2), 'Color', c, 'LineWidth', 1.5);
    elseif d == 3
        hold on
        % Barva kontrolnega poligona za 3D
        p_cpol = plot3(B(:,1), B(:,2), B(:,3), '--', 'Color', [0.5, 0.5, 0.5]);

        % Rdeče točke z manjšim markerjem
        p_cpts = scatter3(B(:,1), B(:,2), B(:,3), 40, 'r', 'filled');

        % Bézierjeva krivulja s podano barvo
        p = plot3(b(:,1), b(:,2), b(:,3), 'Color', c, 'LineWidth', 1.5);
    end
end
