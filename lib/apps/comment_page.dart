import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doancuoiky/apps/customizeControl/show_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future logOut() async{
    await _firebaseAuth.signOut();
  }

  Future<void> _confirmSignOut(BuildContext context) async{
    final didRequestSignOut = await ShowAlertDialog(context,
        title: 'Đăng xuất',
        content: 'Bạn có muốn đăng xuất?',
        cancelActionText: 'Từ Chối',
        defaultActionText: 'Đăng xuất');
    if(didRequestSignOut == true){
      logOut();
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: const Text('Nhận xét'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Colors.lightGreen, // background
              ),
                onPressed:() {_confirmSignOut(context);},
                child: const Text('Đăng xuất'),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('comment').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Card(
                  child: ListTile(
                    title: Text(data['name']),
                    subtitle: Text(data['comments']),
                    leading: CircleAvatar(
                      child: Image.asset('Images/icon.png',width: 50.0,height: 50.0),
                  ),
                  trailing: Text('rate: 12 star'),
                )
                );
              }).toList(),
            );
          },
        ),
        )
      );
  }
}