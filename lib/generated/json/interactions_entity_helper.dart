import 'package:yellow_billy_bot/model/interactions_entity.dart';

interactionsEntityFromJson(InteractionsEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toString();
  }
  if (json['name'] != null) {
    data.name = json['name']?.toString();
  }
  if (json['action'] != null) {
    data.action = json['action']?.toString();
  }
  if (json['userSays'] != null) {
    data.userSays = new List<InteractionsUserSay>();
    (json['userSays'] as List).forEach((v) {
      data.userSays.add(new InteractionsUserSay().fromJson(v));
    });
  }
  if (json['triggers'] != null) {
    data.triggers = new List<dynamic>();
    data.triggers.addAll(json['triggers']);
  }
  if (json['parameters'] != null) {
    data.parameters = new List<dynamic>();
    data.parameters.addAll(json['parameters']);
  }
  if (json['responses'] != null) {
    data.responses = new List<InteractionsResponse>();
    (json['responses'] as List).forEach((v) {
      data.responses.add(new InteractionsResponse().fromJson(v));
    });
  }
  return data;
}

Map<String, dynamic> interactionsEntityToJson(InteractionsEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['action'] = entity.action;
  if (entity.userSays != null) {
    data['userSays'] = entity.userSays.map((v) => v.toJson()).toList();
  }
  if (entity.triggers != null) {
    data['triggers'] = [];
  }
  if (entity.parameters != null) {
    data['parameters'] = [];
  }
  if (entity.responses != null) {
    data['responses'] = entity.responses.map((v) => v.toJson()).toList();
  }
  return data;
}

interactionsUserSayFromJson(
    InteractionsUserSay data, Map<String, dynamic> json) {
  if (json['classifier'] != null) {
    data.classifier = json['classifier']?.toString();
  }
  if (json['text'] != null) {
    data.text = json['text']?.toString();
  }
  return data;
}

Map<String, dynamic> interactionsUserSayToJson(InteractionsUserSay entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['classifier'] = entity.classifier;
  data['text'] = entity.text;
  return data;
}

interactionsResponseFromJson(
    InteractionsResponse data, Map<String, dynamic> json) {
  if (json['type'] != null) {
    data.type = json['type']?.toString();
  }
  if (json['title'] != null) {
    data.title = json['title']?.toString();
  }
  if (json['subtitle'] != null) {
    data.subtitle = json['subtitle']?.toString();
  }
  if (json['buttons'] != null) {
    data.buttons = new List<InteractionsResponsesButton>();
    (json['buttons'] as List).forEach((v) {
      data.buttons.add(new InteractionsResponsesButton().fromJson(v));
    });
  }
  if (json['filters'] != null) {
    data.filters = new List<dynamic>();
    data.filters.addAll(json['filters']);
  }
  if (json['delay'] != null) {
    data.delay = json['delay']?.toInt();
  }
  if (json['elements'] != null) {
    data.elements = new List<dynamic>();
    data.elements.addAll(json['elements']);
  }
  if (json['imageUrl'] != null) {
    data.imageUrl = json['imageUrl']?.toString();
  }
  if (json['userResponse'] != null) {
    data.userResponse =
        new InteractionsResponsesButton().fromJson(json['userResponse']);
  }

  return data;
}

Map<String, dynamic> interactionsResponseToJson(InteractionsResponse entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['type'] = entity.type;
  data['title'] = entity.title;
  data['subtitle'] = entity.subtitle;
  if (entity.buttons != null) {
    data['buttons'] = entity.buttons.map((v) => v.toJson()).toList();
  }
  if (entity.filters != null) {
    data['filters'] = [];
  }
  data['delay'] = entity.delay;
  if (entity.elements != null) {
    data['elements'] = [];
  }
  data['imageUrl'] = entity.imageUrl;
  if (entity.userResponse != null) {
    data['userResponse'] = entity.userResponse.toJson();
  }
  data['isUserResponded=false'] = entity.isUserResponded = false;
  return data;
}

interactionsResponsesButtonFromJson(
    InteractionsResponsesButton data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toString();
  }
  if (json['type'] != null) {
    data.type = json['type']?.toString();
  }
  if (json['title'] != null) {
    data.title = json['title']?.toString();
  }
  if (json['value'] != null) {
    data.value = json['value']?.toString();
  }
  if (json['actions'] != null) {
    data.actions = new List<dynamic>();
    data.actions.addAll(json['actions']);
  }
  return data;
}

Map<String, dynamic> interactionsResponsesButtonToJson(
    InteractionsResponsesButton entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['isLoading=true'] = entity.isLoading = true;
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['title'] = entity.title;
  data['value'] = entity.value;
  if (entity.actions != null) {
    data['actions'] = [];
  }
  return data;
}
