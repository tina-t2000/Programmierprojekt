@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View: Bookings'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_119007022026_Bookings
  as select from ZI_07022026_TravelWithBookings
{

  key _Booking.Connections,
      count(*)                                                                            as NumberofBookings,
      avg(dats_days_between(_Booking.BookingDate, _Booking.FlightDate) as abap.dec(16,2)) as AverageDaysAhead

}
where Status = 'P'

group by
  _Booking.Connections

