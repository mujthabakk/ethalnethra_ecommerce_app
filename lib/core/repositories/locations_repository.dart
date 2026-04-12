import 'package:dio/dio.dart';

import '../api/api_endpoints.dart';
import '../models/location/area_item.dart';
import '../models/location/zone_item.dart';

class LocationsRepository {
  LocationsRepository(this._dio);

  final Dio _dio;

  Future<List<ZoneItem>> fetchZones() async {
    final response =
        await _dio.get<Map<String, dynamic>>(ApiEndpoints.locationsZones);
    final data = response.data;
    if (data == null) throw Exception('Empty zones response');
    return ZonesListResponse.fromJson(data).zones;
  }

  Future<List<AreaItem>> fetchAreas({required int zoneId}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.locationsAreas,
      queryParameters: {'zone_id': zoneId},
    );
    final data = response.data;
    if (data == null) throw Exception('Empty areas response');
    return AreasListResponse.fromJson(data).areas;
  }
}
