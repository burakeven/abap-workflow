*&---------------------------------------------------------------------*
*& Include          ZB_REUSE_TOP
*&---------------------------------------------------------------------*

*DATA: BEGIN OF gt_list OCCURS 0,
*  connid LIKE sbook-connid,
*  carrid LIKE sbook-carrid,
*  price LIKE sflight-price,
*  fldate LIKE sbook-fldate,
*  END OF gt_list.

  "connid LIKE sbook-s_conn_id,
*  carrid LIKE sbook-s_carr_id,
*  price LIKE sflight-s_price,
*  fldate LIKE sflight-s_date.

  TYPES: BEGIN OF gty_list, "global type list
         connid TYPE s_conn_id, "sbook
         carrid TYPE s_carr_id, "sbook
         price  TYPE s_price, "sflight
         fldate TYPE s_date, "sflight
         loccurkey type S_CURRCODE, "sbook
       END OF gty_list.

DATA: gt_list TYPE TABLE OF gty_list,
      gs_list TYPE gty_list.

DATA: gt_field_catalog TYPE slis_t_fieldcat_alv,
      gs_field_catalog TYPE slis_fieldcat_alv.

data: gs_layout type SLIS_LAYOUT_ALV.
data: gt_events type SLIS_T_EVENT,
      gs_event type slis_alv_event.
