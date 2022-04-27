
import 'package:interview/apiServices/baseApiService.dart';
import 'package:interview/model/apiResponseModel.dart';
import 'package:interview/res/api.dart';

class SubjectApiService{

  Future<ApiResponse> getSubjectList()async{
    return BaseApiService().exceptionHandle(url: subjectListApi,method: apiMethod.GET);
  }

  Future<ApiResponse> getSubjectDetails(int subjectId)async{
    return BaseApiService().exceptionHandle(url: "$subjectListApi/$subjectId",method: apiMethod.GET);
  }

}