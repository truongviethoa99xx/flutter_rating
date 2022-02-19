//@dart=2.9
import 'package:doancuoiky/apps/comment_page.dart';
import 'package:doancuoiky/apps/form/sign_in_form.dart';
import 'package:doancuoiky/apps/services/auth.dart';
import 'package:doancuoiky/apps/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user !=null){
      return Homepage();
    }
    else{
      return Authentication();
    }
  }
}
