import 'package:flutter/material.dart';
import 'package:interview/apiServices/student/studentApiService.dart';
import 'package:interview/contorl/printString.dart';
import 'package:interview/model/apiResponseModel.dart';
import 'package:interview/model/student/studentModel.dart';
import 'package:interview/supportingWidgets/alert/showSnackBar.dart';

class StudentProvider extends ChangeNotifier {
  bool studentListLoading = true;
  List<StudentModel> studentList = [];

  _studentListLoading(bool status) {
    studentListLoading = status;
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


  ///student details
  bool studentDetailsLoading = true;
  StudentModel? studentDetails;

  _studentDetailsLoading(bool status){
    studentDetailsLoading = status;
    notifyListeners();
  }

  getStudentDetailsApiCall(int studentId) async {
    _studentDetailsLoading(true);
    ApiResponse response = await StudentApiService().getStudentDetails(studentId);
    _studentDetailsLoading(false);
    if(response.status){
      studentDetails = StudentModel.fromJson(response.response);
      notifyListeners();
    }else{
      showSnackBar(response.message);
    }
    PrintString(response.toJson());
  }

}
