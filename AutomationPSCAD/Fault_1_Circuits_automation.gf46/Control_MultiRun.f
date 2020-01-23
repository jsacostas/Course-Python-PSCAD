!=======================================================================
! Generated by  : PSCAD v4.6.2.0
!
! Warning:  The content of this file is automatically generated.
!           Do not modify, as any changes made here will be lost!
!-----------------------------------------------------------------------
! Component     : Control_MultiRun
! Description   : 
!-----------------------------------------------------------------------


!=======================================================================

      SUBROUTINE Control_MultiRunDyn(Vg1, Vg2, Vg3, Tf, tC1i, tC1o,     &
     &   tC2i, tC2o, tC3i, tC3o, tC4i, tC4o, tC1iRelig, tC2iRelig,      &
     &   tC3iRelig, tC4iRelig, Fault_C1, Fault_C2, Fault_C3, Fault_C4)

!---------------------------------------
! Standard includes
!---------------------------------------

      INCLUDE 'nd.h'
      INCLUDE 'emtconst.h'
      INCLUDE 'emtstor.h'
      INCLUDE 's0.h'
      INCLUDE 's1.h'
      INCLUDE 's2.h'
      INCLUDE 's4.h'
      INCLUDE 'branches.h'
      INCLUDE 'pscadv3.h'
      INCLUDE 'fnames.h'
      INCLUDE 'radiolinks.h'
      INCLUDE 'matlab.h'
      INCLUDE 'rtconfig.h'

!---------------------------------------
! Function/Subroutine Declarations
!---------------------------------------

      REAL    GASDEV        ! Normal Random Number Generator
!     SUBR    EMTDC_X2COMP  ! 'Comparator with Interpolation'

!---------------------------------------
! Variable Declarations
!---------------------------------------


! Subroutine Arguments
      REAL,    INTENT(IN)  :: Vg1(3), Vg2(3)
      REAL,    INTENT(IN)  :: Vg3(3), Fault_C1
      REAL,    INTENT(IN)  :: Fault_C2, Fault_C3
      REAL,    INTENT(IN)  :: Fault_C4
      REAL,    INTENT(OUT) :: Tf, tC1i, tC1o
      REAL,    INTENT(OUT) :: tC2i, tC2o, tC3i
      REAL,    INTENT(OUT) :: tC3o, tC4i, tC4o
      REAL,    INTENT(OUT) :: tC1iRelig
      REAL,    INTENT(OUT) :: tC2iRelig
      REAL,    INTENT(OUT) :: tC3iRelig
      REAL,    INTENT(OUT) :: tC4iRelig

! Electrical Node Indices

! Control Signals
      INTEGER  IT_1, IT_2, IT_3, IT_4, IT_5, IT_6
      INTEGER  IT_7, IT_8
      REAL     R_C4, R_C3, R_C2, R_C1, Ctrl_C1
      REAL     RT_1(3), RT_2(3), RT_3, RT_4
      REAL     Ctrl_C4, RT_5, RT_6, TC4_Out, RT_7
      REAL     RT_8, Ctrl_C3, RT_9, RT_10
      REAL     TC3_Out, RT_11, RT_12, Ctrl_C2
      REAL     RT_13, RT_14, TC2_Out, RT_15
      REAL     Max_G, Min_G, RT_16, RT_17, RT_18
      REAL     RT_19, RT_20, RT_21, RT_22, RT_23
      REAL     RT_24, RT_25, RT_26, RT_27(3)
      REAL     RT_28, RT_29, RT_30, TC1_Out
      REAL     RT_31, RT_32, Tfalla, Enab, RT_33
      REAL     RT_34, TC1_In, RT_35, RT_36
      REAL     TC2_In, RT_37, RT_38, TC3_In
      REAL     RT_39, RT_40, TC4_In, RT_41, RT_42
      REAL     TC1_In_Relig, TC2_In_Relig
      REAL     TC3_In_Relig, TC4_In_Relig

! Internal Variables
      INTEGER  IVD1_1
      REAL     RVD1_1, RVD2_1(2)

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER ISTOI, ISTOF, IT_0                  ! Storage Indices
      INTEGER SS                                  ! SS/Node/Branch/Xfmr


!---------------------------------------
! Local Indices
!---------------------------------------

! Dsdyn <-> Dsout transfer index storage

      NTXFR = NTXFR + 1

      TXFR(NTXFR,1) = NSTOL
      TXFR(NTXFR,2) = NSTOI
      TXFR(NTXFR,3) = NSTOF
      TXFR(NTXFR,4) = NSTOC

! Define electric network subsystem number

      SS        = NODE(NNODE+1)

! Increment and assign runtime configuration call indices

      ICALL_NO  = NCALL_NO
      NCALL_NO  = NCALL_NO + 1

