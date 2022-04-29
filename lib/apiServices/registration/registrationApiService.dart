import 'package:dio/dio.dart';
import 'package:interview/apiServices/baseApiService.dart';
import 'package:interview/contorl/printString.dart';
import 'package:interview/model/apiResponseModel.dart';
import 'package:interview/res/api.dart';

class RegistrationApiService {
  Future<ApiResponse> getRegistrationList() async {
    return await BaseApiService()
        .exceptionHandle(url: registrationApi, method: apiMethod.GET);
  }

  Future<ApiResponse> getRegistrationDetails(int id) async {
    return await BaseApiService()
        .exceptionHandle(url: "$registrationApi/$id", method: apiMethod.GET);
  }

  Future<ApiResponse> deleteRegistration(int id) async {
    return await BaseApiService()
        .exceptionHandle(url: "$registrationApi/$id", method: apiMethod.DELETE);
  }

  Future<ApiResponse> newRegistration(studentId, subjectId) async {
    FormData data = FormData.fromMap({
      "student": studentId,
      "subject": subjectId,
    });
    PrintString(data.fields);
    return await BaseApiService().exceptionHandle(
      url: registrationApi,
      method: apiMethod.POST,
      data: data,
    );
  }
}
