import 'package:dio/dio.dart';
import 'package:interview/apiServices/baseApiService.dart';
import 'package:interview/model/apiResponseModel.dart';
import 'package:interview/res/api.dart';

class ClassroomApiService {
  Future<ApiResponse> getClassRoomList() async {
    return BaseApiService().exceptionHandle(
      url: classListApi,
      method: apiMethod.GET,
    );
  }

  Future<ApiResponse> getClassRoomDetails(int classId) async {
    return BaseApiService().exceptionHandle(
      url: "$classListApi/$classId",
      method: apiMethod.GET,
    );
  }

  Future<ApiResponse> changeSubject(int classId, subjectId) async {
    FormData formData = FormData.fromMap({
      "subject": subjectId,
    });
    return BaseApiService().exceptionHandle(
      url: "$classListApi/$classId",
      data: formData,
      method: apiMethod.UPDATE,
    );
  }
}
