       CHARACTER AD*16,D*5,AS*16,CE
   10  WRITE(*,'(////////////////////////)')
       WRITE(*,20)
   20 FORMAT(27X,35('=')/27X,'I',5X,'NOT ORTALAMASI PROGRAMI',5X,'I'/
     *27X,35('=')//////27X,35('=')/27X,'I',5X,'ANA MENU',18X,'I'/27X,
     *35('=')/27X,'I',2X,'1:DOSYA YARATMA',14X,'I'/27X,'I',2X,'2:VERI GI
     *RISI',16X,'I'/27X,'I',2X,'3:EKRAN DOKUMU',15X,'I'/27X,'I',2X,'4:DO
     *SYADAN SILME',13X,'I',/27X,'I',2X,'5:ADINA GORE GORME'11X,'I',/27X
     *,'I',2X,'6:YAZICI DOKUMU',14X,'I',/27X,'I',2X,'7:PROGRAM CIKISI'
     *,14X,'I'/27X,35('=')//31X,'SECIMINIZ  '\)	 
	    READ(*,'(I2)')KA
		 GOTO(50,60,70,80,90,110,100)KA
		 GOTO 10
   50  OPEN(2,FILE='ORTALA.DOS',STATUS='NEW',FORM='FORMATTED',ACCESS='DI
     *RECT',RECL=45)
	    DO 52 II=1,40
		 AD=' '
		 WRITE(2,51,REC=II)AD
   51  FORMAT(A16)
   52  CONTINUE
	    CLOSE(2)
		 GOTO 10
   60 OPEN(2,FILE='ORTALA.DOS',ACCESS='DIRECT',FORM='FORMATTED',RECL=45)
   61  WRITE(*,'(////////////////////////)')
	    WRITE(*,'(11X,A\)')'KAYIT ANAHTARINI GIRINIZ MAX=40:'
   63  READ(*,'(I2)')KS
	    READ(2,51,REC=KS)AD
		 IF(AD.EQ.' ')GOTO 62
		 WRITE(*,'(11X,A1)')'BU KAYIT DOLU ENT BAS:'
		 READ(*,'(A1)')CE
		 GOTO 63
   62  WRITE(*,'(////////////////////////)')
    	 WRITE(*,64)
   64  FORMAT(24X,35('*')/24X,1('I'),3X,'OGRENCI BILGILERI GIRILIYOR',3
     * X,'I'/24X,35('*')//)
	    WRITE(*,65) 
   65  FORMAT(24X,'OGRENCI ADI=X GIRILERSE ANA MENUYE DONULUR'/24X,44('*
     * ')////)
		 WRITE(*,'(24X,A\)')'OGRENCININ ADI SOYADI.......:'
		 READ(*,'(A16)')AD
		 IF(AD.EQ.'X')GOTO 69
		 WRITE(*,'(24X,A\)')'OGRENCININ LABAROTUAR NOTU..:'
		 READ(*,19)LB
		 WRITE(*,'(24X,A\)')'OGRENCININ VIZE NOTU........:'
		 READ(*,19)LV
		 WRITE(*,'(24X,A\)')'OGRENCININ FINAL NOTU.......:'
		 READ(*,19)LF
   19  FORMAT(I3)
	    WRITE(*,71)
   71  FORMAT(24X,50('*'))
	    WRITE(*,'(24X,A\)')'VERILER DOGRUMU(E/H):'
		 READ(*,'(A1)')CE
		 IF(CE.EQ.'H')GOTO 62
		 ORT=LB*0.35+LV*0.35+LF*0.30
		 IF(ORT.GE.50)GOTO 66
		 D=' KALDI'
		 GOTO 67
   66  D=' GECTI'
   67  WRITE(2,68,REC=KS)AD,LB,LV,LF,ORT,D
   68  FORMAT(A16,1X,I3,1X,I3,1X,I3,1X,F3.0,1X,A5)
	    GOTO 61
   69  CLOSE(2)
	    GOTO 10
   70 OPEN(2,FILE='ORTALA.DOS',FORM='FORMATTED',ACCESS='DIRECT',RECL=45)
		 WRITE(*,'(////////////////////////)')
		 WRITE(*,72)
   72  FORMAT(24X,35('=')/24X,'I',6X,'NOT ORTALAMASI DOKUMU',6X,'I'/24X,
     *35('=')///)
	    WRITE(*,73)
   73  FORMAT(1X,'OGRENCININ ADI SOYADI',3X,'LAB. NOTU',3X,'VIZE NOTU',3
     *X,'FINAL NOTU',3X,'ORTALAMA',3X,'DURUMU'/79('='))
	    DO 76 I=1,40
   74  READ(2,68,REC=I)AD,LB,LV,LF,ORT,D
	    IF(AD.EQ.' ')GOTO 76
		 WRITE(*,75)AD,LB,LV,LF,ORT,D
   75  FORMAT(3X,A16,5X,I3,6X,I4,9X,I4,12X,F5.0,5X,A5)
   76  CONTINUE
	    WRITE(*,77)
   77  FORMAT(80('=')//6X,'DOKUM BITTI ENT BASINIZ:'\)
	    READ(*,'(A1)')W
		 CLOSE(2)
		 GOTO 10
   80  OPEN(2,FILE='ORTALA.DOS',FORM='FORMATTED',ACCESS='DIRECT',RECL=
     *45)
   81  WRITE(*,'(////////////////////////)')
	    WRITE(*,'(24X,A\)')'KAYIT ANAHTARINI GIRINIZ'
		 READ(*,'(I2)')KS
		 READ(2,68,REC=KS)AD,LB,LV,LF
		 IF(AD.EQ.' ')GOTO 87
		 GOTO 88
   87  WRITE(*,'(////////////////////////)')
	    GOTO 98
   88  WRITE(*,'(////////////////////////)')
	    WRITE(*,82)AD
   82  FORMAT(24X,40('*')//24X,'OGRENCININ ADI SOYADI:'A16/)
	    WRITE(*,83)LB
   83  FORMAT(24X,'LAB.NOTU........:',I3/)
	    WRITE(*,84)LV
   84  FORMAT(24X,'VIZE NOTU.......:',I3/)
	    WRITE(*,85)LF
   85  FORMAT(24X,'FINAL NOTU......:'I3/)
	    WRITE(*,'(A\)')'BUKAYIDI SILMEK ISTIYORMUSUNUZ(E/H)'
		 READ(*,'(A1)') CE
		 IF(CE.EQ.'H') GOTO 86
		 AD=' '
		 WRITE(2,51,REC=KS)AD
   86  WRITE(*,'(24X,A\)')'DEVAM ETMEK ISTIYORMUSUNUZ:'
	    READ(*,'(A\)') CE
		 IF(CE.EQ.'E')GOTO 81
		 CLOSE (2)
		 GOTO 10
   90  OPEN(2,FILE='ORTALA.DOS',ACCESS='DIRECT',FORM='FORMATTED',RECL=45
     *)
   91  WRITE(*,'(////////////////////////)')
	    WRITE(*,'(24X,A\)')'GORMEK ISTEDIGINIZ KISMIN ADI SOYADI'
		 READ(*,'(A16)') AS
		 DO 99 I=1,40
		 READ(2,68,REC=I)AD,LB,LV,LF,ORT,D
		 IF(AS.EQ.AD)THEN
		 WRITE(*,'(//////////////////////)')
		 WRITE(*,92)AD
   92  FORMAT(25X,50('=')/25X,'OGRENCININ ADI SOYADI...:',A16/)
	    WRITE(*,93)LB
   93  FORMAT(25X,'LABARATUVAR NOTU.....................:',I3/)
	    WRITE(*,94)LV
   94  FORMAT(25X,'VIZE NOTU............................:',I4/)
	    WRITE(*,95)LF
   95  FORMAT(25X,'FINAL NOTU...........................:',I4/)
	    WRITE(*,96)ORT
   96  FORMAT(25X,'NOT ORTALAMASI.......................:',F5.0/)
	    WRITE(*,97)D
   97  FORMAT(25X,'GECTIMI-KALDIMI......................:',A5/)
	    WRITE(*,111)
  111  FORMAT(25X,50('=')/25X,'DEVAM ETMEK ISTIYORMUSUNUZ:'\)
       READ(*,'(A\)')CE
		 IF(CE.EQ.'E')GOTO 91
		 GOTO 78
		 ENDIF
   99  CONTINUE
   98  WRITE(*,'(25X,A\)')'BU ISIM YOK DEVAM EDIYORMUSUNUZ(E/H):'
	    READ(*,'(A1)')CE
		 IF(CE.EQ.'E') GOTO 91
   78  CLOSE(2)
	    GOTO 10
  101  WRITE(*,'(///////////////////////)')
  110  OPEN(2,FILE='LPT1',STATUS='NEW')
       WRITE(2,112)
  112  FORMAT(24X,35('=')/24X,'I',6X,'YAZICI DOKUMU',6X,'I'/24X,35('=')
     * ///)
	    WRITE(2,113)
  113  FORMAT(1X,'OGRENCININ ADI SOYADI',3X,'LAB.NOTU',3X,'VIZE NOTU',3X
     *,'FINAL NOTU',3X,'ORTALAMA',3X,'DOKUMU'/79('='))
	    DO 116 I=1,40
  114  READ(2,68,REC=I)AD,LB,LV,LF,ORT,D
       IF(AD.EQ.' ')GOTO 116
		 WRITE(2,115)AD,LB,LV,LF,ORT,D
  115  FORMAT(6X,A16,5X,I3,6X,I4,8X,I4,12X,F5.0,5X,A5)
  116  CONTINUE
       WRITE(2,117)
  117  FORMAT(80('=')//6X,'YAZICI DOKUMU BITTI ENT BAS:'\)
       READ(*,'(F1.0)')W
		 CLOSE(2)
		 GOTO 10
  100	 STOP
       END
       