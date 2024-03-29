*&---------------------------------------------------------------------*
*& Include          ZB_REUSE_FRM
*&---------------------------------------------------------------------*

FORM set_getdata .
  SELECT sbook~carrid, sbook~connid, sbook~fldate, sflight~price, sbook~loccurkey
    FROM sbook
    INNER JOIN sflight ON sbook~carrid = sflight~carrid AND
                    sbook~connid = sflight~connid AND
                    sbook~fldate = sflight~fldate AND
                    sbook~loccurkey = sflight~currency INTO CORRESPONDING FIELDS OF TABLE @gt_list.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form SET_FC
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM set_fc .

  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
    EXPORTING
      i_program_name     = sy-repid "Program adini yazmaktansa bunu yaziyoruz.
      "i_internal_tabname = 'GT_LIST'
      i_structure_name = 'ZBK_EGT_0022_S'
      i_inclname         = sy-repid
    CHANGING
      ct_fieldcat        = gt_field_catalog.


*  PERFORM: set_fc_sub USING 'Ucak' 'Ucak Grup' 'Ucak Gruplandırma' 'X' 'CONNID', "Buradaki X abap_true anlamina gelir.
*           set_fc_sub USING 'Bolum' 'Bolum Grup' 'Bolum Gruplandırma' 'X' 'CARRID',
*           set_fc_sub USING 'Fiyat' 'Fiyat Ü.' 'Fiyat Açıklaması' '' 'PRICE', "Buradaki '' abap_false anlamina gelir.
*           set_fc_sub USING 'Tarih' 'Uçuş Ta.' 'Uçus Tarihi' '' 'FLDATE'.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form SET_LAY
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM set_lay .
  gs_layout-window_titlebar = 'YENI TEST REUSE ALV'. "Adi ustunde title-bar atar.
  gs_layout-zebra = abap_true. "Satir renkleri zebra desenini aldi.
  "gs_layout-colwidth_optimize = abap_true. "Sistematik sekilde satir ici uzunluklara gore genislikleri belirler.
  "gs_layout-edit = abap_true. "Tiklanilabilir yapar, tum hucre icleri beyaz olur.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form DISPLAY_ALV
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_alv .
  gs_event-name = slis_ev_top_of_page.
  gs_event-form = 'TOP_OF_PAGE'.
  APPEND gs_event to gt_events.
  gs_event-name = slis_ev_end_of_list.
  gs_event-form = 'END_OF_LIST'.
  APPEND gs_event to gt_events.
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     I_INTERFACE_CHECK                 = ' '
*     I_BYPASSING_BUFFER                = ' '
*     I_BUFFER_ACTIVE                   = ' '
     I_CALLBACK_PROGRAM                = sy-repid
*     I_CALLBACK_PF_STATUS_SET          = ' '
*     I_CALLBACK_USER_COMMAND           = ' '
*     I_CALLBACK_TOP_OF_PAGE            = 'TOP_OF_PAGE'
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME                  =
*     I_BACKGROUND_ID                   = ' '
*     I_GRID_TITLE                      =
*     I_GRID_SETTINGS                   =
      is_layout   = gs_layout
      it_fieldcat = gt_field_catalog
*     IT_EXCLUDING                      =
*     IT_SPECIAL_GROUPS                 =
*     IT_SORT     =
*     IT_FILTER   =
*     IS_SEL_HIDE =
*     I_DEFAULT   = 'X'
*     I_SAVE      = ' '
*     IS_VARIANT  =
     IT_EVENTS   = gt_events
*     IT_EVENT_EXIT                     =
*     IS_PRINT    =
*     IS_REPREP_ID                      =
*     I_SCREEN_START_COLUMN             = 0
*     I_SCREEN_START_LINE               = 0
*     I_SCREEN_END_COLUMN               = 0
*     I_SCREEN_END_LINE                 = 0
*     I_HTML_HEIGHT_TOP                 = 0
*     I_HTML_HEIGHT_END                 = 0
*     IT_ALV_GRAPHICS                   =
*     IT_HYPERLINK                      =
*     IT_ADD_FIELDCAT                   =
*     IT_EXCEPT_QINFO                   =
*     IR_SALV_FULLSCREEN_ADAPTER        =
* IMPORTING
*     E_EXIT_CAUSED_BY_CALLER           =
*     ES_EXIT_CAUSED_BY_USER            =
    TABLES
      t_outtab    = gt_list
* EXCEPTIONS
*     PROGRAM_ERROR                     = 1
*     OTHERS      = 2
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form TOP_OF_PAGE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM top_of_page .

ENDFORM.
FORM end_of_list .

ENDFORM.

*&---------------------------------------------------------------------*
*& Form SET_FC_SUB
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM set_fc_sub USING p_seltext_s.
*                      p_seltext_m
*                      p_seltext_l
*                      p_key
*                      p_fieldname.
*  CLEAR: gs_field_catalog.
*  gs_field_catalog-seltext_s = p_seltext_s.
*  gs_field_catalog-seltext_m = p_seltext_m.
*  gs_field_catalog-seltext_l = p_seltext_l.
*  gs_field_catalog-key = p_key.
*  gs_field_catalog-fieldname = p_fieldname.
*  APPEND gs_field_catalog TO gt_field_catalog.
ENDFORM.
