!=======================================================================
! Generated by  : PSCAD v4.6.2.0
!
! Warning:  The content of this file is automatically generated.
!           Do not modify, as any changes made here will be lost!
!-----------------------------------------------------------------------
! Component     : Main
! Description   : 
!-----------------------------------------------------------------------


!=======================================================================

      SUBROUTINE MainDyn()

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
! Variable Declarations
!---------------------------------------


! Subroutine Arguments

! Electrical Node Indices

! Control Signals
      INTEGER  IT_1, IT_2, IT_3, IT_4, IT_5, IT_6
      INTEGER  IT_7
      REAL     RT_1, RT_2, RT_3, RT_4, RT_5, RT_6
      REAL     RT_7

! Internal Variables

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER ISTOI, ISTOF                        ! Storage Indices
      INTEGER ITXRX                               ! Control/Monitoring
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
      NSTOI     = NSTOI + 7
      ISTOF     = NSTOF
      NSTOF     = NSTOF + 7
      ITXRX     = NTXRX
      NTXRX     = NTXRX + 14
      NNODE     = NNODE + 2
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Transfers from storage arrays
!---------------------------------------

      RT_1     = STOF(ISTOF + 1)
      RT_2     = STOF(ISTOF + 2)
      RT_3     = STOF(ISTOF + 3)
      IT_1     = STOI(ISTOI + 1)
      IT_2     = STOI(ISTOI + 2)
      IT_3     = STOI(ISTOI + 3)
      IT_4     = STOI(ISTOI + 4)
      IT_5     = STOI(ISTOI + 5)
      IT_6     = STOI(ISTOI + 6)
      IT_7     = STOI(ISTOI + 7)
      RT_4     = STOF(ISTOF + 4)
      RT_5     = STOF(ISTOF + 5)
      RT_6     = STOF(ISTOF + 6)
      RT_7     = STOF(ISTOF + 7)


!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


!---------------------------------------
! Configuration of Models
!---------------------------------------

      IF ( TIMEZERO ) THEN
         FILENAME = 'Main.dta'
         CALL EMTDC_OPENFILE
         SECTION = 'DATADSD:'
         CALL EMTDC_GOTOSECTION
      ENDIF
!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 10:[consti] Integer Constant 

      IT_1 = 1

! 20:[radiolink] Wireless connection 'Fault'
      TX(TXRX(ITXRX+1)) = REAL(IT_1)

! 30:[consti] Integer Constant 

      IT_2 = 2

! 40:[radiolink] Wireless connection 'Fault'
      TX(TXRX(ITXRX+2)) = REAL(IT_2)

! 50:[radiolink] Wireless connection 'Ok'
      RT_1 = TX(TXRX(ITXRX+3))

! 60:[consti] Integer Constant 

      IT_3 = 3

! 70:[radiolink] Wireless connection 'Fault'
      TX(TXRX(ITXRX+4)) = REAL(IT_3)

! 80:[radiolink] Wireless connection 'Ok'
      RT_2 = TX(TXRX(ITXRX+5))

! 90:[consti] Integer Constant 

      IT_6 = 4

! 100:[radiolink] Wireless connection 'Fault'
      TX(TXRX(ITXRX+6)) = REAL(IT_6)

! 110:[radiolink] Wireless connection 'Ok'
      RT_3 = TX(TXRX(ITXRX+7))

! 120:[consti] Integer Constant 

      IT_4 = 5

! 130:[radiolink] Wireless connection 'Fault'
      TX(TXRX(ITXRX+8)) = REAL(IT_4)

! 140:[radiolink] Wireless connection 'Ok'
      RT_4 = TX(TXRX(ITXRX+9))

! 150:[consti] Integer Constant 

      IT_5 = 6

! 160:[radiolink] Wireless connection 'Fault'
      TX(TXRX(ITXRX+10)) = REAL(IT_5)

! 170:[radiolink] Wireless connection 'Ok'
      RT_5 = TX(TXRX(ITXRX+11))

! 180:[consti] Integer Constant 

      IT_7 = 7

! 190:[radiolink] Wireless connection 'Fault'
      TX(TXRX(ITXRX+12)) = REAL(IT_7)

