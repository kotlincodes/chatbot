// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:yellow_billy_bot/generated/json/interactions_entity_helper.dart';
import 'package:yellow_billy_bot/model/interactions_entity.dart';

class JsonConvert<T> {
  T fromJson(Map<String, dynamic> json) {
    return _getFromJson<T>(runtimeType, this, json);
  }

  Map<String, dynamic> toJson() {
    return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
      case InteractionsEntity:
        return interactionsEntityFromJson(data as InteractionsEntity, json)
            as T;
      case InteractionsUserSay:
        return interactionsUserSayFromJson(data as InteractionsUserSay, json)
            as T;
      case InteractionsResponse:
        return interactionsResponseFromJson(data as InteractionsResponse, json)
            as T;
      case InteractionsResponsesButton:
        return interactionsResponsesButtonFromJson(
            data as InteractionsResponsesButton, json) as T;
    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
    switch (type) {
      case InteractionsEntity:
        return interactionsEntityToJson(data as InteractionsEntity);
      case InteractionsUserSay:
        return interactionsUserSayToJson(data as InteractionsUserSay);
      case InteractionsResponse:
        return interactionsResponseToJson(data as InteractionsResponse);
      case InteractionsResponsesButton:
        return interactionsResponsesButtonToJson(
            data as InteractionsResponsesButton);
    }
    return data as T;
  }

  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {
      case 'InteractionsEntity':
        return InteractionsEntity().fromJson(json);
      case 'InteractionsUserSay':
        return InteractionsUserSay().fromJson(json);
      case 'InteractionsResponse':
        return InteractionsResponse().fromJson(json);
      case 'InteractionsResponsesButton':
        return InteractionsResponsesButton().fromJson(json);
    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {
      case 'InteractionsEntity':
        return List<InteractionsEntity>();
      case 'InteractionsUserSay':
        return List<InteractionsUserSay>();
      case 'InteractionsResponse':
        return List<InteractionsResponse>();
      case 'InteractionsResponsesButton':
        return List<InteractionsResponsesButton>();
    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}
