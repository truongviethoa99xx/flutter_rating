//@dart=2.9
import 'package:doancuoiky/apps/form/wrapper.dart';
import 'package:doancuoiky/apps/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class PageLogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _init = Firebase.initializeApp();
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorWidget();
        }
        else if (snapshot.hasData) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthenServices>.value(value: AuthenServices()),
              StreamProvider<User>.value(value: AuthenServices().user, initialData: null)
            ],
            child: MaterialApp(
                theme: ThemeData(
                  primarySwatch: Colors.lightGreen,
                ),
                debugShowCheckedModeBanner: false,
              home: Wrapper(),
            ),
          );
        }
        else {
          return Loading();
        }
      },
    );
  }
}

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child : Column(
              children: [Icon(Icons.error), Text('Có Lỗi')],
            )
        )
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child : CircularProgressIndicator(),
        )
    );
  }
}

