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
kontrolne = bezier_nmv_kontrolne_tocke(B,1,0);
plotbezier(kontrolne,t);
plotbezier(B,t,'r')