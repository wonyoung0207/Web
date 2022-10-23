import 'package:alcohol_project/models/user.dart';
import 'package:flutter/material.dart';
import 'package:alcohol_project/screens/authenticate/authenticate.dart';
import 'package:alcohol_project/screens/home/home.dart';
import 'package:provider/provider.dart';

//listen for auth changes
// 로그인과 비로그인을 나눠주는 구간

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //provider : 데이터를 전역에서 사용하기 위해 사용
    // 데이터를 생성하는 곳과 소비하는곳으로 나뉜다.
    // 이곳은 데이터를 소비하는 곳
    final MyUser? user = Provider.of<MyUser?>(context);//데이터를 가져온다.
    print('맨 처음 wrapper 실행시 user정보 가져오는 곳 :');
    print( user);

    if(user == null){// user로 받아온값이 null이라면 사용자가 로그인을 안한것임
      return Authenticate();// 검증하는 위젯으로 넘어감
      // -> 최종적으로 signIn 위젯의 화면을 띄워줌
    }else{ //값이 있으면 로그인 한 것임
      return Home();// 홈 화면 위젯을 띄워줌
    }
  }
}
