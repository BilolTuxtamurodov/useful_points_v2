import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_request.g.dart';

@JsonSerializable()
class TransactionRequest {
  String? screenshot;
  String? user;

  TransactionRequest(this.user, this.screenshot);

  factory TransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionRequestToJson(this);
}
