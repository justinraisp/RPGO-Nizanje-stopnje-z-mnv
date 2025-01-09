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
kontrolne = bezier_nmv_kontrolne_tocke(B,1,0)
%plotbezier(kontrolne,t);
plotbezier(B,t,'r','g');
kontrolne2 = bezier_nmv_kontrolne_tocke(kontrolne,1,0);
kontrolne3 = bezier_nmv_kontrolne_tocke(kontrolne2,1,0);
kontrolne4 = bezier_nmv_kontrolne_tocke(kontrolne3,1,0);
kontrolne5 = bezier_nmv_kontrolne_tocke(kontrolne4,1,0);
kontrolne6 = bezier_nmv_kontrolne_tocke(kontrolne5,1,0);
kontrolne7 = bezier_nmv_kontrolne_tocke(kontrolne6,1,0);


plotbezier(kontrolne4,t,'y','m')
