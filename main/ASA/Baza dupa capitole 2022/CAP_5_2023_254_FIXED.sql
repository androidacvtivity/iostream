
SELECT 
D.ANUL,
D.CUIIO,
R.IDNO,
R.DENUMIRE,
R.CUATM,
R.CFP,
R.CFOJ,
R.CAEM2,
    CASE WHEN MAX(CASE WHEN D.CAPITOL IN (1129) AND D.RIND IN ('8') THEN D.COL31 ELSE NULL END) = 0 THEN NULL ELSE MAX( END)
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('500') THEN D.COL8 ELSE NULL END) = 0 THEN NULL ELSE SUM(500_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('500') THEN D.COL9 ELSE NULL END) = 0 THEN NULL ELSE SUM(500_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('500') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(500_COL3) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('510') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(510_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('510') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(510_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('510') THEN D.COL8 ELSE NULL END)  RIND_510_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('510') THEN D.COL9 ELSE NULL END)  RIND_510_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('510') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(510_COL3) END AS
    
        CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('511') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(511_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('511') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(511_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('511') THEN D.COL8 ELSE NULL END)  RIND_511_COL1,------------------------------ END)
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('511') THEN D.COL9 ELSE NULL END)  RIND_511_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('511') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(511_COL3) END AS
    
    
            CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('512') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(512_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('512') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(512_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('512') THEN D.COL8 ELSE NULL END)  RIND_512_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('512') THEN D.COL9 ELSE NULL END)  RIND_512_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('512') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(512_COL3) END AS
    
    
                CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('513') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(513_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('513') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(513_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('513') THEN D.COL8 ELSE NULL END)  RIND_513_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('513') THEN D.COL9 ELSE NULL END)  RIND_513_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('513') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(513_COL3) END AS
    
     CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('514') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(514_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('514') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(514_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('514') THEN D.COL8 ELSE NULL END)  RIND_514_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('514') THEN D.COL9 ELSE NULL END)  RIND_514_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('514') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(514_COL3) END AS
    
    
         CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('515') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(515_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('515') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(515_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('515') THEN D.COL8 ELSE NULL END)  RIND_515_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('515') THEN D.COL9 ELSE NULL END)  RIND_515_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('515') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(515_COL3) END AS
    
    
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('516') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(516_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('516') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(516_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('516') THEN D.COL8 ELSE NULL END)  RIND_516_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('516') THEN D.COL9 ELSE NULL END)  RIND_516_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('516') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(516_COL3) END AS
    
    
        
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('517') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(517_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('517') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(517_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('517') THEN D.COL8 ELSE NULL END)  RIND_517_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('517') THEN D.COL9 ELSE NULL END)  RIND_517_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('517') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(517_COL3) END AS
    
    
            
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('518') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(518_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('518') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(518_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('518') THEN D.COL8 ELSE NULL END)  RIND_518_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('518') THEN D.COL9 ELSE NULL END)  RIND_518_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('518') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(518_COL3) END AS
    
    
                
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('519') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(519_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('519') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(519_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('519') THEN D.COL8 ELSE NULL END)  RIND_519_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('519') THEN D.COL9 ELSE NULL END)  RIND_519_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('519') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(519_COL3) END AS
    
    
     CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('520') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(520_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('520') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(520_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('520') THEN D.COL8 ELSE NULL END)  RIND_520_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('520') THEN D.COL9 ELSE NULL END)  RIND_520_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('520') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(520_COL3) END AS
    

     CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('521') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(521_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('521') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(521_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('521') THEN D.COL8 ELSE NULL END)  RIND_521_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('521') THEN D.COL9 ELSE NULL END)  RIND_521_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('521') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(521_COL3) END AS



     CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('522') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(522_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('522') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(522_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('522') THEN D.COL8 ELSE NULL END)  RIND_522_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('522') THEN D.COL9 ELSE NULL END)  RIND_522_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('522') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(522_COL3) END AS


     CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('523') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(523_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('523') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(523_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('523') THEN D.COL8 ELSE NULL END)  RIND_523_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('523') THEN D.COL9 ELSE NULL END)  RIND_523_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('523') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(523_COL3) END AS
    
    
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('524') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(524_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('524') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(524_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('524') THEN D.COL8 ELSE NULL END)  RIND_524_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('524') THEN D.COL9 ELSE NULL END)  RIND_524_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('524') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(524_COL3) END AS



    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('525') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(525_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('525') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(525_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('525') THEN D.COL8 ELSE NULL END)  RIND_525_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('525') THEN D.COL9 ELSE NULL END)  RIND_525_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('525') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(525_COL3) END AS
    
    
        CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('526') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(526_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('526') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(526_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('526') THEN D.COL8 ELSE NULL END)  RIND_526_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('526') THEN D.COL9 ELSE NULL END)  RIND_526_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('526') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(526_COL3) END AS



    
        CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('527') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(527_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('527') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(527_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('527') THEN D.COL8 ELSE NULL END)  RIND_527_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('527') THEN D.COL9 ELSE NULL END)  RIND_527_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('527') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(527_COL3) END AS



    
        CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('528') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(528_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('528') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(528_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('528') THEN D.COL8 ELSE NULL END)  RIND_528_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('528') THEN D.COL9 ELSE NULL END)  RIND_528_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('528') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(528_COL3) END AS



        CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('529') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(529_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('529') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(529_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('529') THEN D.COL8 ELSE NULL END)  RIND_529_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('529') THEN D.COL9 ELSE NULL END)  RIND_529_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('529') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(529_COL3) END AS



        CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('530') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(530_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('530') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(530_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('530') THEN D.COL8 ELSE NULL END)  RIND_530_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('530') THEN D.COL9 ELSE NULL END)  RIND_530_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('530') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(530_COL3) END AS
    
    
     CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('530') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(530_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('530') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(530_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('530') THEN D.COL8 ELSE NULL END)  RIND_530_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('530') THEN D.COL9 ELSE NULL END)  RIND_530_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('530') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(530_COL3) END AS
    
     CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('531') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(531_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('531') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(531_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('531') THEN D.COL8 ELSE NULL END)  RIND_531_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('531') THEN D.COL9 ELSE NULL END)  RIND_531_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('531') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(531_COL3) END AS
    
         CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('532') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(532_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('532') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(532_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('532') THEN D.COL8 ELSE NULL END)  RIND_532_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('532') THEN D.COL9 ELSE NULL END)  RIND_532_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('532') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(532_COL3) END AS
    
             CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('533') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(533_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('533') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(533_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('533') THEN D.COL8 ELSE NULL END)  RIND_533_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('533') THEN D.COL9 ELSE NULL END)  RIND_533_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('533') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(533_COL3) END AS


             CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('534') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(534_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('534') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(534_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('534') THEN D.COL8 ELSE NULL END)  RIND_534_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('534') THEN D.COL9 ELSE NULL END)  RIND_534_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('534') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(534_COL3) END AS
    
                 CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('535') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(535_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('535') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(535_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('535') THEN D.COL8 ELSE NULL END)  RIND_535_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('535') THEN D.COL9 ELSE NULL END)  RIND_535_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('535') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(535_COL3) END AS



          CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('536') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(536_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('536') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(536_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('536') THEN D.COL8 ELSE NULL END)  RIND_536_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('536') THEN D.COL9 ELSE NULL END)  RIND_536_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('536') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(536_COL3) END AS


  CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('537') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(537_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('537') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(537_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('537') THEN D.COL8 ELSE NULL END)  RIND_537_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('537') THEN D.COL9 ELSE NULL END)  RIND_537_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('537') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(537_COL3) END AS


  CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('538') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(538_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('538') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(538_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('538') THEN D.COL8 ELSE NULL END)  RIND_538_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('538') THEN D.COL9 ELSE NULL END)  RIND_538_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('538') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(538_COL3) END AS
    
    
      CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('539') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(539_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('539') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(539_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('539') THEN D.COL8 ELSE NULL END)  RIND_539_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('539') THEN D.COL9 ELSE NULL END)  RIND_539_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('539') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(539_COL3) END AS
    
    
          CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('540') THEN D.COL33 ELSE NULL END) = 0 THEN NULL ELSE SUM(540_CUATM) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('540') THEN D.COL37 ELSE NULL END) = 0 THEN NULL ELSE SUM(540_CAEM2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('540') THEN D.COL8 ELSE NULL END)  RIND_540_COL1) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('540') THEN D.COL9 ELSE NULL END)  RIND_540_COL2) END AS
    CASE WHEN SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('540') THEN D.COL10 ELSE NULL END) = 0 THEN NULL ELSE SUM(540_COL3 END)





    
    



   


    
     
FROM   

    CIS2.VW_DATA_ALL_COEF D    
     
     
    
    
                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS  
WHERE
  D.FORM IN (64)             AND 
     
  D.PERIOADA =:pPERIOADA AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'   AND
  D.CAPITOL IN (1128,1129) 
  

 

GROUP BY 

D.ANUL,
D.CUIIO,
R.IDNO,
R.DENUMIRE,
R.CUATM,
R.CFP,
R.CFOJ,
R.CAEM2

ORDER BY
D.CUIIO