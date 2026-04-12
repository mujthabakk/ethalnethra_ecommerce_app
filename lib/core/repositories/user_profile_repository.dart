import 'package:dio/dio.dart';

import '../api/api_endpoints.dart';
import '../models/user/user_address_models.dart';
import '../models/user/user_details_models.dart';

class UserProfileRepository {
  UserProfileRepository(this._dio);

  final Dio _dio;

  Future<UserDetails> fetchUserDetails() async {
    final response =
        await _dio.get<Map<String, dynamic>>(ApiEndpoints.userDetails);
    final data = response.data;
    if (data == null) throw Exception('Empty user details response');
    return UserDetails.fromJson(data);
  }

  Future<UpdateUserDetailsResponse> updateUserDetails({
    required String name,
    required String email,
    required String phone,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.userDetails,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    );
    final data = response.data;
    if (data == null) throw Exception('Empty update profile response');
    return UpdateUserDetailsResponse.fromJson(data);
  }

  Future<String> createAddress({
    required String label,
    required int zoneId,
    required int areaId,
    required String addressLine,
    required String pincode,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.userAddresses,
      data: {
        'label': label,
        'zone_id': zoneId,
        'area_id': areaId,
        'address_line': addressLine,
        'pincode': pincode,
      },
    );
    final data = response.data;
    if (data == null) throw Exception('Empty address response');
    return CreateAddressResponse.fromJson(data).id;
  }
}
