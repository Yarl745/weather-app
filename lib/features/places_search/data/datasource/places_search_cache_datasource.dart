import 'package:hive_flutter/hive_flutter.dart';
import 'package:weatherapp/core/helper/hive_consts.dart';
import 'package:weatherapp/features/places_search/data/models/place_detailed_info_model.dart';
import 'package:weatherapp/features/places_search/domain/entities/place_detailed_info.dart';

abstract class PlacesSearchCacheDatasource {
  Future<void> saveLastPlaceInfo(PlaceDetailedInfo placeInfo);
  PlaceDetailedInfoModel? getLastPlaceInfo();
}

class PlacesSearchCacheDatasourceImpl extends PlacesSearchCacheDatasource {
  PlacesSearchCacheDatasourceImpl({required Box<dynamic> placeDetailedInfoDataBox})
      : _placeDetailedInfoDataBox = placeDetailedInfoDataBox;

  final Box _placeDetailedInfoDataBox;

  @override
  PlaceDetailedInfoModel? getLastPlaceInfo() {
    final json = _placeDetailedInfoDataBox.get(CHive.lastPlaceInfo) as Map<dynamic, dynamic>?;
    return json != null ? PlaceDetailedInfoModel.fromJson(json) : null;
  }

  @override
  Future<void> saveLastPlaceInfo(PlaceDetailedInfo placeInfo) async {
    final json = PlaceDetailedInfoModel.toJson(placeInfo);
    await _placeDetailedInfoDataBox.put(CHive.lastPlaceInfo, json);
  }
}
