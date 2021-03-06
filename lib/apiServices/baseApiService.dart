import 'dart:io';

import 'package:dio/dio.dart';
import 'package:interview/contorl/GenerateApiResponse.dart';
import 'package:interview/contorl/printString.dart';
import 'package:interview/model/apiResponseModel.dart';


enum apiMethod {
  GET,
  POST,
  DELETE,
  UPDATE,
}

class BaseApiService {
  Future<ApiResponse> exceptionHandle({
    apiMethod method = apiMethod.POST,
    required String url,
    var data,
  }) async {
    url = url + "?api_key=2f019";
    Dio dio = Dio();
    try {
      Response? response;
      switch (method) {
        case apiMethod.GET:
          response = await dio.get(url);
          break;
        case apiMethod.POST:
          response = await dio.post(url, data: data);
          break;
        case apiMethod.DELETE:
          response = await dio.delete(url);
          break;
        case apiMethod.UPDATE:
          response = await dio.patch(url, data: data);
          break;
      }

      ApiResponse apiResponse = ApiResponse(
        statusCode: 200,
        status: true,
        response: response.data,
        message: "ok",
      );

      return apiResponse;
    } on DioError catch (e) {
      PrintString(e.message);
      if (e.error is SocketException) {
        return generateApiResponse(101);
      } else {
        return generateApiResponse(e.response?.statusCode ?? 0);
      }
    } catch (e) {
      PrintString(e);
      return generateApiResponse(103);
    }
  }
}
