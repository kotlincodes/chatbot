class BaseModel {
  dynamic data;
  Status status;
  String message;
  BaseModel({this.status});
}

enum Status { success, error, no_network }
