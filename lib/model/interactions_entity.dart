import 'package:yellow_billy_bot/generated/json/base/json_convert_content.dart';

class InteractionsEntity with JsonConvert<InteractionsEntity> {
	String id;
	String name;
	String action;
	List<InteractionsUserSay> userSays;
	List<dynamic> triggers;
	List<dynamic> parameters;
	List<InteractionsResponse> responses;
}

class InteractionsUserSay with JsonConvert<InteractionsUserSay> {
	String classifier;
	String text;
}

class InteractionsResponse with JsonConvert<InteractionsResponse> {
	String type;
	String title;
	String subtitle;
	List<InteractionsResponsesButton> buttons;
	List<dynamic> filters;
	int delay;
	List<dynamic> elements;
	String imageUrl;
	InteractionsResponsesButton userResponse;
	bool isUserResponded=false;
}

class InteractionsResponsesButton with JsonConvert<InteractionsResponsesButton> {
	bool isLoading=true;
	String id;
	String type;
	String title;
	String value;
	List<dynamic> actions;
}

