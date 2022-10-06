import 'dart:ffi';
import 'package:alcohol_project/models/myDateTime.dart';
import 'package:alcohol_project/models/user.dart';
import 'package:alcohol_project/screens/board/screen/view.dart';
import 'package:alcohol_project/screens/home/MyRank.dart';
import 'package:alcohol_project/screens/home/calender.dart';
import 'package:alcohol_project/screens/home/person_list.dart';
import 'package:alcohol_project/screens/home/walking.dart';
import 'package:alcohol_project/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alcohol_project/screens/home/settings_form.dart';
import 'package:alcohol_project/service/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alcohol_project/service/database.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alcohol_project/models/Person.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:pedometer/pedometer.dart';



class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final AuthService _auth = AuthService();



  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);
    int day_count = 1;


    void _showSettingsPanel() {//사용자 계정에 저장되어있는 정보를 바꾸기위해 사용되는 메소드
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    SnackBar basicSnackBar(int diff) {
      return SnackBar(
        duration: Duration(seconds: 2),
        content: Text("${diff} 일 이상 출석하지 않아 등급이 하락합니다. "),
        action: SnackBarAction(
          label: "Done",
          textColor: Colors.white,
          onPressed: () {},
        ),
      );
    }

    SnackBar Day7SnackBar() {
      return SnackBar(
        duration: Duration(seconds: 2),
        content: Text("연속으로 7일을 출석체크 하셨습니다. 추가점수가 부여됩니다!"),
        action: SnackBarAction(
          label: "Done",
          textColor: Colors.white,
          onPressed: () {},
        ),
      );
    }

    SnackBar today_clear_SnackBar() {
      return SnackBar(
        duration: Duration(seconds: 2),
        content: Text("이미 출석을 완료하셨습니다. "),
        action: SnackBarAction(
          label: "Done",
          textColor: Colors.white,
          onPressed: () {},
        ),
      );
    }

    void _showCupertinoDialog(BuildContext context, int score){//출석채크 점수 주는 곳
      showDialog(
        context : context,
        builder : (context) => CupertinoAlertDialog(
          title : Text("출석체크"),
          content : Text("오늘 금주를 성공하셨나요?"),
          actions: <Widget>[
            StreamBuilder<myDateTime>(
                stream: DatabaseService(uid: user.uid).calendar_dateTime,
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return CupertinoDialogAction(
                      child: Text('네'),
                      onPressed: () async {


                        DateTime currentTime = await NTP.now();
                        currentTime = currentTime.toUtc().add(Duration(hours: 9));
                        DateTime parsedDate_ = DateTime(currentTime.year, currentTime.month, currentTime.day);
                        String parsedDate_string=parsedDate_.toString();
                        parsedDate_string=parsedDate_string.substring(0, 10);

                        print("test_date : "+snapshot.data!.cur_dateTime.substring(
                            snapshot.data!.cur_dateTime.length - 10,snapshot.data!.cur_dateTime.length)
                        );

                        String db_before_date = snapshot.data!.cur_dateTime.substring(
                            snapshot.data!.cur_dateTime.length - 10,snapshot.data!.cur_dateTime.length);


                        if(parsedDate_string.compareTo(db_before_date) != 0){//출석체크 날자가 중복되지 않을 경우 실행

                          int difference = int.parse(
                              parsedDate_.difference(DateTime.parse(db_before_date)
                              ).inDays.toString()
                          );

                          if(difference != 1){//전날 출석체크 하지 않았다면
                            day_count = 0; // 연속으로 출석체크 시 증가하는 변수를 0으로 리셋

                          }
                          print(day_count);

                          // 7일 이상 출석체크시 실행될 곳 -> 추가점수 부여
                          if(day_count == 7){//추가 점수 부여
                            // if(snapshot.data!.cur_dateTime.length >= 86){//length 가 86이 넘어야 실행 -> 7일이상 출석체크해야 실행되는 곳
                            //   String db_7Day_before_date = snapshot.data!.cur_dateTime.substring(
                            //       snapshot.data!.cur_dateTime.length - 87,snapshot.data!.cur_dateTime.length -77);
                            //
                            //   print("day_7Day: "+db_7Day_before_date);
                            //
                            //   int day_continuity = int.parse(
                            //       parsedDate_.difference(DateTime.parse(db_7Day_before_date)
                            //       ).inDays.toString()
                            //   );
                            //
                            //   print("7일아니면 " + day_continuity.toString());
                            //
                            //   if(day_continuity == 7){
                            //     print("7이면 출력되는곳 ");
                            //   }
                            // }
                            print("7일 출석하셨습니다. 추가 점수가 부여됩니다. ");
                            scaffoldKey.currentState!.showSnackBar(Day7SnackBar());
                            await DatabaseService(uid: user.uid).member_update_7Day_countinue_UserScore(score);
                            day_count = 0;// 다시 0으로 리셋

                          }else{//아직 7일 출석이 아닐 경우 실행 -> 기본점수 부여

                            day_count++;
                            await DatabaseService(uid: user.uid).member_update_attend_UserScore(score);// 점수 부여
                          }

                          if( difference >= 3){//만약 출석체크를 3일 이상 하지 않았더라면 실행
                            await DatabaseService(uid: user.uid).member_dropUserScore(score);
                            scaffoldKey.currentState!.showSnackBar(basicSnackBar(difference));

                          }

                          await DatabaseService(uid: user.uid).member_updateCalendar(
                            parsedDate_string,
                            snapshot.data!.cur_dateTime,
                          );

                        }
                        else{
                          scaffoldKey.currentState!.showSnackBar(today_clear_SnackBar());
                          print("안돼 돌아가");
                        }
                        Navigator.of(context).pop();
                      },
                    );
                  }else{
                    return Loading();
                  }
                }
            ),
            CupertinoDialogAction(
              child: Text('아니오'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }



    //stream파이프를 통해서 스냅샷으로 firebase에서 실시간으로 업데이트된 정보를 가져온다
    return StreamProvider<List<Person>>.value(
      value: DatabaseService(uid:'').member_info,//DatabaseService 위젯의 get coffees를 호출 -> 커피컬랙션의 모든 정보를 list형식으로 받아서 stream에 저장

      initialData: [],
      child: Scaffold(
        key: scaffoldKey,
        //backgroundColor: Colors.lightGreen[100],
        backgroundColor: Colors.lightGreen[100],
        appBar: AppBar(
          title: Text('안티 알코올'),
          backgroundColor: Colors.brown[600],
          elevation: 0.0, //메뉴바의 그라데이션
        ),

        body: ListView(
          children: [
            Container(
              height: 285,
              child: CalendarScreen(),
            ),
            SizedBox(height: 5,),

            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),

              child: StreamBuilder<member_UserData>(
                  stream: DatabaseService(uid: user.uid).member_userData,
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return CupertinoButton(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        // borderRadius: BorderRadius.all(Radius.circular(0.0)),
                        child: Text(
                            '출 석  체 크',
                            style: TextStyle(fontSize: 20,color: Colors.white)
                        ),
                        onPressed: (){
                          _showCupertinoDialog(context,snapshot.data!.score);
                        },
                        color : Colors.amber,
                      );
                    }else{
                      return Loading();
                    }

                  }
              ),
            ),

            SizedBox(height: 5,),

            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Container(
                height: 45,
                width: 100,
                alignment:Alignment.center,

                child:walking(
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 220,
                width: 400,

                child: Row(
                  children: <Widget> [
                    Container(
                      height: 260,
                      width: 260,
                      decoration: BoxDecoration(
                        color: Colors.brown[200],
                      ),

                      child: Column(
                        children: [
                          PersonList(),
                        ],
                      ),

                    ),
                    Container(
                      height: 260,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.brown[400],

                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20.0,),
                          MyRank(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),


        //Drawer 에 streamPovider 적용 전 _ 백업 코드
        endDrawer: Drawer(//측면 메뉴바 구성
          //side menu 구현(메뉴화면)
          child: StreamBuilder<member_UserData>(
              stream: DatabaseService(uid: user.uid).member_userData,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  final Person person = new Person(
                    name: snapshot.data!.name,
                    drink: snapshot.data!.drink,
                    score: snapshot.data!.score,
                    uid: snapshot.data!.uid,
                    steps : snapshot.data!.steps,
                    startday: snapshot.data!.startday,
                  );

                  String savePrice(String drink){

                    int saveMoney = int.parse(drink) * 5000;
                    return saveMoney.toString();
                  }



                  int Dday(){
                    DateTime start=DateTime.parse(snapshot.data!.startday);
                    DateTime today=DateTime.parse(DateFormat('yyyyMMdd').format(DateTime.now()));
                    int difference = int.parse(today.difference(start).inDays.toString());
                    return difference;
                  }

                  String monthPrice(String drink){
                    int saveMoney = int.parse(drink) * 5000 * Dday();
                    return saveMoney.toString();
                  }

                  return ListView(
                    children: <Widget>[
                      Container(
                        height: 55.0, // 사용자 정보 목록 높이 설정
                        child: DrawerHeader(
                          //사용자 정보 목록
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(

                                radius: 13.0,
                                backgroundImage: AssetImage('assets/${person.avatar_choose()}.png'),
                              ),
                              Expanded(
                                child: Text(
                                  "${snapshot.data!.name} 사용자님",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Icon(Icons.menu),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        color: Colors.lightGreen[100],
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5.0, 13.0, 0.0, 0.0),
                          child: ListTile(
                            //절약 비용 목록
                            title: Text(
                              "D + ${Dday()}\n",
                              style: TextStyle(

                                fontSize: 20.0,
                                color:Colors.black,
                              ),
                              //textAlign: TextAlign.center,
                            ),
                            subtitle: Text(
                                "나의 주량 : ${snapshot.data!.drink} 병\n"
                                    "오늘 절약한 비용 :  ${savePrice(snapshot.data!.drink)} 원\n"
                                    "현재 누적 절약 비용: ${monthPrice(snapshot.data!.drink)} 원",

                                style: TextStyle(
                                  fontSize: 16.0,
                                  color:Colors.black,
                                ),
                            ),
                          ),
                        ),
                      ),

                      Divider(
                        height: 3.0,
                        color: Colors.black,
                      ),

                      Container(
                        height: 55,
                        child: ListTile(

                          title: Text(
                            "프로필 수정하기",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () async{
                            _showSettingsPanel();
                            // Navigator.pop(context),
                          },
                        ),
                      ),


                      Divider(
                        height: 3.0,
                        color: Colors.black,
                      ),
                      Container(
                        height: 55,
                        child: ListTile(
                          //커뮤니티 목록
                          title: Text(
                            "커뮤니티 목록",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () async=> {
                            Navigator.push(
                              context,
                              await MaterialPageRoute(
                                // 새로운 builder를 만들어서 진행함. builder는 context를 이용해서 해당 위젯이 위젯tree에 어느 위치에 있는지 알게해줌
                                  builder: (context) => MyHomePage()
                              ),//view.dart로 이동
                            ), // Navigator.pop(context),
                          },
                        ),
                      ),
                      Divider(
                        height: 3.0,
                        color: Colors.black,
                      ),
                      Container(
                        height: 55,
                        child: ListTile(
                          //커뮤니티 목록
                          title: Text(
                            "로그아웃하기",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () async {
                            await _auth.signOut();
                          },
                        ),
                      ),
                      Divider(
                        height: 3.0,
                        color: Colors.black,
                      ),
                    ],
                  );
                }else{
                  return Loading();
                }
              }
          ),
        ),
      ),
    );
  }
}
