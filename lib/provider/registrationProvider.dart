import 'package:flutter/material.dart';
import 'package:interview/apiServices/baseApiService.dart';
import 'package:interview/apiServices/registration/registrationApiService.dart';
import 'package:interview/apiServices/student/studentApiService.dart';
import 'package:interview/apiServices/subject/subjectApiService.dart';
import 'package:interview/contorl/navigationHelper.dart';
import 'package:interview/contorl/printString.dart';
import 'package:interview/model/apiResponseModel.dart';
import 'package:interview/model/registration/registrationModel.dart';
import 'package:interview/model/student/studentModel.dart';
import 'package:interview/model/subject/subjectModel.dart';
import 'package:interview/res/api.dart';
import 'package:interview/res/colors.dart';
import 'package:interview/supportingWidgets/alert/showSnackBar.dart';

class RegistrationProvider extends ChangeNotifier {
  bool loading = true;

  List<RegistrationModel> registrationList = [];

  _loading(bool status) {
    loading = status;
    notifyListeners();
  }

  getRegistrationList() async {
    _loading(true);
    ApiResponse response = await RegistrationApiService().getRegistrationList();
    _loading(false);
    PrintString(response.toJson());
    if (response.status) {
      registrationList =
          registrationModelFromJson(response.response["registrations"]);
      notifyListeners();
    } else {
      showSnackBar(response.message);
    }
  }

  ///details
  bool regDetailsLoading = true;
  RegistrationModel? regDetails;

  StudentModel? student;
  SubjectModel? subject;
  bool studentLoading = false;
  bool subjectLoading = false;

  _studentLoading(bool status) {
    studentLoading = status;
    notifyListeners();
  }

  _subjectLoading(bool status) {
    subjectLoading = status;
    notifyListeners();
  }

  _regDetailsLoading(bool status) {
    regDetailsLoading = status;
    notifyListeners();
  }

  getRegDetails(int id) async {
    _regDetailsLoading(true);
    ApiResponse response =
        await RegistrationApiService().getRegistrationDetails(id);
    _regDetailsLoading(false);
    PrintString(response.toJson());
    if (response.status) {
      regDetails = RegistrationModel.fromJson(response.response);
      if (regDetails == null) {
        return;
      }
      _getStudentDetails();
      _getClassDetails();
      notifyListeners();
    } else {
      showSnackBar(response.message);
    }
  }

  _getStudentDetails() async {
    _studentLoading(true);
    ApiResponse response =
        await StudentApiService().getStudentDetails(regDetails!.student);
    _studentLoading(false);
    PrintString(response.toJson());
    if (response.status) {
      student = StudentModel.fromJson(response.response);
      notifyListeners();
    } else {
      showSnackBar(response.message);
    }
  }

  _getClassDetails() async {
    _subjectLoading(true);
    ApiResponse response =
        await SubjectApiService().getSubjectDetails(regDetails!.subject);
    _subjectLoading(false);
    PrintString(response.toJson());
    if (response.status) {
      subject = SubjectModel.fromJson(response.response);
      notifyListeners();
    } else {
      showSnackBar(response.message);
    }
  }

  ///delete
  bool deleteLoading = false;

  _deleteLoading(bool status) {
    deleteLoading = status;
    notifyListeners();
  }

  deleteRegistration() async {
    _deleteLoading(true);
    int rgId = regDetails!.id;
    ApiResponse response =
        await RegistrationApiService().deleteRegistration(rgId);
    _deleteLoading(false);
    if (response.status) {
      showSnackBar("Registration deleted",color: appGreen);
      _removeRegistrationFromList(rgId);
      if (regDetails != null) {
        Navigator.pop(navigatorKey.currentContext!);
      }
    } else {
      showSnackBar(response.message);
    }
  }

  _removeRegistrationFromList(int rgId) {
    registrationList.removeWhere((element) => element.id == rgId);
    notifyListeners();
  }


  ///new reg
  List<StudentModel> studentList = [];
  List<SubjectModel> subjectList = [];

  bool studentListLoading = true;
  bool subjectListLoading = true;

  bool registrationLoading = false;
  _registrationLoading(bool status){
    registrationLoading = status;
    notifyListeners();
  }

  _studentListLoading(bool status){
    studentListLoading = status;
    notifyListeners();
  }

  _subjectListLoading(bool status){
    subjectListLoading = status;
    notifyListeners();
  }

  getStudentListApiCall() async {
    _studentListLoading(true);
    ApiResponse response = await StudentApiService().getStudentList();
    _studentListLoading(false);
    if(response.status){
      studentList = studentModelFromJson(response.response["students"]);
      notifyListeners();
    }else{
      showSnackBar(response.message);
    }
    PrintString(response.toJson());
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


  newRegistrationApiCall(studentId,subjectId)async{
    _registrationLoading(true);
    ApiResponse response = await RegistrationApiService().newRegistration(studentId, subjectId);
    _registrationLoading(false);
    PrintString(response.toJson());
    if(response.status){

    }else{
      showSnackBar(response.message);
    }
  }



  clearData() {
    regDetails = null;
    subject = null;
    student = null;
  }


}
