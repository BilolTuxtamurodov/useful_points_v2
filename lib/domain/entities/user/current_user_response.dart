
import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_user_response.g.dart';

@JsonSerializable()
class CurrentUserResponse {
  int? id;
  String? email;
  String? full_name;
  bool? is_premium;

  CurrentUserResponse(this.id, this.email, this.full_name, this.is_premium);

  factory CurrentUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentUserResponseToJson(this);
}