! Increment global storage indices

      ISTOI     = NSTOI
      NSTOI     = NSTOI + 8
      ISTOF     = NSTOF
      NSTOF     = NSTOF + 98
      NNODE     = NNODE + 2
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Transfers from storage arrays
!---------------------------------------

      IT_1     = STOI(ISTOI + 1)
      R_C4     = STOF(ISTOF + 27)
      IT_2     = STOI(ISTOI + 2)
      R_C3     = STOF(ISTOF + 28)
      IT_3     = STOI(ISTOI + 3)
      R_C2     = STOF(ISTOF + 29)
      IT_4     = STOI(ISTOI + 4)
      R_C1     = STOF(ISTOF + 30)
      IT_5     = STOI(ISTOI + 5)
      IT_6     = STOI(ISTOI + 6)
      IT_7     = STOI(ISTOI + 7)
      IT_8     = STOI(ISTOI + 8)
      Ctrl_C1  = STOF(ISTOF + 31)
      RT_3     = STOF(ISTOF + 38)
      RT_4     = STOF(ISTOF + 39)
      Ctrl_C4  = STOF(ISTOF + 40)
      RT_5     = STOF(ISTOF + 41)
      RT_6     = STOF(ISTOF + 42)
      TC4_Out  = STOF(ISTOF + 43)
      RT_7     = STOF(ISTOF + 44)
      RT_8     = STOF(ISTOF + 45)
      Ctrl_C3  = STOF(ISTOF + 46)
      RT_9     = STOF(ISTOF + 47)
      RT_10    = STOF(ISTOF + 48)
      TC3_Out  = STOF(ISTOF + 49)
      RT_11    = STOF(ISTOF + 50)
      RT_12    = STOF(ISTOF + 51)
      Ctrl_C2  = STOF(ISTOF + 52)
      RT_13    = STOF(ISTOF + 53)
      RT_14    = STOF(ISTOF + 54)
      TC2_Out  = STOF(ISTOF + 55)
      RT_15    = STOF(ISTOF + 56)
      Max_G    = STOF(ISTOF + 57)
      Min_G    = STOF(ISTOF + 58)
      RT_16    = STOF(ISTOF + 59)
      RT_17    = STOF(ISTOF + 60)
      RT_18    = STOF(ISTOF + 61)
      RT_19    = STOF(ISTOF + 62)
      RT_20    = STOF(ISTOF + 63)
      RT_21    = STOF(ISTOF + 64)
      RT_22    = STOF(ISTOF + 65)
      RT_23    = STOF(ISTOF + 66)
      RT_24    = STOF(ISTOF + 67)
      RT_25    = STOF(ISTOF + 68)
      RT_26    = STOF(ISTOF + 69)
      RT_28    = STOF(ISTOF + 73)
      RT_29    = STOF(ISTOF + 74)
      RT_30    = STOF(ISTOF + 75)
      TC1_Out  = STOF(ISTOF + 76)
      RT_31    = STOF(ISTOF + 77)
      RT_32    = STOF(ISTOF + 78)
      Tfalla   = STOF(ISTOF + 79)
      Enab     = STOF(ISTOF + 80)
      RT_33    = STOF(ISTOF + 81)
      RT_34    = STOF(ISTOF + 82)
      TC1_In   = STOF(ISTOF + 83)
      RT_35    = STOF(ISTOF + 84)
      RT_36    = STOF(ISTOF + 85)
      TC2_In   = STOF(ISTOF + 86)
      RT_37    = STOF(ISTOF + 87)
      RT_38    = STOF(ISTOF + 88)
      TC3_In   = STOF(ISTOF + 89)
      RT_39    = STOF(ISTOF + 90)
      RT_40    = STOF(ISTOF + 91)
      TC4_In   = STOF(ISTOF + 92)
      RT_41    = STOF(ISTOF + 93)
      RT_42    = STOF(ISTOF + 94)
      TC1_In_Relig = STOF(ISTOF + 95)
      TC2_In_Relig = STOF(ISTOF + 96)
      TC3_In_Relig = STOF(ISTOF + 97)
      TC4_In_Relig = STOF(ISTOF + 98)

! Array (1:3) quantities...
      DO IT_0 = 1,3
         RT_1(IT_0) = STOF(ISTOF + 31 + IT_0)
         RT_2(IT_0) = STOF(ISTOF + 34 + IT_0)
         RT_27(IT_0) = STOF(ISTOF + 69 + IT_0)
      END DO


!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


!---------------------------------------
! Configuration of Models
!---------------------------------------

      IF ( TIMEZERO ) THEN
         FILENAME = 'Control_MultiRun.dta'
         CALL EMTDC_OPENFILE
         SECTION = 'DATADSD:'
         CALL EMTDC_GOTOSECTION
      ENDIF
!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 50:[const] Real Constant 

      Min_G = -0.006

! 70:[const] Real Constant 

      Max_G = 0.006

! 90:[const] Real Constant 

      RT_32 = 0.0708

! 110:[const] Real Constant 

      RT_29 = 0.1

! 120:[abs] Absolute Value 
!
      DO IVD1_1=1,3
        RT_27(IVD1_1) = ABS(Vg2(IVD1_1))
      ENDDO
!

! 130:[const] Real Constant 

      RT_28 = 0.02

! 140:[const] Real Constant 

      RT_33 = 0.5

! 150:[random] Random Number Generator 
! Random Number Output - Normal Distribution
      IF (FIRSTSTEP) THEN
        CALL RANDOM_MRUN(1, Min_G, Max_G, 3.0, RVD1_1)
        STORF(NSTORF) = RVD1_1
      ENDIF
      RT_30 = STORF(NSTORF)
      NSTORF = NSTORF + 1

! 160:[random] Random Number Generator 
! Random Number Output - Normal Distribution
      IF (FIRSTSTEP) THEN
        CALL RANDOM_MRUN(1, Min_G, Max_G, 3.0, RVD1_1)
        STORF(NSTORF) = RVD1_1
      ENDIF
      RT_15 = STORF(NSTORF)
      NSTORF = NSTORF + 1

