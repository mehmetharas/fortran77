       READ(*,10)HT
   10  FORMAT(F9.0)
  	    IF(HT.LE.30000)THEN
  		 VI=HT*0.2
  		 ELSE
       IF(HT.LE.60000)THEN
     	 VI=6000+(HT-30000)*0.15
 		 ELSE
  		 IF(HT.LE.100000)THEN
  		 VI=10500+(HT-60000)*0.1
  		 ELSE
       VI=14500+(HT-100000)*0.05
       ENDIF
  		 ENDIF
 		 ENDIF
       WRITE(*,15)VI
   15  FORMAT(F7.0)
  	    STOP
       END
		 	 		
		 	 