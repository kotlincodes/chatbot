

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yellow_billy_bot/model/base_model.dart';

class BaseWidget extends StatelessWidget{
  
  final Stream<Status> stream;
  final Widget child;
  
  BaseWidget( {@required this.stream,@required this.child});
  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder<Status>(
      stream: stream,
      builder: (context, snapshot) {
        print(snapshot.data);
        return snapshot.data==Status.no_network?NoNetwork():snapshot.data==Status.success?child:child;
      }
    );
    throw UnimplementedError();
  }
  
}

class NoNetwork extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(child: Text("no network please try again")),
      ),
    );
    throw UnimplementedError();
  }
  
}