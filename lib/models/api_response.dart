import 'package:networking_demo/enums/api_status.dart';

class ApiResponse<T> {
  Status status;
  T? data;
  ApiResponse({required this.status, this.data});
}
