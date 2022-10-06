import 'package:alcohol_project/models/user.dart';
import 'package:alcohol_project/screens/wrapper.dart';
import 'package:alcohol_project/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:alcohol_project/models/user.dart';

void main() async{
  // firebase를 사용하기 위해서 먼저 초기화해준다.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // 초기화 될때까지 기다린다.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return StreamProvider<MyUser?>.value(//데이터를 생성하는 곳
      //provider : 데이터를 전역에서 사용하기 위해 MaterialApp 을 포장
      catchError: (User,MyUser) => null,

      // 데이터를 생성하는 곳과 소비하는곳으로 나뉜다.
      // 이곳은 데이터를 생성하는곳
      initialData: null,// 초기값을 꼭 넣어줘야 한다.
      value: AuthService().user,//로그인 인증하기 위해 user로 사용자들의 가입정보를 모두 가져온다.
      // 따라서 stream 통로에 모든 사용자계정에 대한 정보를 가져온다.
      //AuthService에 있는 stream인 user를 호출해서 데이터를 생성

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}