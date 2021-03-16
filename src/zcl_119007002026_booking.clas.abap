CLASS zcl_119007002026_booking DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_119007002026_booking IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    data Bookings type table of ZC_07022026_BookingExtended.
    data Customer_Id type /dmo/customer_id.

    select from ZC_07022026_BookingExtended
    fields CustomerId into @Customer_Id.
    endselect.
    IF sy-subrc <> 0.
     out->write( | No Bookings found for  | && Customer_Id ).
    ENDIF.

    select from ZC_07022026_BookingExtended
    fields *
     where CustomerId = @Customer_Id
     into table @Bookings.
     IF sy-subrc <> 0.
    out->write( | No Bookings found for : { Customer_Id } | ).
    RETURN.
    ENDIF.

     out->write( |BOOKINGS| ).
     out->write( | | ).
     out->write( |CustomerId: |  && Customer_Id ).
     out->write( | | ).
     out->write( | | ).
     out->write( | TravelId, BookingId , Connection, FlightDate, FlightPrice, Period | ).

     loop at Bookings into data(Bookings2).
        out->write( |{ Bookings2-TravelId }, { Bookings2-BookingId  }, { Bookings2-Connections }, { Bookings2-FlightDate }, { Bookings2-FlightPrice }, { Bookings2-Period } | ).
     endloop.


  ENDMETHOD.
ENDCLASS.