! 200:[radiolink] Wireless connection 'Ok'
      RT_6 = TX(TXRX(ITXRX+13))

! 210:[radiolink] Wireless connection 'Ok'
      RT_7 = TX(TXRX(ITXRX+14))

!---------------------------------------
! Feedbacks and transfers to storage
!---------------------------------------

      STOF(ISTOF + 1) = RT_1
      STOF(ISTOF + 2) = RT_2
      STOF(ISTOF + 3) = RT_3
      STOI(ISTOI + 1) = IT_1
      STOI(ISTOI + 2) = IT_2
      STOI(ISTOI + 3) = IT_3
      STOI(ISTOI + 4) = IT_4
      STOI(ISTOI + 5) = IT_5
      STOI(ISTOI + 6) = IT_6
      STOI(ISTOI + 7) = IT_7
      STOF(ISTOF + 4) = RT_4
      STOF(ISTOF + 5) = RT_5
      STOF(ISTOF + 6) = RT_6
      STOF(ISTOF + 7) = RT_7


!---------------------------------------
! Transfer to Exports
!---------------------------------------

!---------------------------------------
! Close Model Data read
!---------------------------------------

      IF ( TIMEZERO ) CALL EMTDC_CLOSEFILE
      RETURN
      END

!=======================================================================

      SUBROUTINE MainOut()

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
! Variable Declarations
!---------------------------------------


! Electrical Node Indices

! Control Signals
      INTEGER  IT_1, IT_2, IT_3, IT_4, IT_5, IT_6
      INTEGER  IT_7

! Internal Variables

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER ISTOL, ISTOI, ISTOF, ISTOC          ! Storage Indices
      INTEGER ITXRX                               ! Control/Monitoring
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

      ITXRX     = NTXRX
      NTXRX     = NTXRX + 14
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


!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


!---------------------------------------
! Configuration of Models
!---------------------------------------

      IF ( TIMEZERO ) THEN
         FILENAME = 'Main.dta'
         CALL EMTDC_OPENFILE
         SECTION = 'DATADSO:'
         CALL EMTDC_GOTOSECTION
      ENDIF
!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 10:[consti] Integer Constant 

      IT_1 = 1

! 30:[consti] Integer Constant 

      IT_2 = 2

! 60:[consti] Integer Constant 

      IT_3 = 3

! 90:[consti] Integer Constant 

      IT_6 = 4

! 120:[consti] Integer Constant 

      IT_4 = 5

! 150:[consti] Integer Constant 

      IT_5 = 6

! 180:[consti] Integer Constant 

      IT_7 = 7

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


!---------------------------------------
! Close Model Data read
!---------------------------------------

      IF ( TIMEZERO ) CALL EMTDC_CLOSEFILE
      RETURN
      END

!=======================================================================

      SUBROUTINE MainDyn_Begin()

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
! Variable Declarations
!---------------------------------------


! Subroutine Arguments

! Electrical Node Indices

! Control Signals
      INTEGER  IT_1, IT_2, IT_3, IT_4, IT_5, IT_6
      INTEGER  IT_7
      REAL     RT_1, RT_2, RT_3, RT_4, RT_5, RT_6
      REAL     RT_7

! Internal Variables

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER ITXRX                               ! Control/Monitoring
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

      ITXRX     = NTXRX
      NTXRX     = NTXRX + 14
      NNODE     = NNODE + 2
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 10:[consti] Integer Constant 
      IT_1 = 1

! 20:[radiolink] Wireless connection 'Fault'

! 20:[radiolink] Wireless connection 'Fault'


! 30:[consti] Integer Constant 
      IT_2 = 2

! 40:[radiolink] Wireless connection 'Fault'

! 40:[radiolink] Wireless connection 'Fault'


! 50:[radiolink] Wireless connection 'Ok'

! 50:[radiolink] Wireless connection 'Ok'

      RT_1 = TX(TXRX(ITXRX+3))

! 60:[consti] Integer Constant 
      IT_3 = 3

! 70:[radiolink] Wireless connection 'Fault'

! 70:[radiolink] Wireless connection 'Fault'


! 80:[radiolink] Wireless connection 'Ok'

