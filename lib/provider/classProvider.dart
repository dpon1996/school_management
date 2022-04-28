import 'package:flutter/material.dart';
import 'package:interview/apiServices/baseApiService.dart';
import 'package:interview/apiServices/calss/classroomApiService.dart';
import 'package:interview/apiServices/subject/subjectApiService.dart';
import 'package:interview/contorl/printString.dart';
import 'package:interview/model/apiResponseModel.dart';
import 'package:interview/model/class/classDetailsModel.dart';
import 'package:interview/model/class/classListModel.dart';
import 'package:interview/model/subject/subjectModel.dart';
import 'package:interview/res/colors.dart';
import 'package:interview/supportingWidgets/alert/showSnackBar.dart';

class ClassProvider extends ChangeNotifier {
  bool classListLoading = true;

  List<ClassListModel> classList = [];

  _classListLoading(bool status) {
    classListLoading = status;
    notifyListeners();
  }

  getClassListApiCall() async {
    _classListLoading(true);
    ApiResponse response = await ClassroomApiService().getClassRoomList();
    _classListLoading(false);
    PrintString(response.toJson());
    if (response.status) {
      classList = classListModelFromJson(response.response["classrooms"]);
      notifyListeners();
    } else {
      showSnackBar(response.message);
    }

    PrintString(response.toJson());
  }


  ///details
  bool classDetailsLoading = true;
  bool subjectLoading = false;
  ClassDetailsModel? classDetails;
  SubjectModel? subject;

  _classDetailsLoading(bool status){
    classDetailsLoading = status;
    notifyListeners();
  }

  _subjectLoading(bool status){
    subjectLoading = status;
    notifyListeners();
  }

  getClassDetailsApiCall(int classId)async{
    _classDetailsLoading(true);
    ApiResponse response = await ClassroomApiService().getClassRoomDetails(classId);
    _classDetailsLoading(false);
    PrintString(response.toJson());

    if(response.status){
      classDetails = ClassDetailsModel.fromJson(response.response);
      _getSubjectDetails();
      notifyListeners();
    }else{
      showSnackBar(response.message);
    }
  }

  _getSubjectDetails() async{
    if(classDetails!.subject.trim().isEmpty){
      return;
    }
    int subjectId = int.parse(classDetails!.subject);

    _subjectLoading(true);
    ApiResponse response = await SubjectApiService().getSubjectDetails(subjectId);
    _subjectLoading(false);
    PrintString(response.toJson());
    if(response.status){
      subject = SubjectModel.fromJson(response.response);
      notifyListeners();
    }else{
      showSnackBar("subject can't fetch");
    }
  }


  ///change subject
  List<SubjectModel> subjectList = [];
  bool subjectListLoading = true;

  _subjectListLoading(bool status){
    subjectListLoading = status;
    notifyListeners();
  }

  getSubjectListApiCall()async{
    _subjectListLoading(true);
    ApiResponse response = await SubjectApiService().getSubjectList();
    _subjectListLoading(false);
    if(response.status){
      subjectList = subjectModelFromJson(response.response["subjects"]);
      notifyListeners();
    }else{
      showSnackBar(response.message);
    }
    PrintString(response.toJson());
  }


  changeSubjectApiCall(subjectId)async{
    subject = null;
    _subjectLoading(true);
    ApiResponse response = await ClassroomApiService().changeSubject(classDetails!.id, subjectId);
    _subjectLoading(false);
    PrintString(response.toJson());
    if(response.status){
      classDetails = ClassDetailsModel.fromJson(response.response);
      _getSubjectDetails();
      showSnackBar("subject updated",color: appGreen);
    }else{
      showSnackBar("Subject not updated!");
    }
  }


  clearData(){
    classDetails = null;
    subject = null;
  }



}
