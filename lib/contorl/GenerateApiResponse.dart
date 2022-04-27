
import 'package:interview/model/apiResponseModel.dart';

ApiResponse generateApiResponse(int statusCode) {
  switch (statusCode) {

    ///invalid response
    case 100:
      return ApiResponse(
        status: false,
        statusCode: statusCode,
        message: "Invalid Response",
      );

    ///No Internet connection
    case 101:
      return ApiResponse(
        status: false,
        statusCode: statusCode,
        message: "No Internet connection",
      );

    ///invalid format
    case 102:
      return ApiResponse(
        status: false,
        statusCode: statusCode,
        message: "Invalid Format",
      );

    ///unknown response
    default:
      return ApiResponse(
        status: false,
        statusCode: statusCode,
        message: "Something went wrong!",
      );
  }
}
