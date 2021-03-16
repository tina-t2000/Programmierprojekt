@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View Booking'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_119007022026_Booking
  as select from /dmo/booking
{
  key travel_id                                              as TravelId,
  key booking_id                                             as BookingId,
      booking_date                                           as BookingDate,
      customer_id                                            as CustomerId,
      concat_with_space(carrier_id,connection_id,1)          as Connections, //Connection ist für andere Werte reserviert, deswegen Connections
      dats_days_between(booking_date, flight_date)           as DaysAhead,
      flight_date                                            as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(  amount=>flight_price,
                            source_currency => currency_code,
                            target_currency => cast('USD' as abap.cuky),
                            exchange_rate_date => booking_date,
                            error_handling => 'SET_TO_NULL') as FlightPrice,
      cast('USD' as abap.cuky)                               as CurrencyCode
}
where
  dats_days_between(
    booking_date, flight_date
  ) > 14
