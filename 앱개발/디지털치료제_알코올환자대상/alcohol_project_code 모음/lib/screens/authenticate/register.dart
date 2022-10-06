// import 'package:alcohol_project/service/auth.dart';
// import 'package:alcohol_project/shared/constants.dart';
// import 'package:alcohol_project/shared/loading.dart';
// import 'package:flutter/material.dart';
//
// // import 'package:flutter_spinkit/flutter_spinkit.dart';
//
//
// // 회원가입할경우 사용
//
// class Register extends StatefulWidget {
//   //const Register({Key? key}) : super(key: key);
//
//   final Function toggleView;
//   Register({required this.toggleView});//생성자
//
//   @override
//   _RegisterState createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//
//   final AuthService _auth = AuthService();
//   final _formKey = GlobalKey<FormState>();// Form의 ID를 부여할때 이용
//
//   bool loading = false;
//   String error = '';
//   String email = '';
//   String passwd = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return loading ? Loading():Scaffold(//
//       backgroundColor: Colors.brown[100],
//       appBar: AppBar(
//         backgroundColor: Colors.brown[400],
//         elevation: 0.0,
//         centerTitle: true,
//         title: Text('Register page in to coffee Crew'),
//         actions: [
//           FlatButton.icon(
//             onPressed: (){
//               widget.toggleView();//눌리면 모든 위젯에 있는 toggleview 함수를 찾아 이동
//             },
//             icon: Icon(Icons.person),
//             label: Text(' 로그인 페이지로 가기 '),
//           ),
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//         child: Form(// 입력할 수 있는 textbox를 제공
//           key: _formKey,
//           child: Column(
//             children: [
//               SizedBox(height: 20.0),
//               TextFormField(
//                 decoration: textInputDecoration.copyWith(hintText: 'Email'),//텍스트박스 꾸미는것
//                 validator: (val)  => val!.isEmpty ? 'Enter an email' : null,//비어있는지 검증하는것
//                 onChanged: (val){//변경된 내용이 있을경우
//                   setState(() => email = val);//email변수에 실시간으로 값을 넣어줌
//                 },
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 decoration: textInputDecoration.copyWith(hintText: 'Password'),
//                 obscureText: true,
//                 validator: (val)  => val!.length < 6 ? 'Enter an passwd' : null,
//                 onChanged: (val){
//                   setState(() => passwd = val);//
//                 },
//               ),
//               RaisedButton(// 회원가입 할떄 사용하는 버튼
//                 onPressed:() async {
//                   if(_formKey.currentState!.validate()){//폼 내부의 모든 자식들의 validator가 실행(형태 외워서쓰기)
//                     setState(() => {//회원가입할때 버튼누르고 대기화면을 띄우기위해 loading을 true로
//                       loading = true
//                     });
//                     // 입력된 값으로 유저의 이메일과 비밀번호를 생성
//                     //email형식이 아닐 경우에 에러가 남 -> ex) add@naver.com 형식이면 통과
//                     dynamic result = await _auth.registerWithEmailAndPassword(email, passwd);//해당 이메일과 비번을 등록함
//                     if(result == null){//firebaseAuth에서 이메일 형식을 체크함. 이때 이메일 형식이 아니면 result가 null이됨
//                       setState(() {
//                         error = '이메일 형식에 맞춰서 진행해 주세요. ';
//                         loading = false;
//                       });
//                     }
//                   }
//                 },
//                 color: Colors.pink[400],
//                 child: Text(
//                   ' 회원가입 ',
//                   style: TextStyle(
//                       color: Colors.white
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20.0,),
//               Text(
//                 error,
//                 style: TextStyle(
//                   fontSize: 14.0,
//                   color: Colors.red,
//                 )
//               )
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
