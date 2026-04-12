import 'package:freezed_annotation/freezed_annotation.dart';

part 'msg91_info.freezed.dart';
part 'msg91_info.g.dart';

@freezed
class Msg91Info with _$Msg91Info {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Msg91Info({
    required String requestId,
    required String type,
  }) = _Msg91Info;

  factory Msg91Info.fromJson(Map<String, dynamic> json) =>
      _$Msg91InfoFromJson(json);
}
