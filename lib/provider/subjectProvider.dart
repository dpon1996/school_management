import 'package:flutter/material.dart';
import 'package:interview/apiServices/subject/subjectApiService.dart';
import 'package:interview/contorl/printString.dart';
import 'package:interview/model/apiResponseModel.dart';
import 'package:interview/model/subject/subjectModel.dart';
import 'package:interview/supportingWidgets/alert/showSnackBar.dart';

class SubjectProvider extends ChangeNotifier{
  bool subjectListLoading = true;
  List<SubjectModel> subjectList = [];
  
  _subjectListLoading(bool status){
    subjectListLoading = status;
    notifyListeners();
  }

  getSubjectList()async{
    _subjectListLoading(true);
    ApiResponse response = await SubjectApiService().getSubjectList();
    _subjectListLoading(false);
    if(response.status){
      subjectList = subjectModelFromJson(response.response["subjects"]);
    }else{
      showSnackBar(response.message);
    }
    PrintString(response.toJson());
  }


  ///details
  bool subjectDetailsLoading = true;
  SubjectModel? subjectDetails;

  _subjectDetailsLoading(bool status){
    subjectDetailsLoading = status;
    notifyListeners();
  }

  getSubjectDetails(int subjectId)async{
    _subjectDetailsLoading(true);
    ApiResponse response = await SubjectApiService().getSubjectDetails(subjectId);
    _subjectDetailsLoading(false);
    if(response.status){
      subjectDetails = SubjectModel.fromJson(response.response);
      notifyListeners();
    }else{
      showSnackBar(response.message);
    }
    PrintString(response.toJson());
  }





}