class ApiResponse {
  final response;
  final bool status;
  final int statusCode;
  final String message;

  ApiResponse({
    this.response,
    this.statusCode = 200,
    this.status = true,
    required this.message,
  });

  toJson() {
    return {
      "status": status,
      "statusCode": statusCode,
      "message": message,
      "response": response,
    };
  }
}
