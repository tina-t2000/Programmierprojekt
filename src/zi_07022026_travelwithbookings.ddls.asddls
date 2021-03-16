@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View kombiniert Travels und Bookings'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_07022026_TravelWithBookings
  as select from ZI_119007022026_Travel
  association to ZI_119007022026_Booking as _Booking on ZI_119007022026_Travel.TravelId = _Booking.TravelId
{
  key TravelId,
      CustomerId,
      Period,
      Description,
      Status,
      _Booking
}
