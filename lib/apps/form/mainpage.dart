import 'package:doancuoiky/apps/commentPage/nhapsdt.dart';
import 'package:doancuoiky/apps/commentPage/starsRate.dart';
import 'package:doancuoiky/apps/customizeControl/customize_text_button.dart';
import 'package:doancuoiky/apps/form/sign_in_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title:
            const Text('Khoa công nghệ thông tin - Robot - Trí tuệ nhân tạo'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Quý khách có hài lòng với dịch vụ của chúng tôi',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomizeTextButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddPhone())),
                  widget: Image.asset('Images/ratthatvong.gif',
                      width: 180.0, height: 180.0),
                  textValue: 'Rất thất vọng',
                ),
                CustomizeTextButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddPhone())),
                  widget: Image.asset('Images/khonghailong.gif',
                      width: 180.0, height: 180.0),
                  textValue: 'Không hài lòng',
                ),
                CustomizeTextButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RatingsPage())),
                  widget: Image.asset('Images/hailong.gif',
                      width: 180.0, height: 180.0),
                  textValue: 'Hài lòng',
                ),
                CustomizeTextButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RatingsPage())),
                  widget: Image.asset('Images/tot.gif',
                      width: 180.0, height: 180.0),
                  textValue: 'Tốt',
                ),
                CustomizeTextButton(
                  onPressed: ()=> Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RatingsPage())),
                  widget: Image.asset('Images/rattot.gif',
                      width: 180.0, height: 180.0),
                  textValue: 'Rất tốt',
                ),
              ],
            ),
            const SizedBox(height: 110.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    onPressed: () => print('ok'),
                    child: const Text('Thông tin về chúng tôi',
                        style: TextStyle(fontSize: 20)),
                    color: Colors.lightGreen,
                    textColor: Colors.white,
                    elevation: 5,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PageLogin())),
        child: const Icon(Icons.home),
        backgroundColor: Colors.green,
      ),
    ));
  }
}
