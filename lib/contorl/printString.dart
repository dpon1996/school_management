import 'package:flutter/foundation.dart';

class PrintString{
  final data;

  PrintString(this.data){
   printString(data);
  }
  void printString(data){
    if (kDebugMode) {
      print(data);
    }
  }
}