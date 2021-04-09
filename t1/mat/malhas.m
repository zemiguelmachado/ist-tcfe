close all
clear all

pkg load symbolic


syms R1
syms R2
syms R3
syms R4
syms R5
syms R6
syms R7 

syms Va
syms Vb
syms Vc

syms Ib
syms Ic
syms Id

syms Kb
syms Kc


%% Malhas

syms IA1
syms IB1
syms IC1
syms ID1

printf("\n\nKVL equations:\n");

R1*IA1 + Vb + R4*(IA1-IC1) - Va == 0
R6*IC1 + R4*IC1 + Vc + R7*IC1 == 0
IB1 = -Ib
ID1 = -Id
IC1 = -Ic


R1 = 1.01458812332e3
R2 = 2.08463766973e3
R3 = 3.01303489873e3
R4 = 4.03070521773e3
R5 = 3.06211563876e3
R6 = 2.03687088929e3
R7 = 1.00498418134e3
Va = 5.23061068922
Id = 1.01940833644e-3
Kb = 7.25561262206e-3
Kc = 8.24424618872e3





Vc = (Kc*Ic)
Ib = Kb*Vb
Vb = R3*(IA1-Ib)


A = [ R1+R4 , 0 , -R4      , 0 , 0  , 0  , 1   , 0   ;...
      0     , 0 , R4+R6+R7 , 0 , 0  , 0  , 0   , 1   ;...
      0     , 1 , 0        , 0 , 1  , 0  , 0   , 0   ;...
      0     , 0 , 0        , 1 , 0  , 0  , 0   , 0   ;...
      0     , 0 , 1        , 0 , 0  , 1  , 0   , 0   ;...
      0     , 0 , 0        , 0 , 0  ,-Kc , 0   , 1   ;...
      0     , 0 , 0        , 0 , 1  , 0  , -Kb , 0   ;...
      -R3   , R3, 0        , 0 , 0  , 0  , 1   , 0   ]
      
B = [Va ; 0 ; 0 ; -Id ; 0 ; 0 ; 0 ; 0]

c=A\B

IA1 = c(1)
IB1 = c(2)
IC1 = c(3)
ID1 = c(4)
Ib = c(5)
Ic = c(6)
Vb = c(7)
Vc = c(8)



fid = fopen ("Malhas_tab.tex", "w");
fprintf(fid, "I_{A} & %e \\\\ \\hline \n", IA1);
fprintf(fid, "I_{B} & %e \\\\ \\hline \n", IB1);
fprintf(fid, "I_{C} & %e \\\\ \\hline \n", IC1);
fprintf(fid, "I_{D} & %e \\\\ \\hline \n", ID1);
fprintf(fid, "@V_{b} & %e \\\\ \\hline \n", Vb);
fprintf(fid, "@V_{c} & %e \\\\ \\hline \n", Vc);
fprintf(fid, "I_{b} & %e \\\\ \\hline \n", Ib);
fprintf(fid, "I_{c} & %e \\\\ \\hline \n", Ic);
fclose (fid);
