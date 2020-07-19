import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yellow_billy_bot/bloc/bloc_provider.dart';
import 'package:yellow_billy_bot/bloc/bot_bloc.dart';
import 'package:yellow_billy_bot/model/interactions_entity.dart';
import 'package:yellow_billy_bot/widgets/BaseWidget.dart';
import 'package:yellow_billy_bot/widgets/response_widgets.dart';

class BotScreen extends StatelessWidget {
  final _bloc = BotBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BotBloc>(
      bloc: _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Billy "),
        ),
        body: BaseWidget(
          stream: _bloc.outStatus,
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: _getList(),
                ),
                _getTextField()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getTextField() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(12),
            child: TextField(
              minLines: 1,
              controller: _bloc.userInputController,
              decoration: new InputDecoration(
                suffixIcon: InkWell(
                    onTap: _bloc.onSend,
                    child: Icon(
                      Icons.send,
                      color: Colors.blue,
                    )),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(24)
//                            borderSide: BorderSide(color: Colors.grey, width: 5.0),
                        ),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(24)
//                            borderSide: BorderSide(color: Colors.grey, width: 5.0),
                        ),
                hintText: 'Enter your text',
              ),
            ),
          ),
        ),
      ],
    );
  }

  _getList() {
    return StreamBuilder<List<InteractionsResponse>>(
        stream: _bloc.outResponse,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: _bloc.controller,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data[index];

                      switch (item.type) {
                        case "quickReplies":
                          return QuickReplies(
                            item: item,
                            userResponse: _bloc,
                          );

                        case "image":
                          return imageRes(item.imageUrl);

                        case "text":
                          return BotResponse(
                            message: item.elements
                                .toString()
                                .replaceAll("[", "")
                                .replaceAll("]", ""),
                          );

                        case "card":
                          return CardWidget(
                              response: item, userResponse: _bloc);

                        case "user":
                          return UserResponse(
                            response: item.userResponse,
                          );

//                    case "loading":
//                      return Loading();

                        default:
                          return Container();
                      }
                    },
                  ))
              : Container(
                  height: 10,
                );
        });
  }
}
