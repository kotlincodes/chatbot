import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:yellow_billy_bot/bloc/bot_bloc.dart';
import 'package:yellow_billy_bot/model/interactions_entity.dart';

class QuickReplies extends StatelessWidget {
  final InteractionsResponse item;
  final UserResponseClick userResponse;
  QuickReplies({@required this.item, @required this.userResponse});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
//            imageIcon,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BotResponse(
                message: item.title,
              ),
              item.isUserResponded
                  ? UserResponse(
                      response: item.userResponse,
                    )
                  : _getButton(item.buttons, userResponse)
            ],
          ),
        ),
      ],
    );

  }
}

Widget imageRes(String imageUrl) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        imageIcon,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            imageUrl,
            height: 200,
            width: 250,
            fit: BoxFit.fill,
          ),
        ),
      ],
    ),
  );
}

Widget _getButton(
    List<InteractionsResponsesButton> buttons, UserResponseClick userResponse) {
  return Center(
    child: Column(
        children: List.generate(buttons.length, (index) {
      return ButtonTheme(
        minWidth: 200,
        child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            userResponse.userResponse(buttons[index]);
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black87)),
          child: Text(buttons[index].title),
        ),
      );
    })),
  );
}

Widget _getCardButtons(
    List<InteractionsResponsesButton> buttons, UserResponseClick userResponse) {
  return Center(
    child: Column(
        children: List.generate(buttons.length, (index) {
      return ButtonTheme(
        minWidth: 200,
        child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            userResponse.userResponse(buttons[index]);
          },
          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
          child: Text(buttons[index].title),
        ),
      );
    })),
  );
}

class BotResponse extends StatelessWidget {
  final String message;
  BotResponse({@required this.message});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        imageIcon,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 6, right: 6),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    border: Border.all(color: Colors.black26)),
                child: Text(message),
              ),
              timeWidget()
            ],
          ),
        ),
      ],
    );
  }
}

class UserResponse extends StatelessWidget {
  final InteractionsResponsesButton response;
  UserResponse({@required this.response});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: response.isLoading != null && !response.isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 12, right: 12, top: 12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.all(Radius.circular(24.0))),
                  child: Text(
                    response.title,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                timeWidget()
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.all(Radius.circular(24.0))),
                width: 60,
                height: 30,
                child: SpinKitThreeBounce(
                  size: 12,
                  color: Colors.white,
                ),
              )),
    );
  }
}

class CardWidget extends StatelessWidget {
  final InteractionsResponse response;
  final UserResponseClick userResponse;
  CardWidget({@required this.response, @required this.userResponse});

  @override
  Widget build(BuildContext context) {
//    CardItemEntity _cardItemEntity=CardItemEntity().fromJson(jsonEncode(response.elements[0]))

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        imageIcon,
        Expanded(
          child: Container(
            width: 200,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(response.imageUrl),
                  ListTile(
                    title: Text(response.title),
                    subtitle: Text(response.subtitle),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: response.isUserResponded
                          ? UserResponse(
                              response: response.userResponse,
                            )
                          : _getCardButtons(response.buttons, userResponse))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget timeWidget() {
  return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 6, top: 6),
      child: Text(
        formattedDate(DateTime.now()),
        style: TextStyle(fontSize: 12),
      ));
}

Widget imageIcon = Image.network(
  "https://cdn.pixabay.com/photo/2017/10/24/00/39/bot-icon-2883144_960_720.png",
  width: 30,
  height: 30,
);

String formattedDate(DateTime now) {
  return DateFormat('hh:MM a').format(now);
}
