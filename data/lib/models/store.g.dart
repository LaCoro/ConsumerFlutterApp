// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) {
  return Store(
    name: json['name'] as String,
    searchTags: (json['searchTags'] as List)?.map((e) => e as int)?.toList(),
    address: json['address'] as String,
    city: json['city'] as String,
    country: json['country'] as String,
    mobile: json['mobile'] as String,
    openAt: json['openAt'] as String,
    closeAt: json['closeAt'] as String,
    daysOpen: (json['daysOpen'] as List)?.map((e) => e as int)?.toList(),
    logo: json['logo'] as String,
    hasDeliveryService: json['hasDeliveryService'] as bool,
    active: json['active'] as bool,
    deliveryCost: json['deliveryCost'] as int,
    state: json['state'] as String,
    position: json['position'] as int,
  );
}

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'name': instance.name,
      'searchTags': instance.searchTags,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'mobile': instance.mobile,
      'openAt': instance.openAt,
      'closeAt': instance.closeAt,
      'daysOpen': instance.daysOpen,
      'logo': instance.logo,
      'hasDeliveryService': instance.hasDeliveryService,
      'active': instance.active,
      'deliveryCost': instance.deliveryCost,
      'state': instance.state,
      'position': instance.position,
    };
