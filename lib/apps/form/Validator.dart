import 'package:email_validator/email_validator.dart';

abstract class StringValidator{
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator{
  @override
  bool isValid(String value){
    return value.isNotEmpty;
  }
}

class EmailAndPassWordValidator{
  final StringValidator nameValidator = NonEmptyStringValidator();
  final StringValidator phoneValidator = NonEmptyStringValidator();
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final String invalidEmailErrorText = "Bạn chưa nhập email";
  final String invalidPasswordErrorText = "Bạn chưa nhập mật khẩu";
  final String invalidNameErrorText = "Bạn chưa nhập tên";
  final String invalidPhoneErrorText = "Bạn chưa nhập số điện thoại";
}