! 170:[abs] Absolute Value 
!
      DO IVD1_1=1,3
        RT_1(IVD1_1) = ABS(Vg3(IVD1_1))
      ENDDO
!

! 180:[random] Random Number Generator 
! Random Number Output - Normal Distribution
      IF (FIRSTSTEP) THEN
        CALL RANDOM_MRUN(1, Min_G, Max_G, 3.0, RVD1_1)
        STORF(NSTORF) = RVD1_1
      ENDIF
      RT_34 = STORF(NSTORF)
      NSTORF = NSTORF + 1

! 190:[const] Real Constant 

      RT_11 = 0.1

! 200:[const] Real Constant 

      RT_41 = 0.7

! 210:[const] Real Constant 

      RT_13 = 0.02

! 220:[const] Real Constant 

      RT_35 = 0.5

! 230:[random] Random Number Generator 
! Random Number Output - Normal Distribution
      IF (FIRSTSTEP) THEN
        CALL RANDOM_MRUN(1, Min_G, Max_G, 3.0, RVD1_1)
        STORF(NSTORF) = RVD1_1
      ENDIF
      RT_12 = STORF(NSTORF)
      NSTORF = NSTORF + 1

! 240:[random] Random Number Generator 
! Random Number Output - Normal Distribution
      IF (FIRSTSTEP) THEN
        CALL RANDOM_MRUN(1, Min_G, Max_G, 3.0, RVD1_1)
        STORF(NSTORF) = RVD1_1
      ENDIF
      RT_14 = STORF(NSTORF)
      NSTORF = NSTORF + 1

! 250:[time-sig] Output of Simulation Time 
      RT_42 = TIME

! 260:[random] Random Number Generator 
! Random Number Output - Normal Distribution
      IF (FIRSTSTEP) THEN
        CALL RANDOM_MRUN(1, Min_G, Max_G, 3.0, RVD1_1)
        STORF(NSTORF) = RVD1_1
      ENDIF
      RT_36 = STORF(NSTORF)
      NSTORF = NSTORF + 1

! 270:[const] Real Constant 

      RT_7 = 0.1

! 280:[const] Real Constant 

      RT_9 = 0.02

! 290:[const] Real Constant 

      RT_37 = 0.5

! 300:[random] Random Number Generator 
! Random Number Output - Normal Distribution
      IF (FIRSTSTEP) THEN
        CALL RANDOM_MRUN(1, Min_G, Max_G, 3.0, RVD1_1)
        STORF(NSTORF) = RVD1_1
      ENDIF
      RT_8 = STORF(NSTORF)
      NSTORF = NSTORF + 1

! 310:[random] Random Number Generator 
! Random Number Output - Normal Distribution
      IF (FIRSTSTEP) THEN
        CALL RANDOM_MRUN(1, Min_G, Max_G, 3.0, RVD1_1)
        STORF(NSTORF) = RVD1_1
      ENDIF
      RT_10 = STORF(NSTORF)
      NSTORF = NSTORF + 1

! 320:[random] Random Number Generator 
! Random Number Output - Normal Distribution
      IF (FIRSTSTEP) THEN
        CALL RANDOM_MRUN(1, Min_G, Max_G, 3.0, RVD1_1)
        STORF(NSTORF) = RVD1_1
      ENDIF
      RT_38 = STORF(NSTORF)
      NSTORF = NSTORF + 1

! 330:[consti] Integer Constant 

      IT_8 = 0

! 340:[consti] Integer Constant 

      IT_7 = 0

! 350:[const] Real Constant 

      RT_3 = 0.1

! 360:[const] Real Constant 

      RT_5 = 0.02

! 370:[const] Real Constant 

      RT_39 = 0.5

! 380:[random] Random Number Generator 
! Random Number Output - Normal Distribution
      IF (FIRSTSTEP) THEN
        CALL RANDOM_MRUN(1, Min_G, Max_G, 3.0, RVD1_1)
        STORF(NSTORF) = RVD1_1
      ENDIF
      RT_4 = STORF(NSTORF)
      NSTORF = NSTORF + 1

! 390:[consti] Integer Constant 

      IT_5 = 0

! 400:[random] Random Number Generator 
! Random Number Output - Normal Distribution
      IF (FIRSTSTEP) THEN
        CALL RANDOM_MRUN(1, Min_G, Max_G, 3.0, RVD1_1)
        STORF(NSTORF) = RVD1_1
      ENDIF
      RT_6 = STORF(NSTORF)
      NSTORF = NSTORF + 1

! 410:[consti] Integer Constant 

      IT_6 = 0

! 420:[random] Random Number Generator 
! Random Number Output - Normal Distribution
      IF (FIRSTSTEP) THEN
        CALL RANDOM_MRUN(1, Min_G, Max_G, 3.0, RVD1_1)
        STORF(NSTORF) = RVD1_1
      ENDIF
      RT_40 = STORF(NSTORF)
      NSTORF = NSTORF + 1

! 430:[consti] Integer Constant 

      IT_4 = 11

! 440:[consti] Integer Constant 

      IT_2 = 11

! 450:[consti] Integer Constant 

      IT_3 = 11

! 460:[consti] Integer Constant 

      IT_1 = 11

! 470:[abs] Absolute Value 
!
      DO IVD1_1=1,3
        RT_2(IVD1_1) = ABS(Vg1(IVD1_1))
      ENDDO
