Status{

}

class NetworkResponse {
  final status;
  final Map<String, dynamic>? data;
  final String? message;
  NetworkResponse({
    this.status,
    this.data,
    this.message,
  });
}
