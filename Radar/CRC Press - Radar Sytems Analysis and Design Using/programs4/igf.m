FUNCTION IGF# (Y!, N!, R4#, IC#)
'Rev 5/11/90 (N% >> N!, R7% >> R7!)
' Rev 12/3/90, R7! >> R7#
' 1/15/91, N! >> N&
' 3/23/91, changed back to N!

'Inputs:
'   Y! .. signal
'   N& .. variates

'  IGF...Incomplete Gamma Function
'  R4....e^-Yb * Yb^N / N (p 98 Rad Calc)
'  IC....1-IGF

  CONST LoopTest = 1.00000000001#
  IF Y! <= 0 THEN IGF# = 0: EXIT FUNCTION

  YY# = Y!
  R6# = 1: XX# = 1: X# = 1: R7# = N!

 IF N! = 1 THEN
     IC# = 1 / EXP(YY#): R4# = YY# * IC#                 ' eq. C.7
 ELSE
    Count% = 0
    DO
      SELECT CASE YY#
         CASE IS < N!: R7# = R7# + 1:   X# = X# * YY# / R7#  'eq 3-1.9
         CASE ELSE:    R7# = R7# - 1:   X# = X# * R7# / YY#  'eq 3-1.8
      END SELECT
      XX# = XX# + X#:   Z# = XX# / R6#:   R6# = XX#
      Count% = Count% + 1
     ' PRINT Count%; Z#, XX#   'debug
    LOOP UNTIL Z# < LoopTest
    X# = N! * LOG(YY#) - YY# - LFac((N!))
    R4# = EXP(X#):  IC# = 1 - XX# * R4#
    IF YY# >= N! THEN IC# = (1 - IC#) * N! / YY#
 END IF
 IGF# = 1 - IC#
END FUNCTION