!

! 480:[datatap] Scalar/Array Tap 
      RT_22 = RT_2(1)

! 490:[datatap] Scalar/Array Tap 
      RT_21 = RT_2(2)

! 500:[datatap] Scalar/Array Tap 
      RT_20 = RT_2(3)

! 510:[datatap] Scalar/Array Tap 
      RT_23 = RT_27(3)

! 520:[datatap] Scalar/Array Tap 
      RT_24 = RT_27(2)

! 530:[datatap] Scalar/Array Tap 
      RT_25 = RT_27(1)

! 540:[datatap] Scalar/Array Tap 
      RT_16 = RT_1(1)

! 550:[datatap] Scalar/Array Tap 
      RT_17 = RT_1(2)

! 560:[datatap] Scalar/Array Tap 
      RT_18 = RT_1(3)

! 570:[compar] Two Input Comparator 
!
      CALL EMTDC_X2COMP(0,0,RT_41,RT_42,1.0,0.0,0.0,RVD2_1)
      Enab = RVD2_1(1)

! 580:[compar] Two Input Comparator 
!
      CALL EMTDC_X2COMP(0,0,Fault_C1,REAL(IT_8),0.0,0.0,1000.0,RVD2_1)
      Ctrl_C1 = RVD2_1(1)

! 590:[compar] Two Input Comparator 
!
      CALL EMTDC_X2COMP(0,0,Fault_C3,REAL(IT_7),0.0,0.0,1000.0,RVD2_1)
      Ctrl_C3 = RVD2_1(1)

! 600:[compar] Two Input Comparator 
!
      CALL EMTDC_X2COMP(0,0,Fault_C2,REAL(IT_5),0.0,0.0,1000.0,RVD2_1)
      Ctrl_C2 = RVD2_1(1)

! 610:[compar] Two Input Comparator 
!
      CALL EMTDC_X2COMP(0,0,Fault_C4,REAL(IT_6),0.0,0.0,1000.0,RVD2_1)
      Ctrl_C4 = RVD2_1(1)

! 620:[compar] Two Input Comparator 
!
      CALL EMTDC_X2COMP(0,0,Fault_C1,REAL(IT_4),1000.0,0.0,0.0,RVD2_1)
      R_C1 = RVD2_1(1)

! 630:[compar] Two Input Comparator 
!
      CALL EMTDC_X2COMP(0,0,Fault_C3,REAL(IT_2),1000.0,0.0,0.0,RVD2_1)
      R_C3 = RVD2_1(1)

! 640:[compar] Two Input Comparator 
!
      CALL EMTDC_X2COMP(0,0,Fault_C2,REAL(IT_3),1000.0,0.0,0.0,RVD2_1)
      R_C2 = RVD2_1(1)

! 650:[compar] Two Input Comparator 
!
      CALL EMTDC_X2COMP(0,0,Fault_C4,REAL(IT_1),1000.0,0.0,0.0,RVD2_1)
      R_C4 = RVD2_1(1)

! 660:[maxmin] Maximum/Minimum Functions 
      RT_19 = AMAX1(RT_16,RT_17,RT_18)
!

! 670:[maxmin] Maximum/Minimum Functions 
      RT_26 = AMAX1(RT_20,RT_21,RT_22,RT_23,RT_24,RT_25,RT_19)
!

! 680:[mrun] Multiple Run Component 
! ----------------------------------------
! Multiple Run Initialization
! ----------------------------------------
      CALL COMPONENT_ID(ICALL_NO,1352238896)
      CALL MRUNVINI(2,1,0)



! Random or Sequential Variation of First Multiple Run Parameter:
! 1 Runs
      CALL MRUNVR(1,1,1,1,1,1,10,1,1,3,-0.002,0.002,3.0,RT_31,"tfa")









! 690:[sumjct] Summing/Differencing Junctions 
      Tfalla = + RT_31 + RT_32

! 700:[sumjct] Summing/Differencing Junctions 
      TC1_Out = + RT_29 + RT_30 + Ctrl_C1 + Tfalla

! 710:[sumjct] Summing/Differencing Junctions 
      TC4_Out = + RT_3 + RT_4 + Ctrl_C4 + Tfalla

! 720:[sumjct] Summing/Differencing Junctions 
      TC3_Out = + RT_7 + RT_8 + Ctrl_C3 + Tfalla

! 730:[sumjct] Summing/Differencing Junctions 
      TC2_Out = + RT_11 + RT_12 + Ctrl_C2 + Tfalla

! 740:[sumjct] Summing/Differencing Junctions 
      TC1_In = + R_C1 + RT_28 + RT_15 + TC1_Out

! 750:[sumjct] Summing/Differencing Junctions 
      TC4_In = + R_C4 + RT_5 + RT_6 + TC4_Out

! 760:[sumjct] Summing/Differencing Junctions 
      TC3_In = + R_C3 + RT_9 + RT_10 + TC3_Out

! 770:[sumjct] Summing/Differencing Junctions 
      TC2_In = + R_C2 + RT_13 + RT_14 + TC2_Out

! 780:[sumjct] Summing/Differencing Junctions 
      TC1_In_Relig = + RT_33 + RT_34 + TC1_In

! 790:[sumjct] Summing/Differencing Junctions 
      TC4_In_Relig = + RT_39 + RT_40 + TC4_In

