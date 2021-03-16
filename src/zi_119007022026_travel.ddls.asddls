@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View: Travel'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_119007022026_Travel
  as select from /dmo/travel
{

  key travel_id                                  as TravelId,
      customer_id                                as CustomerId,
      description                                as Description,
      status                                     as Status,
      concat_with_space(begin_date, end_date, 1) as Period //ein Bindestrich wurde von der Cloud nicht zugelassen


}
