import 'package:dio/dio.dart';

import '../api/api_endpoints.dart';
import '../api/api_exception.dart';
import '../models/safe_json_parse.dart';
import '../models/user/user_address_models.dart';
import '../models/user/user_details_models.dart';

class UserProfileRepository {
  UserProfileRepository(this._dio);

  final Dio _dio;

  Future<List<UserAddressDto>> fetchAddresses() async {
    final response =
        await _dio.get<Map<String, dynamic>>(ApiEndpoints.userAddresses);
    return userAddressesFromApi(response.data);
  }

  Future<UserDetails> fetchUserDetails() async {
    final response =
        await _dio.get<Map<String, dynamic>>(ApiEndpoints.userDetails);
    final data = response.data;
    if (data == null) throw Exception('Empty user details response');
    return userDetailsFromApi(data);
  }

  Future<UpdateUserDetailsResponse> updateUserDetails({
    required String name,
    required String email,
    required String phone,
    String? gender,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.userDetails,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        if (gender != null && gender.isNotEmpty) 'gender': gender,
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
    required String pincodeId,
  }) async {
    final parsedPincodeId = int.tryParse(pincodeId);
    if (parsedPincodeId == null) {
      throw ApiException('Invalid pincode selection');
    }
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.userAddresses,
        data: {
          'label': label,
          'zone_id': zoneId,
          'area_id': areaId,
          'address_line': addressLine,
          'pincode_id': parsedPincodeId,
        },
      );
      final data = response.data;
      if (data == null) throw ApiException('Empty address response');
      return CreateAddressResponse.fromJson(data).id;
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }
}
