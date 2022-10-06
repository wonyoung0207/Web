
import 'package:alcohol_project/screens/authenticate/register.dart';
import 'package:flutter/material.dart';
import 'package:alcohol_project/screens/authenticate/sign_in.dart';
// 로그인인지, 회원가입인지 나눠주는 곳

class Authenticate extends StatefulWidget {
  // const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);//한번 눌려질때마다 토글
  }

  @override
  Widget build(BuildContext context) {
    return SignIn(toggleView: toggleView);//true일경우 실행 : 로그인 화면으로 이동
    // if (showSignIn){// 토글에 따라 다른 클래스가 호출됨
    //   //맨 처음엔 디폴트로 sigIn 패이지가 실행되고, 거기서 appbar에있는 회원가입을 누르면 toggle함수를 찾아서 현재 위젯이 다시 실행됨
    //   return SignIn(toggleView: toggleView);//true일경우 실행 : 로그인 화면으로 이동
    // }
    // else{
    //   return Register(toggleView: toggleView);//false일경우 실행 : appbar에있는 회원가입을 누르면 실행
    // }
  }
}
