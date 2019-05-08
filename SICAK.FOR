       CHARACTER BA * 20
  		 DIMENSIONBA(7),IS(7)
  		 DO 15 I=1,7
  		 WRITE(*,11)I
   11  FORMAT(1X,I2,'.NCI BOLGENIN ADI:')
  	    READ(*,2)BA(I)
    2  FORMAT(A20)
  	    ITOP=0
  		 DO 20 J=1,5
       WRITE(*,12)IS(I)
  12   FORMAT((/1X,I3,A\)J,'.NCI SICAKLIGI GIRINIZ')
  		 READ(*,3)K
    3  FORMAT(I3)
  	    ITOP=ITOP+K
  20   CONTINUE
  	    IS(I)=ITOP/5
   15  CONTINUE
  	    WRITE(*,30)
   30  FORMAT(//'=========EKRAN DOKUMU=======')                    
	    WRITE(*,4)
    4  FORMAT(/,'*************************')
 	    WRITE(*,5)
    5  FORMAT(4X,'SIRA',3X,'BOLGENIN ADI',2X,'ORTALAMASI')
	    WRITE(*,4)
	  	 DO 25 I=1,7
	 	 WRITE(*,6)I,BA(I),IS(I)
    6  FORMAT(3X,I2,3X,A20,5X,I3)
  	    L=L+IS(I)
   25  CONTINUE
  	    M=L/7
  		 WRITE(*,4)
 		 WRITE(*,35)M
   35  FORMAT(10X,'GENEL ORTALAMA',I3)
  	    STOP
     	 END
		 
		 	 		 	 	 	 		 	 		 		 