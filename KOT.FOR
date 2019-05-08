       CHARACTER AD*16,D*5,AS*16,CE
   10  WRITE(*,'(////////////////////////)')
       WRITE(*,20)
   20  FORMAT(27X,35('²')/27X,'I',5X,'NOT ORTALAMASI PROGRAMI',5X,'I'/
     *27X,35('²')//////27X,35('²')/27X,'I',10X,'A N A  M E N U',9X,
     *'I'/27X,35('²')/27X,'I',2X,'1:DOSYA YARATMA',16X,'I'/27X,'I',2X,
     *'2:VERI GIRISI',18X,'I'/27X,'I',2X,'3:EKRAN DOKUMU',17X,'I'/27X,
     *'I',2X,'4:DOSYADAN SILME',15X,'I',/27X,'I',2X,'5:ADINA GORE GORME'
     *13X,'I',/27X,'I',2X,'6:YAZICI DOKUMU',16X,'I',/27X,'I',2X,
     *'7:PROGRAM CIKISI',15X,'I'/27X,35('²')//31X,'SECIMINIZ:  '\)	 
       READ(*,'(I2)')KA        
 	    GOTO(50,60,70,80,90,110,100)KA
	    GOTO 10
   50  OPEN(1,FILE='ORTALA.DOS',STATUS='NEW',FORM='FORMATTED',ACCESS='DI
     *RECT',RECL=45)
	    DO 52 II=1,40
	    AD=' '
       WRITE(1,51,REC=II)AD
   51  FORMAT(A16)
   52  CONTINUE
	    CLOSE(1)
	    GOTO 10
   60 OPEN(1,FILE='ORTALA.DOS',ACCESS='DIRECT',FORM='FORMATTED',RECL=45)
   61  WRITE(*,'(////////////////////////)')
	    WRITE(*,'(11X,A\)')'KAYIT ANAHTARINI GIRINIZ MAX.40:'
   63  READ(*,'(I2)')KS
	    READ(1,51,REC=KS)AD
	    IF(AD.EQ.' ')GOTO 62
	    WRITE(*,'(11X,A\)')'BU KAYIT DOLU ENT BAS:'
       READ(*,'(A1)')CE
	    GOTO 61
   62  WRITE(*,'(////////////////////////)')
       WRITE(*,64)
   64  FORMAT(24X,35('²')/24X,1('I'),3X,'OGRENCI BILGILERI GIRILIYOR',3
     *X,'I'/24X,35('²')//)
	    WRITE(*,65) 
   65  FORMAT(24X,'OGRENCI ADI=X GIRILERSE ANA MENUYE DONULUR'/24X,42('²
     *')////)
	    WRITE(*,'(24X,A\)')'OGRENCININ ADI SOYADI.......:'
       READ(*,'(A16)')AD
	    IF(AD.EQ.'X')GOTO 69
	    WRITE(*,'(24X,A\)')'OGRENCININ LAB.NOTU.........:'
	    READ(*,19)LB
       WRITE(*,'(24X,A\)')'OGRENCININ VIZE NOTU........:'
	    READ(*,19)LV
	    WRITE(*,'(24X,A\)')'OGRENCININ FINAL NOTU.......:'
	    READ(*,19)LF
   19  FORMAT(I3)
	    WRITE(*,71)
   71  FORMAT(24X,50('²'))
	    WRITE(*,'(24X,A\)')'VERILER DOGRU MU(E/H):'
	    READ(*,'(A1)')CE
	    IF(CE.EQ.'H')GOTO 62
	    ORT=LB*0.35+LV*0.35+LF*0.30
	    IF(ORT.GE.50)GOTO 66
	    D='KALDI'
	    GOTO 67
   66  D='GECTI'
   67  WRITE(1,68,REC=KS)AD,LB,LV,LF,ORT,D
   68  FORMAT(1X,A16,1X,I3,1X,I3,1X,I3,1X,F 3.0,1X,A5)
	    WRITE(*,'(/24X,A\)')'DEVAM MI:'
		 READ(*,'(A1)')CE
		 IF(CE.EQ.'E')GOTO 61
   69  CLOSE(1)
	    GOTO 10
   70  OPEN(1,FILE='ORTALA.DOS',FORM='FORMATTED',ACCESS='DIRECT',RECL=
     *45)
	    WRITE(*,'(////////////////////////)')
	    WRITE(*,72)
   72  FORMAT(24X,35('²')/24X,'I',6X,'NOT ORTALAMASI DOKUMU',6X,'I'/24X,
     *35('²')///)
	    WRITE(*,73)
   73  FORMAT(1X,'OGRENCININ ADI SOYADI',3X,'LAB.NOTU',3X,'VIZE NOTU',
     *3X,'FINAL NOTU',3X,'ORTALAMA',2X,'DURUMU'/79('²'))
	    DO 76 I=1,40
   74  READ(1,68,REC=I)AD,LB,LV,LF,ORT,D
	    IF(AD.EQ.' ')GOTO 76
	    WRITE(*,75)AD,LB,LV,LF,ORT,D
   75  FORMAT(1X,A16,10X,I3,8X,I4,9X,I4,7X,F5.0,5X,A5)
   76  CONTINUE
	    WRITE(*,77)
   77  FORMAT(79('²')//6X,'DOKUM BITTI ENT BASINIZ:'\)
	    READ(*,'(A1)')W
	    CLOSE(1)
	    GOTO 10
   80  OPEN(1,FILE='ORTALA.DOS',FORM='FORMATTED',ACCESS='DIRECT',RECL=
     * 45)
   81  WRITE(*,'(////////////////////////)')
	    WRITE(*,'(24X,A\)')'KAYIT ANAHTARINI GIRINIZ:'
	    READ(*,'(I2)')KS
	    READ(1,68,REC=KS)AD,LB,LV,LF
	    IF(AD.EQ.' ')GOTO 87
	    GOTO 88
   87  WRITE(*,'(////////////////////////)')
	    GOTO 98
   88  WRITE(*,'(////////////////////////)')
	    WRITE(*,82)AD
   82  FORMAT(24X,40('²')//24X,'OGRENCININ ADI SOYADI:',A16/)
	    WRITE(*,83)LB
   83  FORMAT(24X,'LAB.NOTU........:',I3/)
	    WRITE(*,84)LV
   84  FORMAT(24X,'VIZE NOTU.......:',I3/)
	    WRITE(*,85)LF
   85  FORMAT(24X,'FINAL NOTU......:',I3/)
	    WRITE(*,'(24X,A\)')'BU KAYDI SILMEK ISTIYOR MUSUNUZ(E/H):'
	    READ(*,'(A1)') CE
	    IF(CE.EQ.'H') GOTO 86
	    AD=' '
	    WRITE(1,51,REC=KS)AD
   86  WRITE(*,'(//24X,A\)')'DEVAM ETMEK ISTIYOR MUSUNUZ:'
	    READ(*,'(A1)') CE
	    IF(CE.EQ.'E')GOTO 81
	    CLOSE (1)
	    GOTO 10
   90 OPEN(1,FILE='ORTALA.DOS',ACCESS='DIRECT',FORM='FORMATTED',RECL=45)
   91  WRITE(*,'(////////////////////////)')
	    WRITE(*,'(24X,A\)')'GORMEK ISTEDIGINIZ KISININ ADI SOYADI:'
	    READ(*,'(A16)') AS
	    DO 99 I=1,40
	    READ(1,68,REC=I)AD,LB,LV,LF,ORT,D
	    IF(AS.EQ.AD)THEN
	    WRITE(*,'(////////////////////////)')
	    WRITE(*,92)AD
   92  FORMAT(25X,50('²')/25X,'OGRENCININ ADI SOYADI..:',A16/)
	    WRITE(*,93)LB
   93  FORMAT(25X,'LAB.NOTU...........................:',I3/)
	    WRITE(*,94)LV
   94  FORMAT(25X,'VIZE NOTU..........................:',I3/)
	    WRITE(*,95)LF
   95  FORMAT(25X,'FINAL NOTU.........................:',I3/)
	    WRITE(*,96)ORT
   96  FORMAT(25X,'NOT ORTALAMASI.....................:',F5.2/)
	    WRITE(*,97)D
   97  FORMAT(25X,'GECTIMI-KALDIMI....................:',A5/)
	    WRITE(*,111)
  111  FORMAT(25X,50('²')/25X,'DEVAM ETMEK ISTIYOR MUSUNUZ:'\)
       READ(*,'(A1)')CE
   	 IF(CE.EQ.'E')GOTO 91
	    GOTO 78
	    ENDIF
   99  CONTINUE
   98  WRITE(*,'(25X,A\)')'BU ISIM YOK DEVAM EDIYOR MUSUNUZ(E/H):'
	    READ(*,'(A1)')CE
	    IF(CE.EQ.'E') GOTO 91
   78  CLOSE(1)
	    GOTO 10
  101  WRITE(*,'(///////////////////////)')
  110  OPEN(1,FILE='ORTALA.DOS',ACCESS='DIRECT',FORM='FORMATTED',RECL=
     *45)
	    OPEN(6,FILE='LPT1',STATUS='NEW')
       WRITE(6,115)
  115  FORMAT(24X,35('²')/24X,'I',10X,'YAZICI DOKUMU',10X,'I'/24X,
     *35('²')///)
       WRITE(6,113)
  113  FORMAT(1X,'OGRENCININ ADI SOYADI',3X,'LAB.NOTU',3X,'VIZE NOTU'
     *,3X,'FINAL NOTU',3X,'ORTALAMASI',3X,'DURUMU'/79('²'))
	    DO 130 I=1,40
  114  READ(1,68,REC=I)AD,LB,LV,LF,ORT,D
       IF(AD.EQ.' ')GOTO 130
	    WRITE(6,127)AD,LB,LV,LF,ORT,D
  127  FORMAT(1X,A16,10X,I3,9X,I4,8X,I4,7X,F3.0,5X,A5)
  130  CONTINUE
       WRITE(6,118)
  118  FORMAT(79('²')//6X,'YAZICI DOKUMU BITTI ENT BAS:'\)
       READ(*,'(A1)')W
	    CLOSE(1)
		 CLOSE(6)
	    GOTO 10
  100  STOP
       END
             
				 