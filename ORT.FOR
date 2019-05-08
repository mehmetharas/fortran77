      DIMENSION  AS(10),NT(10,5),ONO(10)
      REAL NT
      CHARACTER * 20 AS
      DO 20 I=1,10
      READ(*,6)AS(I)
      READ(*,7)(NT(I,J),J=1,5)
   20  CONTINUE
    6  FORMAT(A20)
    7  FORMAT(F6.0)

      SNORT=ORT(NT,10,5,ONO)
      CALL STR(AS,ONO,10)
      WRITE(*,8)
    8  FORMAT(10X,'SINIF NOT LISTESI'/15X,40('-')/15X,'SIRA',2X,'AD-SOYA
     *D',4X,'NOT ORT,'/5X,40('-'))
      DO 30 I=1,10
      WRITE(*,9)I,AS(I),ONO(I)
   30  CONTINUE
      WRITE(*,10)SNORT
    9  FORMAT(6X,I2,3X,A20,4X,F8.2)
   10  FORMAT(5X,40('-')/5X,'SINIF ORTALAMASI=',F8.2)
      STOP
      END
       FUNCTION ORT(A,M,N,ON)
       DIMENSION A(10,5),ON(10)
       ORT=0.0
       DO 10 I=1,M
       ON(I)=0.0
       DO 20 J=1,N
       ON(I)=ON(I)+A(I,J)
   20  CONTINUE
       ON(I)=ON(I)/N
       ORT=ORT+ON(I)
   10  CONTINUE
      ORT=ORT/M
      RETURN
      END
      SUBROUTINE STR(AD,ON,M)
      DIMENSION AD(10),ON(10)
      N=M-1
      DO 20 I=1,N
      L=I+1
      DO 20 J=L,M
      IF(ON(I).GE.ON(I))GOTO 20
      X=ON(I)
      ON(I)=ON(J)
      ON(J)=X
      ADS=AD(I)
      AD(I)=AD(J)
      AD(J)=ADS
   20 CONTINUE
      RETURN
      END
		  	 	   	  	 	      	 
											 
											 
											 