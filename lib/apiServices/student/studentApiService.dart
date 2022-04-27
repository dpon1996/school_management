
import 'package:interview/apiServices/baseApiService.dart';
import 'package:interview/model/apiResponseModel.dart';
import 'package:interview/res/api.dart';

class StudentApiService{

  Future<ApiResponse> getStudentList()async{
    return await BaseApiService().exceptionHandle(url: studentListApi,method: apiMethod.GET);
  }

  Future<ApiResponse> getStudentDetails(int studentId)async{
    return await BaseApiService().exceptionHandle(url: "$studentListApi/$studentId",method: apiMethod.GET);
  }

}