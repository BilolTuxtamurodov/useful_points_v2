import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:usefulpoints/data/storage/app/locals/error_words.dart';
import 'package:usefulpoints/data/storage/app/locals/words.dart';
import 'package:usefulpoints/data/storage/auth/holder.dart';
import 'package:usefulpoints/data/tools/service/exceptions/exp.dart';

class ErrorParser {
  static String parse(error) {
    if (kDebugMode) {
      Get.log(error.toString());
    }
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.other: {
              print('Result : ${error.error.toString().split(')').last.trim()}');
              return error.error.toString().split(')').last.trim().replaceAll('^', '');
            }
            case DioErrorType.response:
              if (error.response != null) {
                var response = error.response;
                if(response?.statusCode == 401) {
                  // Get.find<Holder>().authToken = '';
                  return Words.pleaseLogin.tr;
                }
                if (error.response?.data['result'] != null) {
                  return error.response?.data['result'];
                }
              }

              return "${ErrorWords.badRequest.tr}${error.response?.statusCode}";
            default:
              return ErrorWords.unKnownError.tr;
          }
        }
        if (error is NotValidException) {
          return error.message.tr;
        }
        return error.toString();
      } on FormatException catch (e) {
        Get.log("Error parser $e");
        return ErrorWords.formatError.tr;
      } catch (e) {
        Get.log("Error parser catch $e");
        return ErrorWords.unKnownError.tr;
      }
    }
    return error.toString().contains("is not a subtype of") ? ErrorWords.unableToProcess.tr : ErrorWords.unexpectedError.tr;
  }
}