! 800:[sumjct] Summing/Differencing Junctions 
      TC3_In_Relig = + RT_37 + RT_38 + TC3_In

! 830:[sumjct] Summing/Differencing Junctions 
      TC2_In_Relig = + RT_35 + RT_36 + TC2_In

!---------------------------------------
! Feedbacks and transfers to storage
!---------------------------------------

      STOF(ISTOF + 23) = Fault_C1
      STOF(ISTOF + 24) = Fault_C2
      STOF(ISTOF + 25) = Fault_C3
      STOF(ISTOF + 26) = Fault_C4
      STOI(ISTOI + 1) = IT_1
      STOF(ISTOF + 27) = R_C4
      STOI(ISTOI + 2) = IT_2
      STOF(ISTOF + 28) = R_C3
      STOI(ISTOI + 3) = IT_3
      STOF(ISTOF + 29) = R_C2
      STOI(ISTOI + 4) = IT_4
      STOF(ISTOF + 30) = R_C1
      STOI(ISTOI + 5) = IT_5
      STOI(ISTOI + 6) = IT_6
      STOI(ISTOI + 7) = IT_7
      STOI(ISTOI + 8) = IT_8
      STOF(ISTOF + 31) = Ctrl_C1
      STOF(ISTOF + 38) = RT_3
      STOF(ISTOF + 39) = RT_4
      STOF(ISTOF + 40) = Ctrl_C4
      STOF(ISTOF + 41) = RT_5
      STOF(ISTOF + 42) = RT_6
      STOF(ISTOF + 43) = TC4_Out
      STOF(ISTOF + 44) = RT_7
      STOF(ISTOF + 45) = RT_8
      STOF(ISTOF + 46) = Ctrl_C3
      STOF(ISTOF + 47) = RT_9
      STOF(ISTOF + 48) = RT_10
      STOF(ISTOF + 49) = TC3_Out
      STOF(ISTOF + 50) = RT_11
      STOF(ISTOF + 51) = RT_12
      STOF(ISTOF + 52) = Ctrl_C2
      STOF(ISTOF + 53) = RT_13
      STOF(ISTOF + 54) = RT_14
      STOF(ISTOF + 55) = TC2_Out
      STOF(ISTOF + 56) = RT_15
      STOF(ISTOF + 57) = Max_G
      STOF(ISTOF + 58) = Min_G
      STOF(ISTOF + 59) = RT_16
      STOF(ISTOF + 60) = RT_17
      STOF(ISTOF + 61) = RT_18
      STOF(ISTOF + 62) = RT_19
      STOF(ISTOF + 63) = RT_20
      STOF(ISTOF + 64) = RT_21
      STOF(ISTOF + 65) = RT_22
      STOF(ISTOF + 66) = RT_23
      STOF(ISTOF + 67) = RT_24
      STOF(ISTOF + 68) = RT_25
      STOF(ISTOF + 69) = RT_26
      STOF(ISTOF + 73) = RT_28
      STOF(ISTOF + 74) = RT_29
      STOF(ISTOF + 75) = RT_30
      STOF(ISTOF + 76) = TC1_Out
      STOF(ISTOF + 77) = RT_31
      STOF(ISTOF + 78) = RT_32
      STOF(ISTOF + 79) = Tfalla
      STOF(ISTOF + 80) = Enab
      STOF(ISTOF + 81) = RT_33
      STOF(ISTOF + 82) = RT_34
      STOF(ISTOF + 83) = TC1_In
      STOF(ISTOF + 84) = RT_35
      STOF(ISTOF + 85) = RT_36
      STOF(ISTOF + 86) = TC2_In
      STOF(ISTOF + 87) = RT_37
      STOF(ISTOF + 88) = RT_38
      STOF(ISTOF + 89) = TC3_In
      STOF(ISTOF + 90) = RT_39
      STOF(ISTOF + 91) = RT_40
      STOF(ISTOF + 92) = TC4_In
      STOF(ISTOF + 93) = RT_41
      STOF(ISTOF + 94) = RT_42
      STOF(ISTOF + 95) = TC1_In_Relig
      STOF(ISTOF + 96) = TC2_In_Relig
      STOF(ISTOF + 97) = TC3_In_Relig
      STOF(ISTOF + 98) = TC4_In_Relig

! Array (1:3) quantities...
      DO IT_0 = 1,3
         STOF(ISTOF + 0 + IT_0) = Vg1(IT_0)
         STOF(ISTOF + 3 + IT_0) = Vg2(IT_0)
         STOF(ISTOF + 6 + IT_0) = Vg3(IT_0)
         STOF(ISTOF + 31 + IT_0) = RT_1(IT_0)
         STOF(ISTOF + 34 + IT_0) = RT_2(IT_0)
         STOF(ISTOF + 69 + IT_0) = RT_27(IT_0)
      END DO


!---------------------------------------
! Transfer to Exports
!---------------------------------------
      Tf       = Tfalla
      tC1i     = TC1_In
      tC1o     = TC1_Out
      tC2i     = TC2_In
      tC2o     = TC2_Out
      tC3i     = TC3_In
      tC3o     = TC3_Out
      tC4i     = TC4_In
      tC4o     = TC4_Out
      tC1iRelig = TC1_In_Relig
      tC2iRelig = TC2_In_Relig
      tC3iRelig = TC3_In_Relig
      tC4iRelig = TC4_In_Relig

