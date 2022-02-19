//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doancuoiky/apps/form/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddPhone extends StatefulWidget {
  const AddPhone({Key key}) : super(key: key);

  @override
  _AddPhoneState createState() => _AddPhoneState();
}

class _AddPhoneState extends State<AddPhone> {
  static const String _title =
      'Quý khách vui lòng nhập thông tin để chúng tôi có \n                              thể phục vụ tốt hơn';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightGreen,
              toolbarHeight: 100.0,
              centerTitle: true,
              title: const Align(
                child: Text(
                  _title,
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
              leading: IconButton(
                  icon : const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) =>const MainPage())),
              ),
            ),
            body: const SingleChildScrollView(
              padding: EdgeInsets.all(0.0),
              child: Card(child: MyStatefulWidget()),
            )));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  CollectionReference comment = FirebaseFirestore.instance.collection('comment');
  TextEditingController _nameController;
  TextEditingController _phoneController;
  String textName;
  String textSdt;
  String textComment;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(children: <Widget>[
        const SizedBox(height: 10.0),
        Row(children: <Widget>[
          Container(
            width: 400.0,
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              onChanged: (value) {
                textName = value;
              },
              validator: (val) =>
                  val.isNotEmpty ? null : "Quý khách chưa nhập tên",
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: "Tên của quý khách",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              maxLength: 100,
            ),
          ),
          const SizedBox(width: 100.0),
          Container(
            width: 400.0,
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              onChanged: (value) {
                textSdt = value;
              },
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: _phoneController,
              validator: (val) =>
                  val.length < 10 ? "Số điện thoại phải có 10 số" : null,
              decoration: InputDecoration(
                  labelText: "Số điện thoại của quý khách",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              maxLength: 10,
            ),
          ),
        ]),
        Row(
          children: [
            Container(
              width: 920.0,
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                onChanged: (value) {
                  textComment = value;
                },
                decoration: InputDecoration(
                    labelText: "Đánh giá của quý khách",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            )
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 920.0,
              child: RaisedButton(
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    //   print("Name: ${_nameController.text}");
                    //   print("Phone: ${_phoneController.text}");
                    await comment.add({
                      'comments': textComment,
                      'email': '',
                      'name': textName,
                      'sdt': textSdt
                    }).then((value) => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Image.asset('Images/thanks.png',width: 700.0,height: 300.0),
                        content: const Text('Cảm ơn quý khách đã đóng góp ý kiến giúp hệ thống khắc phục nhược điểm',
                            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold, color: Colors.lightGreen)),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const MainPage())),
                            child: const Text('Về trang chính'),
                          ),
                        ],
                      ),));
                  }
                },
                child: const Text('Submit'),
                textColor: Colors.white,
                color: Colors.lightGreen,
              ),
            ),
          ],
        ),
        const SizedBox(height: 250.0),
      ]),
    );
  }
}
