*&---------------------------------------------------------------------*
*& Report ZB_REUSE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZB_REUSE.

INCLUDE zb_reuse_top.
INCLUDE zb_reuse_frm.

START-OF-SELECTION.

PERFORM set_getdata.
PERFORM set_fc.
PERFORM set_lay.
PERFORM display_alv.
*gt_list = CORRESPONDING(gt_test). "Bu da testten sonra list tablosuna
*alma gibi dusun, bunu arastir, kod yapisi tam hatirlanmiyor.
*  SELECT * FROM gt_test INTO gt_list.


*SELECT sbook~carrid,
*       sbook~connid,
*       sflight~fldate,
*       sflight~price,
*       sflight~currency,
*       sflight~seatsmax,
*       sflight~seatsocc
*  FROM sbook
*  INNER JOIN sflight
*  ON sbook~carrid = sflight~carrid
*  AND sbook~connid = sflight~connid
*  WHERE sbook~carrid = 'LH'
*  AND sbook~customid = '000001'
*  INTO TABLE @DATA(lt_data).

*SELECT
*  sbook~customid
*  sflight~connid
*  sbook~countnum
*  sbook~custtype
*  sflight~planettype
*  sflight~seatsoc
*  FROM sbook
*  INNER JOIN sflight ON sflight~connid EQ sbook~customid
*  INTO TABLE gt_list.

*SELECT * FROM sbook
*INNER JOIN sflight ON sflight~connid EQ sbook~customid INTO TABLE
*gt_list.
