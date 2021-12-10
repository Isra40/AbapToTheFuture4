*&---------------------------------------------------------------------*
*& Report z_monster_demo
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_monster_demo.


CLASS lcl_how_many_monsters DEFINITION.

  PUBLIC SECTION.
    METHODS: how_many_make_five RETURNING VALUE(rd_how_many) TYPE i,
      demo_method.


ENDCLASS.

CLASS lcl_how_many_monsters IMPLEMENTATION.

  METHOD how_many_make_five.

    DO 100 TIMES.
      SELECT COUNT( * ) FROM sflight WHERE carrid = 'AA'.
      CHECK sy-subrc = 0.
      ADD 1 TO rd_how_many.
      rd_how_many = 1.
      DATA: lv_boolean TYPE boolean.
      IF lv_boolean = abap_true.
      ENDIF.

    ENDDO.

  ENDMETHOD.

  METHOD demo_method.

  ENDMETHOD.

ENDCLASS.

DATA: how_many TYPE i,
      counter  TYPE REF TO lcl_how_many_monsters.

START-OF-SELECTION.


  CREATE OBJECT counter.

  how_many = counter->how_many_make_five(  ).
  WRITE:/ how_many.