!---------------------------------------
! Close Model Data read
!---------------------------------------

      IF ( TIMEZERO ) CALL EMTDC_CLOSEFILE
      RETURN
      END

!=======================================================================

      SUBROUTINE Control_MultiRunOut()

!---------------------------------------
! Standard includes
!---------------------------------------

      INCLUDE 'nd.h'
      INCLUDE 'emtconst.h'
      INCLUDE 'emtstor.h'
      INCLUDE 's0.h'
      INCLUDE 's1.h'
      INCLUDE 's2.h'
      INCLUDE 's4.h'
      INCLUDE 'branches.h'
      INCLUDE 'pscadv3.h'
      INCLUDE 'fnames.h'
      INCLUDE 'radiolinks.h'
      INCLUDE 'matlab.h'
      INCLUDE 'rtconfig.h'

!---------------------------------------
! Function/Subroutine Declarations
!---------------------------------------


!---------------------------------------
! Variable Declarations
!---------------------------------------


! Electrical Node Indices

! Control Signals
      INTEGER  IT_1, IT_2, IT_3, IT_4, IT_5, IT_6
      INTEGER  IT_7, IT_8
      REAL     RT_3, RT_5, RT_7, RT_9, RT_11
      REAL     RT_13, Max_G, Min_G, RT_26, RT_28
      REAL     RT_29, RT_32, Enab, RT_33, RT_35
      REAL     RT_37, RT_39, RT_41

! Internal Variables

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER ISTOL, ISTOI, ISTOF, ISTOC          ! Storage Indices
      INTEGER SS                                  ! SS/Node/Branch/Xfmr


!---------------------------------------
! Local Indices
!---------------------------------------

! Dsdyn <-> Dsout transfer index storage

      NTXFR = NTXFR + 1

      ISTOL = TXFR(NTXFR,1)
      ISTOI = TXFR(NTXFR,2)
      ISTOF = TXFR(NTXFR,3)
      ISTOC = TXFR(NTXFR,4)

! Define electric network subsystem number

      SS        = NODE(NNODE+1)

! Increment and assign runtime configuration call indices

      ICALL_NO  = NCALL_NO
      NCALL_NO  = NCALL_NO + 1

! Increment global storage indices

      NNODE     = NNODE + 2
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Transfers from storage arrays
!---------------------------------------

      IT_1     = STOI(ISTOI + 1)
      IT_2     = STOI(ISTOI + 2)
      IT_3     = STOI(ISTOI + 3)
      IT_4     = STOI(ISTOI + 4)
      IT_5     = STOI(ISTOI + 5)
      IT_6     = STOI(ISTOI + 6)
      IT_7     = STOI(ISTOI + 7)
      IT_8     = STOI(ISTOI + 8)
      RT_3     = STOF(ISTOF + 38)
      RT_5     = STOF(ISTOF + 41)
      RT_7     = STOF(ISTOF + 44)
      RT_9     = STOF(ISTOF + 47)
      RT_11    = STOF(ISTOF + 50)
      RT_13    = STOF(ISTOF + 53)
      Max_G    = STOF(ISTOF + 57)
      Min_G    = STOF(ISTOF + 58)
      RT_26    = STOF(ISTOF + 69)
      RT_28    = STOF(ISTOF + 73)
      RT_29    = STOF(ISTOF + 74)
      RT_32    = STOF(ISTOF + 78)
      Enab     = STOF(ISTOF + 80)
      RT_33    = STOF(ISTOF + 81)
      RT_35    = STOF(ISTOF + 84)
      RT_37    = STOF(ISTOF + 87)
      RT_39    = STOF(ISTOF + 90)
      RT_41    = STOF(ISTOF + 93)


!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


!---------------------------------------
! Configuration of Models
!---------------------------------------

      IF ( TIMEZERO ) THEN
         FILENAME = 'Control_MultiRun.dta'
         CALL EMTDC_OPENFILE
         SECTION = 'DATADSO:'
         CALL EMTDC_GOTOSECTION
      ENDIF
!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 50:[const] Real Constant 

      Min_G = -0.006

! 70:[const] Real Constant 

      Max_G = 0.006

! 90:[const] Real Constant 

      RT_32 = 0.0708

! 110:[const] Real Constant 

      RT_29 = 0.1

! 130:[const] Real Constant 

      RT_28 = 0.02

! 140:[const] Real Constant 

      RT_33 = 0.5

! 190:[const] Real Constant 

      RT_11 = 0.1

! 200:[const] Real Constant 

      RT_41 = 0.7

! 210:[const] Real Constant 

      RT_13 = 0.02

! 220:[const] Real Constant 

      RT_35 = 0.5

! 270:[const] Real Constant 

      RT_7 = 0.1

! 280:[const] Real Constant 

      RT_9 = 0.02

! 290:[const] Real Constant 

      RT_37 = 0.5

! 330:[consti] Integer Constant 

      IT_8 = 0

! 340:[consti] Integer Constant 

      IT_7 = 0

! 350:[const] Real Constant 

      RT_3 = 0.1

! 360:[const] Real Constant 

      RT_5 = 0.02

! 370:[const] Real Constant 

      RT_39 = 0.5

! 390:[consti] Integer Constant 

      IT_5 = 0

! 410:[consti] Integer Constant 

      IT_6 = 0

! 430:[consti] Integer Constant 

      IT_4 = 11

! 440:[consti] Integer Constant 

      IT_2 = 11

