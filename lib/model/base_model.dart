
class BaseModel{
  dynamic data;
  Status status;
  String message;
  BaseModel({this.status});
  bool loading=true;
}

enum Status{success,error,no_network}