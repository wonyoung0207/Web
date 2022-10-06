import 'package:alcohol_project/models/user.dart';
import 'package:alcohol_project/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
//firebase의 AuthService와 연결하는 것 -> pubspec.yaml에 firebase와 연동해줘야함

class AuthService{//인증서비스
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //firebase에있는 인증절차를 객체화 시킴


  // 로그인 성공을 판단하는 메소드
  MyUser? _userFromFireBaseUser(User user){
    //MyUser 클래스 형태를 리턴하는 _userFromFireBaseUser() 메소드를 생성
    //사용자가 로그인에 성공하면 user를 리턴

    return user != null ? MyUser(uid: user.uid) : null;//user정보중 uid만 출력
    //MyUser 형식을 리턴함
  }



  Stream<MyUser?> get user{//firebaseAuth 객체에 있는 인증절차를 이용해 저장되어있는 사용자 정보들을 불러온다.
    // 스트림 : 데이터나 이벤트가 들어오는 통로
    // 비동기를 위해 사용된다. 데이터를 만드는곳과 소비하는곳을 나눈다.
    return _auth
        .authStateChanges()// firebase에 있는 인증절차에 있는 메소드 사용
        .map((User? user) => _userFromFireBaseUser(user!));

        //.map((User? user) => _userFromFireBaseUser(user!));
        // firebase의 User객체에다가 _userFromFireBaseUser() 메소드의 결과를 넣어줌
        //.map(_userFromFireBaseUser); // 이렇게 써도됨
  }




  Future signInAnon() async{//로그인 : 익명로그인 기능 -> fireBase에서 채크해줘야함
    try{
      UserCredential result = await _auth.signInAnonymously();//로그인 아무나 채크
      User? user = result.user;// 결과로 온 로그인 유무를 user 객체로 만듬
      
      return _userFromFireBaseUser(user!);// 로그인 유무를 판단하는 메소드 
      
    }catch(e){
      print(e.toString());//사용자가 로그인에 실패했을경우 null을 리턴
      return null;
    }
  }

  // Future registerWithEmailAndPassword(String email, String password) async{
  //   try{// 회원가입 메소드
  //     // 여기서 이메일과 패스워드로 사용자의 계정을 만든다.
  //     // 이떄 이메일 형식이 아니면 result에 널이 들어간다.
  //     UserCredential result = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password
  //     );
  //
  //     User? user = result.user;
  //     await DatabaseService(uid: user!.uid).updateUserData('0', 'new coffee member', 100);
  //     return _userFromFireBaseUser(user!);
  //
  //   }catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }

  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      // 여기서 이메일과 패스워드로 사용자 로그인을 수행
      // 이떄 데이터베이스에 해당 이메일과 비번이 틀리다면 null을 리턴
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      User? user = result.user;
      return _userFromFireBaseUser(user!);

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{//로그아웃기능
    try{
      return await _auth.signOut();
      // 여기서의 _auth는 firebase이기 떄문에 firebase의 sigOut()메소드를 호출
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}