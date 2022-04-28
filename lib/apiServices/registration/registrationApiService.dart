
import 'package:interview/apiServices/baseApiService.dart';
import 'package:interview/model/apiResponseModel.dart';
import 'package:interview/res/api.dart';

class RegistrationApiService{
  Future<ApiResponse> getRegistrationList()async{
    return await BaseApiService().exceptionHandle(url: registrationApi,method: apiMethod.GET);
  }

  Future<ApiResponse> getRegistrationDetails(int id)async{
    return await BaseApiService().exceptionHandle(url: "$registrationApi/$id",method: apiMethod.GET);
  }

  Future<ApiResponse> deleteRegistration(int id)async{
    return await BaseApiService().exceptionHandle(url: "$registrationApi/$id",method: apiMethod.DELETE);
  }

}