! 450:[consti] Integer Constant 

      IT_3 = 11

! 460:[consti] Integer Constant 

      IT_1 = 11

! 680:[mrun] Multiple Run Component 

! --------------------------------------------------------
! Multiple Run Recording Initialization
! --------------------------------------------------------
      CALL COMPONENT_ID(ICALL_NO,1352238896)
      CALL MRUNOINI(1,1,10,"faltas.out")

! Multiple Run Recording

      CALL MRUNOR(1,1,1,1,1,1,10,3,NINT(Enab),RT_26,"Tension")






!---------------------------------------
! Feedbacks and transfers to storage
!---------------------------------------

      STOI(ISTOI + 1) = IT_1
      STOI(ISTOI + 2) = IT_2
      STOI(ISTOI + 3) = IT_3
      STOI(ISTOI + 4) = IT_4
      STOI(ISTOI + 5) = IT_5
      STOI(ISTOI + 6) = IT_6
      STOI(ISTOI + 7) = IT_7
      STOI(ISTOI + 8) = IT_8
      STOF(ISTOF + 38) = RT_3
      STOF(ISTOF + 41) = RT_5
      STOF(ISTOF + 44) = RT_7
      STOF(ISTOF + 47) = RT_9
      STOF(ISTOF + 50) = RT_11
      STOF(ISTOF + 53) = RT_13
      STOF(ISTOF + 57) = Max_G
      STOF(ISTOF + 58) = Min_G
      STOF(ISTOF + 69) = RT_26
      STOF(ISTOF + 73) = RT_28
      STOF(ISTOF + 74) = RT_29
      STOF(ISTOF + 78) = RT_32
      STOF(ISTOF + 80) = Enab
      STOF(ISTOF + 81) = RT_33
      STOF(ISTOF + 84) = RT_35
      STOF(ISTOF + 87) = RT_37
      STOF(ISTOF + 90) = RT_39
      STOF(ISTOF + 93) = RT_41


!---------------------------------------
! Close Model Data read
!---------------------------------------

      IF ( TIMEZERO ) CALL EMTDC_CLOSEFILE
      RETURN
      END

!=======================================================================

      SUBROUTINE Control_MultiRunDyn_Begin()

!---------------------------------------
! Standard includes
!---------------------------------------

      INCLUDE 'nd.h'
      INCLUDE 'emtconst.h'
      INCLUDE 's0.h'
      INCLUDE 's1.h'
      INCLUDE 's4.h'
      INCLUDE 'branches.h'
      INCLUDE 'pscadv3.h'
      INCLUDE 'radiolinks.h'
      INCLUDE 'rtconfig.h'

!---------------------------------------
! Function/Subroutine Declarations
!---------------------------------------


!---------------------------------------
! Variable Declarations
!---------------------------------------


! Subroutine Arguments

! Electrical Node Indices

! Control Signals
      INTEGER  IT_1, IT_2, IT_3, IT_4, IT_5, IT_6
      INTEGER  IT_7, IT_8
      REAL     RT_3, RT_5, RT_7, RT_9, RT_11
      REAL     RT_13, Max_G, Min_G, RT_28, RT_29
      REAL     RT_32, RT_33, RT_35, RT_37, RT_39
      REAL     RT_41

! Internal Variables

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER SS                                  ! SS/Node/Branch/Xfmr


!---------------------------------------
! Local Indices
!---------------------------------------


! Define electric network subsystem number

      SS        = NODE(NNODE+1)

! Increment and assign runtime configuration call indices

      ICALL_NO  = NCALL_NO
      NCALL_NO  = NCALL_NO + 1

! Increment global storage indices

      NNODE     = NNODE + 2
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 50:[const] Real Constant 
      Min_G = -0.006

! 70:[const] Real Constant 
      Max_G = 0.006

! 90:[const] Real Constant 
      RT_32 = 0.0708

! 110:[const] Real Constant 
      RT_29 = 0.1

! 120:[abs] Absolute Value 

! 130:[const] Real Constant 
      RT_28 = 0.02

! 140:[const] Real Constant 
      RT_33 = 0.5

! 150:[random] Random Number Generator 

! 160:[random] Random Number Generator 

! 170:[abs] Absolute Value 

! 180:[random] Random Number Generator 

! 190:[const] Real Constant 
      RT_11 = 0.1

! 200:[const] Real Constant 
      RT_41 = 0.7

! 210:[const] Real Constant 
      RT_13 = 0.02

! 220:[const] Real Constant 
      RT_35 = 0.5

! 230:[random] Random Number Generator 

! 240:[random] Random Number Generator 

! 250:[time-sig] Output of Simulation Time 

! 260:[random] Random Number Generator 

! 270:[const] Real Constant 
      RT_7 = 0.1

! 280:[const] Real Constant 
      RT_9 = 0.02

! 290:[const] Real Constant 
      RT_37 = 0.5

! 300:[random] Random Number Generator 

! 310:[random] Random Number Generator 

! 320:[random] Random Number Generator 

! 330:[consti] Integer Constant 
      IT_8 = 0

! 340:[consti] Integer Constant 
      IT_7 = 0

! 350:[const] Real Constant 
      RT_3 = 0.1

! 360:[const] Real Constant 
      RT_5 = 0.02

! 370:[const] Real Constant 
      RT_39 = 0.5

! 380:[random] Random Number Generator 

! 390:[consti] Integer Constant 
      IT_5 = 0

