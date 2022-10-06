import 'dart:convert';
import 'package:alcohol_project/models/Person.dart';
import 'package:alcohol_project/models/user.dart';
import 'package:alcohol_project/service/database.dart';
import 'package:alcohol_project/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ntp/ntp.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

//게시물 입력받는 위젯

class EditPage extends StatefulWidget {
  //const EditPage({Key? key}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  // 입력받을 내용을 저장할 변수
  late String date = '';
  late String title = '';
  late String text = '';
  late String user_uid = '';
  late String name = '';
  late int score = 0;


  @override
  Widget build(BuildContext context) {
    // final member_info = Provider.of<List<Person>>(context) ?? [];//home.dart 에서 streamProvider로 Person<List> 형식으로 데이터 가져옴
    final user = Provider.of<MyUser>(context);
    //WorldTime time_Kor = WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png');



    void Korean_Time() async{// 한국시간 구하는 함수
      DateTime currentTime = await NTP.now();
      currentTime = currentTime.toUtc().add(Duration(hours: 9));
      print("한국시간 NTP : ${currentTime}");

      this.date = currentTime.toString();
    }


    return StreamBuilder<member_UserData>(
      stream: DatabaseService(uid: user.uid).member_userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          member_UserData? member_userData = snapshot.data;
          this.name = member_userData!.name;
          this.score = member_userData!.score;
          Korean_Time();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown[600],
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: () async {
                    await DatabaseService(uid: user.uid).member_update_memo_UserScore(
                      snapshot.data!.score
                    );
                    await DatabaseService(uid: user.uid).board_addmemo(
                      // updata버튼 누르면 설정한 값들을 이용해서 firestore에 데이터를 바로 업데이트
                        this.date,
                        this.name ?? member_userData!.name,
                        this.title,
                        this.text,
                        this.score ?? member_userData!.score
                    );
                    Navigator.pop(context);
                  }, //데이터베이스로 내용을 보내서 추가시킨다.
                  // onPressed: updateDB,
                )
              ],
            ),

            body: SingleChildScrollView(
              // 내용이 위젯 화면 넘치면 에러나는거 방지하기 위해 사용
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      //게시물의 title을 입력받는 form
                      onChanged: (String title) {
                        this.title = title;
                      },
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: '제목을 입력하세요',
                      ),
                    ),

                    Padding(padding: EdgeInsets.all(10)),
                    TextField(
                      //게시물의 내용을 입력받는 form
                      onChanged: (String text) {
                        this.text = text;
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: '내용을 입력하세요',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        else{
          return Loading();
        }
      }
    );
  }
}
