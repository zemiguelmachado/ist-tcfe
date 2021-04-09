close all
clear all

pkg load symbolic;


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

syms v1
syms v2
syms v3
syms v4
syms v5
syms v6
syms v7
syms v8

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


printf("KVL equations: \n")

(v6-v1)/R1 + (v7-v1)/R2 - Vb/R3 == 0
Id - (v4-v2)/R5 - Ib == 0
Ib - (v7-v1)/R2 == 0
Ic - (v8-v6)/R7 == 0
Vb == v1-v2
Va == v6-v3
Vc == v2-v5
Vc == Kc*Ic
Ib == Kb*Vb
v2=0
Ic + (v6-v1)/R1 - (v2-v1)/R1 == 0




A = [-inv(R1)-inv(R2) ,    0     ,    0      ,   0     ,   0     , inv(R1) ,  inv(R2)   ,   0       , 0 , 0   , 0 ,-inv(R3); ...
            0         , -inv(R5) ,    0      , inv(R5) ,   0     ,    0    ,    0       ,   0       , 0 , 0   , 1 ,    0  ; ...
          inv(R2)     ,    0     ,    0      ,   0     ,   0     ,    0    , -inv(R2)   ,   0       , 0 , 0   , 1 ,    0  ; ...
            0         ,    0     ,    0      ,   0     , inv(R7) ,    0    ,    0       , -inv(R7)  , 0 , 0   , 0 ,    1  ; ...
            -1        ,    1     ,    0      ,   0     ,   0     ,    0    ,    0       ,   0       , 1 , 0   , 0 ,    0  ; ...
            0         ,    0     ,    -1     ,   0     ,   0     ,    1    ,    0       ,   0       , 0 , 0   , 0 ,    0  ; ...
            0         ,   -1     ,    0      ,   0     ,   1     ,    0    ,    0       ,   0       , 0 , 1   , 0 ,    0  ; ...
            0         ,    0     ,    0      ,   0     ,   0     ,    0    ,    0       ,   0       , 0 , 1   , 0 ,   -Kc ; ...
            0         ,    0     ,    0      ,   0     ,   0     ,    0    ,    0       ,   0       , 0 , -Kb , 1 ,    0  ; ...
            0         ,    0     , -inv(R6)  ,   0     ,   0     ,    0    ,    0       ,   0       , 0 , 1   , 0 ,   -Kc ; ...
            0         ,    1     ,    0      ,   0     ,   0     ,    0    ,    0       ,   0       , 0 , 1   , 0 ,   -Kc ; ...
         -inv(R4)     , -inv(R4) ,  inv(R4)  ,   0     ,   0     , inv(R1) ,    0       ,   0       , 0 , 1   , 1 ,   -Kc]
            


B = [0;Id;0;0;0;Va;0;0;0;0;0;0]

c=A\B

v1 = c(1)
v2 = c(2)
v3 = c(3)
v4 = c(4)
v5 = c(5)
v6 = c(6)
v7 = c(7)
v8 = c(8)
Vb = c(9)
Vc = c(10)
Ib = c(11)
Ic = c(12)


fid = fopen ("Nos_tab.tex", "w");

fprintf(fid, "V_{1} & %e  \\\\ \\hline \n", v1);
fprintf(fid, "V_{2} & %e  \\\\ \\hline \n", v2);
fprintf(fid, "V_{3} & %e  \\\\ \\hline \n", v3);
fprintf(fid, "V_{4} & %e  \\\\ \\hline \n", v4);
fprintf(fid, "V_{5} & %e  \\\\ \\hline \n", v5);
fprintf(fid, "V_{6} & %e  \\\\ \\hline \n", v6);
fprintf(fid, "V_{7} & %e  \\\\ \\hline \n", v7);
fprintf(fid, "V_{8} & %e  \\\\ \\hline \n", v8);
fprintf(fid, "V_{b} & %e  \\\\ \\hline \n", Vb);
fprintf(fid, "V_{c} & %e  \\\\ \\hline \n", Vc);
fprintf(fid, "I_{b} & %e  \\\\ \\hline \n", Ib);
fprintf(fid, "I_{c} & %e  \\\\ \\hline \n", Ic);
fclose (fid);




