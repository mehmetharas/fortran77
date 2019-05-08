       DIMENSION A(5,5)
		 INTEGER A,T1,T2
		 READ(*,6)A(I)
     6 FORMAT(I4)
		 T1=0
		 T2=0
		 DO 20 I=1,5
		 T1=A(I,I)
		 T2=A(I,6-I) 	 
    20 WRITE(*,7)I,T1,I,T2
     7 FORMAT(5X,I2,'.NCI SATIR TOPLAMI=',I4/5X,I2, 
	  * '.NCI SUTUN TOPLAMI=',I4)
       STOP
		 END