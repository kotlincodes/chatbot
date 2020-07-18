

import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:yellow_billy_bot/bloc/bloc_provider.dart';
import 'package:yellow_billy_bot/model/base_model.dart';
import 'package:yellow_billy_bot/model/interactions_entity.dart';
import 'package:yellow_billy_bot/network/api_end_points.dart';
import 'package:yellow_billy_bot/network/network_utils.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yellow_billy_bot/widgets/response_widgets.dart';

class BotBloc extends BlocBase implements UserResponseClick{
  final controller = ScrollController();
  TextEditingController userInputController=TextEditingController();

  final _responseController=BehaviorSubject<List<InteractionsResponse>>();
  List<InteractionsResponse> _respList=List();

  Stream<List<InteractionsResponse>> get outResponse=> _responseController.stream;
  Sink<List<InteractionsResponse>> get inResponse => _responseController.sink;

  final _baseStatus=BehaviorSubject<Status>();

  Stream<Status> get outStatus=> _baseStatus.stream;
  Sink<Status> get inStatus => _baseStatus.sink;

  BotBloc(){
    _getInteractions(ApiEndpoints.welcomeInteractionId);
  }
  @override
  void dispose() {
    _responseController.close();
  }

  Future<BaseModel> _getInteractions(String id) {
    if(id.isEmpty){
      id=ApiEndpoints.welcomeInteractionId;
    }
    return NetworkUtil().get("${ApiEndpoints.interactions}/$id").then((BaseModel res) {
      print(res.data);
      _baseStatus.add(res.status);

      if(_respList.isNotEmpty&&_respList.last.userResponse!=null) {
        _respList.last.userResponse.isLoading=false;
      }
      _respList.addAll(InteractionsEntity().fromJson(res.data).responses);
      _updateResponse();
      return res;
    });
  }

  void _updateResponse(){
    _responseController.add(_respList);
    _scrollToBottom();
  }

  @override
  void userResponse(InteractionsResponsesButton responsesButton) {
    InteractionsResponse clicked= _respList.last;
    clicked.userResponse=responsesButton;
    clicked.isUserResponded=true;
    clicked.userResponse.isLoading=true;
    _respList.remove(_respList.last);
    _respList.add(clicked);

    _updateResponse();
    _getInteractions(responsesButton.value);
  }
  
  _scrollToBottom(){
    Timer(
      Duration(seconds: 1),
          () => controller.jumpTo(
              controller.position.maxScrollExtent,
//              duration: Duration(milliseconds: 10),
//              curve: Curves.ease,
              ),
    );
  }

  onSend(){
    InteractionsResponse interactionsResponse=InteractionsResponse();
    InteractionsResponsesButton button=InteractionsResponsesButton();
    button.isLoading=true;
    button.title=userInputController.text;
    interactionsResponse.type="user";
    interactionsResponse.isUserResponded=true;
    interactionsResponse.userResponse=button;
    _respList.add(interactionsResponse);
    _updateResponse();
    _getInteractions(ApiEndpoints.welcomeInteractionId);

    userInputController.clear();
  }

  
}

abstract class UserResponseClick{
  void userResponse(InteractionsResponsesButton button);
}