//@dart=2.9
import 'package:doancuoiky/apps/form/mainpage.dart';
import 'package:doancuoiky/apps/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  final Function toggleScreen;
  const Login({Key key, this.toggleScreen}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  bool _showPass = false;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthenServices>(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MainPage())),
                  icon: const Icon(Icons.arrow_back),
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 30.0),
                const Text("Đăng nhập",
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _emailController,
                  validator: (val) =>
                      val.isNotEmpty ? null : "Quý khách chưa nhập email",
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail),
                      labelText: "Email",
                      hintText: "abc@gmail.com",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  validator: (val) =>
                      val.length <= 8 ? "Mật khẩu phải có 8 ký tự" : null,
                  controller: _passwordController,
                  obscureText: !_showPass,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.vpn_key),
                      suffixIcon: InkWell(
                          onTap: onShowPass,
                          child: const Icon(Icons.visibility)),
                      labelText: "Mật khẩu",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                const SizedBox(height: 10.0),
                MaterialButton(
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      await loginProvider.signInWithEmailAndPassword(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );
                    }
                  },
                  height: 50.0,
                  minWidth: loginProvider.isLoading ? null : double.infinity,
                  color: Colors.lightGreen,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: loginProvider.isLoading
                      ? const CircularProgressIndicator()
                      : const Text("Đăng nhập",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Bạn chưa có tài khoản ?"),
                    const SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () => widget.toggleScreen(),
                      child: const Text("Đăng ký"),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                if (loginProvider.errorMessage != null)
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      color: Colors.amberAccent,
                      child: ListTile(
                        title: Text(loginProvider.errorMessage),
                        leading: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => loginProvider.setMessage(null),
                        ),
                      ))
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void onShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
