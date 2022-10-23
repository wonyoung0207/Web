import 'package:alcohol_project/service/auth.dart';
import 'package:alcohol_project/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:alcohol_project/shared/constants.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:getwidget/getwidget.dart';
// 로그인페이지

class SignIn extends StatefulWidget {
  //const SignIn({Key? key}) : super(key: key);

  final Function toggleView;// 밑의 toggleView() 내용을 authenticate.dart로부터 받아옴
  // void toggleView(){
  //   setState(() => showSignIn = !showSignIn);//한번 눌려질때마다 토글
  // }

  SignIn({required this.toggleView});//생성자로 toggle을 초기화 시켜줌

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String error = '';
  String email = '';
  String passwd = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.lightGreen[400],
      // appBar: AppBar(
      //   backgroundColor: Colors.brown[400],
      //   elevation: 0.0,
      //   centerTitle: true,
      //   title: Text(' 안티 알코올 '),
      //   // actions: [
      //   //   FlatButton.icon(
      //   //       onPressed: (){
      //   //         widget.toggleView();//눌리면 모든 위젯중 toggleview 함수를 찾아 이동
      //   //         // 결과적으로, toggleView() 함수가 있는 authenticate.dart가 로드됨
      //   //       },
      //   //       icon: Icon(Icons.person),
      //   //       label: Text('회원가입 페이지로 가기 '),
      //   //   ),
      //   // ],
      // ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 70, 40, 30),
          child: Form(// 입력할 수 있는 textbox를 제공
            key: _formKey,
            child: Column(
              children: [
                //CircleAvatar
                GFAvatar(
                    radius: 140,
                    backgroundImage:AssetImage('assets/ko_image.png',),
                    shape: GFAvatarShape.standard
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  //공통 클래스 만들어서 스타일 적용
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val)  => val!.isEmpty ? 'Enter an email' : null,//유효성 검사 하는 부분, 버튼 눌리고 나서 유효성 검사가 이뤄짐
                  onChanged: (val){//변경된 내용이 있을경우
                    setState(() => email = val);//email변수에 실시간으로 값을 넣어줌
                  },
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val)  => val!.length < 6 ? 'Enter an passwd' : null,//유효성 검사 하는 부분, 버튼 눌리고 나서 유효성 검사가 이뤄짐
                  onChanged: (val){
                    setState(() => passwd = val);//
                  },
                ),
                SizedBox(height: 20.0),
                ButtonTheme(
                  height: 45,
                  minWidth: 500,
                  child: RaisedButton(// 로그인에 사용할 버튼
                    onPressed:() async {//키 눌렸을 때
                      if(_formKey.currentState!.validate()){//현재 state에 있는 form이 맞는지 확인 -> 맞다면 실행
                        // 이때 form안에 있는 validate가 실행됨
                        // 입력받은 값을 form의 유효성 검사 부분으로 넘김
                        setState(() => {
                          loading = true
                        });
                        print('valid');

                        // auth.dart 위젯 부분에 있는 모든 사용자 계정과 비교 후 있으면 해당 사용자 계정정보 리턴함
                        dynamic result = await _auth.signInWithEmailAndPassword(//form으로부터 받아온 정보를 이용해 사용자 계정정보확인. 있으면 사용자계정 정보 가져옴
                            email,
                            passwd,
                        );//user의 uid가 result에 저장된다.
                        // 최종적으로 result가 authenticate.dart로 return 되서-> wrapper.dart -> main.dart 로가서 stream 통로로 인해 user 정보가 입력된다.
                        //그래서 user 정보가 있으므로 wrapper.dart 에서 home() 위젯을 실행한다.

                        if(result == null){//firebaseAuth 에 계정정보가 없으면 실행
                          setState(() {
                            error = '로그인 할 수 없습니다. 아이디와 비밀번호를 체크하세요.';
                            loading = false;
                          });
                        }
                      }
                    },

                    color: Colors.brown[600],
                    child: Text(
                      ' 로그인 ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Text(
                  error,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.red,

                  ),
                )

              ],
          ),

          // child: RaisedButton(
          //   onPressed: () async{
          //     //AuthService클래스의 메소드를 실행시킴
          //     dynamic result = await _auth.signInAnon();
          //     if(result == null){
          //       print('error signing in');
          //     }else{
          //       print('signed in');
          //       print(result.uid);
          //     }
          //   },
          //   child: Text('로그인하기 : Sign in anon'),
          ),
        ),
      ),
    );
  }
}
