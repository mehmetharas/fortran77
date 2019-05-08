rem   *****************************************************************
rem   *  Bu .bat programi B: surucusune yuklenmis bir FORTRAN-77      *
rem   *  programini FOR1, PAS2, LINK eder ve calistirir               *
rem   *****************************************************************
rem   *  FOR1, PAS2 derleyici disketi A> surucuye takiniz             *
rem   *  Programinizin bulundugu disketi B> surucuye takiniz          *
rem   *  A>BEBIM <program ismi> [ENT] diyeceksiniz                    *
pause *  Derleme ve Link islemi basliyor [ENT] bas:                   *
B:
A:FOR1 %1;
A:PAS2 %1;
A:LINK %1;
%1
A:
