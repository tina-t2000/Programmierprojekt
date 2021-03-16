@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'erweiterte Anwendungsview Booking'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_07022026_BookingExtended
  as select from ZI_07022026_TravelWithBookings
{
  key _Booking.TravelId     as TravelId,
  key _Booking.BookingId    as BookingId,
      _Booking.BookingDate  as BookingDate,
      _Booking.CustomerId   as CustomerId,
      _Booking.Connections  as Connections,
      _Booking.FlightDate   as FlightDate,
      _Booking.DaysAhead    as DaysAhead,
      _Booking.FlightPrice  as FlightPrice,
      _Booking.CurrencyCode as CurrencyCode,
      Period,
      Description,
      Status

}
