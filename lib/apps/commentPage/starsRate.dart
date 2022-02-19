//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doancuoiky/apps/commentPage/nhapsdt.dart';
import 'package:doancuoiky/apps/commentPage/rating.dart';
import 'package:flutter/material.dart';

class RatingsPage extends StatefulWidget {
  @override
  _RatingsPage createState() => _RatingsPage();
}

class _RatingsPage extends State<RatingsPage> {
  CollectionReference rate = FirebaseFirestore.instance.collection('rate');
  int _rating1;
  int _rating2;
  int _rating3;
  int _rating4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        AppBar(title: Text("Chấm điểm đánh giá"),backgroundColor: Colors.lightGreen),
        body: Container(
          margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Sản phẩm chính hãng',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.lightGreen)),
                      ],
                    ),
                    SizedBox(width: 600.0),
                    Column(
                      children: [
                        Rating((rating) {
                          setState(() {
                            _rating1 = rating;
                          });
                        }, 5),
                        ],
                    )
                  ],
                ),
                SizedBox(height: 50.0,),
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Sản phẩm giá tốt',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.lightGreen)),
                      ],
                    ),
                    SizedBox(width: 645.0),
                    Column(
                      children: [
                        Rating((rating) {
                          setState(() {
                            _rating2 = rating;
                          });
                        }, 5),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 50.0,),
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Hàng hóa đa dạng',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.lightGreen)),
                      ],
                    ),
                    SizedBox(width: 635.0),
                    Column(
                      children: [
                        Rating((rating) {
                          setState(() {
                            _rating3 = rating;
                          });
                        }, 5),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 50.0,),
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Thái độ nhân viên',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.lightGreen)),
                      ],
                    ),
                    SizedBox(width: 635.0),
                    Column(
                      children: [
                        Rating((rating) {
                          setState(() {
                            _rating4 = rating;
                            print("$rating");
                          });
                        }, 5),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 150.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        onPressed: () async {
                            await rate.add({
                              'total': _rating4 + _rating3 + _rating2 + _rating1,
                            }).then((value) => Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => AddPhone())),);
                        },
                        child: const Text('Gửi đánh giá đi',
                            style: TextStyle(fontSize: 20)),
                        color: Colors.lightGreen,
                        textColor: Colors.white,
                        elevation: 5,
                      ),
                    )
                  ],
                )
            ]),
          ),
        );
  }
}