import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:yellow_billy_bot/model/base_model.dart';

class NetworkUtil {
  // next three lines makes this class a Singleton

  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<BaseModel> get(String url) async {
    BaseModel baseModel = BaseModel();

    if(await checkInternet()) {
    print(url);
    return http.get(url,headers: {
    HttpHeaders.authorizationHeader: 'Bearer AdVBa9zC_sskncQ9NiP6mRFxQIsii_Ge',
    HttpHeaders.contentTypeHeader: 'application/json',
    }).then((http.Response response) {
    final String res = response.body;
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
    throw new Exception("Error while fetching data");
    }
    print(response.body);
    baseModel.data = _decoder.convert(res);
    return baseModel;
    });
    }else{
      baseModel.status=Status.no_network;
      return baseModel;
    }
  }

  Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future<BaseModel> post(String url, {Map headers, body, encoding}) async {
    if(await checkInternet()) {
      print(url);
      print(body);
      BaseModel baseModel = BaseModel();
      var headers = {"Content-Type": "application/json"};
      var x = http.post(url);
      return http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(body))
          .then((http.Response response) {
        final String res = response.body;
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          baseModel.status = Status.error;
          throw new Exception("Error while fetching data $statusCode");
        }
        print(response.body);
        baseModel.data = _decoder.convert(res);
        return baseModel;
      }).catchError((error) {
        print(error.toString());
        baseModel.status = Status.error;
        return baseModel;
      });
    }else{
      return BaseModel(status: Status.error);
    }
  }

//  uploadResume(url,userId, {File imageFile,ResumeData resumeData}) async {
////    imageFile = File(
////        "/storage/emulated/0/Android/data/com.example.job_portal/files/Pictures/scaled_Screenshot_20190828-155003.png");
//    var stream =
//        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//    var length = await imageFile.length();
//
//    var uri = Uri.parse(url);
//
//    var request = new http.MultipartRequest("POST", uri);
//    var multipartFile = new http.MultipartFile('resume_file', stream, length,
//        filename: (imageFile.path));
//    //contentType: new MediaType('image', 'png'));
//    var headers = {'Content-Type': 'application/json'};
//    request.files.add(multipartFile);
//    request.headers.addAll(headers);
//    request.fields.addAll({"resume_name":resumeData.resumeName,"user_id":resumeData.resumeName,"user_id":userId,"default":resumeData.isDefault!=null&&resumeData.isDefault?"1":"0"});
//
//    print(uri.toString()+request.fields.toString());
//    var response = await request.send();
//    print(response.statusCode);
//    response.stream.transform(utf8.decoder).listen((value) {
//      print(value);
//    });
//  }

  Future<dynamic>postMultiPart(url, {File imageFile, body}) async {
    print(body);

    var uri = Uri.parse(url);

    var request = new http.MultipartRequest("POST", uri);
    if(imageFile!=null){
      var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();

      var multipartFile = new http.MultipartFile('resume_file', stream, length,
          filename: (imageFile.path));
      request.files.add(multipartFile);
    }

    //contentType: new MediaType('image', 'png'));
    var headers = {'Content-Type': 'multipart/form-data'};

    request.headers.addAll(headers);
    request.fields.addAll(body);

    print(uri.toString()+request.fields.toString());
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
      return value;
    }).onError((error){
      print(error);
    });
  }
}


