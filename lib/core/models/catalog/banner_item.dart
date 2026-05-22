// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../safe_json_parse.dart';
import 'json_converters.dart';

part 'banner_item.freezed.dart';
part 'banner_item.g.dart';

@freezed
class BannerItem with _$BannerItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BannerItem({
    @JsonKey(fromJson: stringFromJson) required String id,
    required String title,
    required String imageUrl,
    String? description,
  }) = _BannerItem;

  factory BannerItem.fromJson(Map<String, dynamic> json) =>
      bannerItemFromJsonLoose(json);
}

@freezed
class BannerListResponse with _$BannerListResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BannerListResponse({
    required List<BannerItem> banners,
  }) = _BannerListResponse;

  factory BannerListResponse.fromJson(Map<String, dynamic> json) =>
      bannerListResponseFromJsonLoose(json);
}
