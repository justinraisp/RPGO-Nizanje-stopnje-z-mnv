 % Originalne kontrolne točke
B = [
    0, 0;     
    2, 1;     
    3, 5;    
    4, -3;     
    6, 3;    
    7, -3;     
    9, 5;
    8.5, 0;
    10, -1
];

% Parametri za Bézierjevo krivuljo
t = linspace(0, 1, 100);
a = bezier(B,t);


% parameter r, alpha

r = 4;
alpha = 1;

%%%%%%%%%%
kontrolne_znizane =bezier_nmv_kontrolne_tocke(B,1,alpha);
for i=1:r-1
    nove_kontrolne = bezier_nmv_kontrolne_tocke(kontrolne_znizane,1,alpha);
    kontrolne_znizane = nove_kontrolne;
end

%plotbezier(kontrolne,t);
plotbezier(B,t,'r','g');

plotbezier(kontrolne_znizane,t,'b')