! 80:[radiolink] Wireless connection 'Ok'

      RT_2 = TX(TXRX(ITXRX+5))

! 90:[consti] Integer Constant 
      IT_6 = 4

! 100:[radiolink] Wireless connection 'Fault'

! 100:[radiolink] Wireless connection 'Fault'


! 110:[radiolink] Wireless connection 'Ok'

! 110:[radiolink] Wireless connection 'Ok'

      RT_3 = TX(TXRX(ITXRX+7))

! 120:[consti] Integer Constant 
      IT_4 = 5

! 130:[radiolink] Wireless connection 'Fault'

! 130:[radiolink] Wireless connection 'Fault'


! 140:[radiolink] Wireless connection 'Ok'

! 140:[radiolink] Wireless connection 'Ok'

      RT_4 = TX(TXRX(ITXRX+9))

! 150:[consti] Integer Constant 
      IT_5 = 6

! 160:[radiolink] Wireless connection 'Fault'

! 160:[radiolink] Wireless connection 'Fault'


! 170:[radiolink] Wireless connection 'Ok'

! 170:[radiolink] Wireless connection 'Ok'

      RT_5 = TX(TXRX(ITXRX+11))

! 180:[consti] Integer Constant 
      IT_7 = 7

! 190:[radiolink] Wireless connection 'Fault'

! 190:[radiolink] Wireless connection 'Fault'


! 200:[radiolink] Wireless connection 'Ok'

! 200:[radiolink] Wireless connection 'Ok'

      RT_6 = TX(TXRX(ITXRX+13))

! 210:[radiolink] Wireless connection 'Ok'

! 210:[radiolink] Wireless connection 'Ok'

      RT_7 = TX(TXRX(ITXRX+14))

      RETURN
      END

!=======================================================================

      SUBROUTINE MainOut_Begin()

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
! Variable Declarations
!---------------------------------------


! Subroutine Arguments

! Electrical Node Indices

! Control Signals
      INTEGER  IT_1, IT_2, IT_3, IT_4, IT_5, IT_6
      INTEGER  IT_7
      REAL     RT_1, RT_2, RT_3, RT_4, RT_5, RT_6
      REAL     RT_7

! Internal Variables

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER ITXRX                               ! Control/Monitoring
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

      ITXRX     = NTXRX
      NTXRX     = NTXRX + 14
      NNODE     = NNODE + 2
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Electrical Node Lookup
!---------------------------------------


!---------------------------------------
! Generated code from module definition
!---------------------------------------


! 10:[consti] Integer Constant 
      IT_1 = 1

! 20:[radiolink] Wireless connection 'Fault'


! 30:[consti] Integer Constant 
      IT_2 = 2

! 40:[radiolink] Wireless connection 'Fault'


! 50:[radiolink] Wireless connection 'Ok'

      RT_1 = TX(TXRX(ITXRX+3))

! 60:[consti] Integer Constant 
      IT_3 = 3

! 70:[radiolink] Wireless connection 'Fault'


! 80:[radiolink] Wireless connection 'Ok'

      RT_2 = TX(TXRX(ITXRX+5))

! 90:[consti] Integer Constant 
      IT_6 = 4

! 100:[radiolink] Wireless connection 'Fault'


! 110:[radiolink] Wireless connection 'Ok'

      RT_3 = TX(TXRX(ITXRX+7))

! 120:[consti] Integer Constant 
      IT_4 = 5

! 130:[radiolink] Wireless connection 'Fault'


! 140:[radiolink] Wireless connection 'Ok'

      RT_4 = TX(TXRX(ITXRX+9))

! 150:[consti] Integer Constant 
      IT_5 = 6

! 160:[radiolink] Wireless connection 'Fault'


! 170:[radiolink] Wireless connection 'Ok'

      RT_5 = TX(TXRX(ITXRX+11))

! 180:[consti] Integer Constant 
      IT_7 = 7

! 190:[radiolink] Wireless connection 'Fault'


! 200:[radiolink] Wireless connection 'Ok'

      RT_6 = TX(TXRX(ITXRX+13))

! 210:[radiolink] Wireless connection 'Ok'

      RT_7 = TX(TXRX(ITXRX+14))

      RETURN
      END