! 400:[random] Random Number Generator 

! 410:[consti] Integer Constant 
      IT_6 = 0

! 420:[random] Random Number Generator 

! 430:[consti] Integer Constant 
      IT_4 = 11

! 440:[consti] Integer Constant 
      IT_2 = 11

! 450:[consti] Integer Constant 
      IT_3 = 11

! 460:[consti] Integer Constant 
      IT_1 = 11

! 470:[abs] Absolute Value 

! 480:[datatap] Scalar/Array Tap 

! 490:[datatap] Scalar/Array Tap 

! 500:[datatap] Scalar/Array Tap 

! 510:[datatap] Scalar/Array Tap 

! 520:[datatap] Scalar/Array Tap 

! 530:[datatap] Scalar/Array Tap 

! 540:[datatap] Scalar/Array Tap 

! 550:[datatap] Scalar/Array Tap 

! 560:[datatap] Scalar/Array Tap 

! 570:[compar] Two Input Comparator 

! 580:[compar] Two Input Comparator 

! 590:[compar] Two Input Comparator 

! 600:[compar] Two Input Comparator 

! 610:[compar] Two Input Comparator 

! 620:[compar] Two Input Comparator 

! 630:[compar] Two Input Comparator 

! 640:[compar] Two Input Comparator 

! 650:[compar] Two Input Comparator 

! 660:[maxmin] Maximum/Minimum Functions 

! 670:[maxmin] Maximum/Minimum Functions 

! 690:[sumjct] Summing/Differencing Junctions 

! 700:[sumjct] Summing/Differencing Junctions 

! 710:[sumjct] Summing/Differencing Junctions 

! 720:[sumjct] Summing/Differencing Junctions 

! 730:[sumjct] Summing/Differencing Junctions 

! 740:[sumjct] Summing/Differencing Junctions 

! 750:[sumjct] Summing/Differencing Junctions 

! 760:[sumjct] Summing/Differencing Junctions 

! 770:[sumjct] Summing/Differencing Junctions 

! 780:[sumjct] Summing/Differencing Junctions 

! 790:[sumjct] Summing/Differencing Junctions 

! 800:[sumjct] Summing/Differencing Junctions 

! 830:[sumjct] Summing/Differencing Junctions 

      RETURN
      END

!=======================================================================

      SUBROUTINE Control_MultiRunOut_Begin()

!---------------------------------------
! Standard includes
!---------------------------------------

      INCLUDE 'nd.h'
      INCLUDE 'emtconst.h'
      INCLUDE 's0.h'
      INCLUDE 's1.h'
      INCLUDE 's4.h'
      INCLUDE 'branches.h'
      INCLUDE 'pscadv3.h'
      INCLUDE 'radiolinks.h'
      INCLUDE 'rtconfig.h'

!---------------------------------------
! Function/Subroutine Declarations
!---------------------------------------


!---------------------------------------
! Variable Declarations
!---------------------------------------


! Subroutine Arguments

! Electrical Node Indices

! Control Signals
      INTEGER  IT_1, IT_2, IT_3, IT_4, IT_5, IT_6
      INTEGER  IT_7, IT_8
      REAL     RT_3, RT_5, RT_7, RT_9, RT_11
      REAL     RT_13, Max_G, Min_G, RT_28, RT_29
      REAL     RT_32, RT_33, RT_35, RT_37, RT_39
      REAL     RT_41

! Internal Variables

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER SS                                  ! SS/Node/Branch/Xfmr


!---------------------------------------
! Local Indices
!---------------------------------------


! Define electric network subsystem number

      SS        = NODE(NNODE+1)

! Increment and assign runtime configuration call indices

      ICALL_NO  = NCALL_NO
      NCALL_NO  = NCALL_NO + 1

! Increment global storage indices

      NNODE     = NNODE + 2
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 50:[const] Real Constant 
      Min_G = -0.006

! 70:[const] Real Constant 
      Max_G = 0.006

! 90:[const] Real Constant 
      RT_32 = 0.0708

! 110:[const] Real Constant 
      RT_29 = 0.1

! 130:[const] Real Constant 
      RT_28 = 0.02

! 140:[const] Real Constant 
      RT_33 = 0.5

! 190:[const] Real Constant 
      RT_11 = 0.1

! 200:[const] Real Constant 
      RT_41 = 0.7

! 210:[const] Real Constant 
      RT_13 = 0.02

! 220:[const] Real Constant 
      RT_35 = 0.5

! 270:[const] Real Constant 
      RT_7 = 0.1

! 280:[const] Real Constant 
      RT_9 = 0.02

! 290:[const] Real Constant 
      RT_37 = 0.5

! 330:[consti] Integer Constant 
      IT_8 = 0

! 340:[consti] Integer Constant 
      IT_7 = 0

! 350:[const] Real Constant 
      RT_3 = 0.1

! 360:[const] Real Constant 
      RT_5 = 0.02

! 370:[const] Real Constant 
      RT_39 = 0.5

! 390:[consti] Integer Constant 
      IT_5 = 0

! 410:[consti] Integer Constant 
      IT_6 = 0

! 430:[consti] Integer Constant 
      IT_4 = 11

! 440:[consti] Integer Constant 
      IT_2 = 11

! 450:[consti] Integer Constant 
      IT_3 = 11

! 460:[consti] Integer Constant 
      IT_1 = 11

      RETURN
      END
