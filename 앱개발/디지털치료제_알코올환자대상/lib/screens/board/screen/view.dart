import 'package:alcohol_project/models/Board.dart';
import 'package:alcohol_project/models/Person.dart';
import 'package:alcohol_project/models/user.dart';
import 'package:alcohol_project/screens/home/boarderTile.dart';
import 'package:alcohol_project/service/database.dart';
import 'package:alcohol_project/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit.dart';
import 'package:flutter/src/material/flat_button.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String deleteId = '';


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    SnackBar basicSnackBar() {
      return SnackBar(
        duration: Duration(seconds: 2),
        content: Text("다른 사용자의 게시물을 삭제할 수 없습니다."),
        action: SnackBarAction(
          label: "Done",
          textColor: Colors.white,
          onPressed: () {},
        ),
      );
    }

    void deleteAlt(BuildContext context,Board board) async{
      String result = await showDialog(
          context: context,
          barrierDismissible: false,// 주변 클릭 안되게 하는 기능
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              title: Text('삭제 경고'),
              // content: Text("정말 삭제하시겠습니까? \n uid : ${board.uid} date : ${board.date}"),
              content: Text("정말 삭제하시겠습니까? \n"),
              actions: <Widget>[
                FlatButton(
                  child: Text('삭제'),
                  onPressed: () async{
                    if(user.uid == board.uid){
                      await DatabaseService(uid : user.uid).board_removMemo(// updata버튼 누르면 설정한 값들을 이용해서 firestore에 데이터를 바로 업데이트
                          board.date
                      );
                    }
                    else{
                      scaffoldKey.currentState!.showSnackBar(basicSnackBar());
                      print("다른 사용자의 게시물을 삭제할 수 없습니다. ");
                    }
                    Navigator.pop(context,'삭제');
                  },
                ),
                FlatButton(
                  child: Text('취소'),
                  onPressed: () {
                    Navigator.pop(context,'취소');
                  },
                )
              ],
            );
          }
      );
    }





    return StreamBuilder<List<Board>>(
        stream: DatabaseService(uid:user.uid).Boarder_info,
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Loading();
          }
          else{
            return Scaffold(
              key: scaffoldKey,

              appBar: AppBar(
                backgroundColor: Colors.brown[600],
                title: Text(" 커뮤니티"),
              ),

              body: Container(
                decoration: BoxDecoration(
                  color: Colors.brown[200],
                ),
                //child: memoBuilder(),
                child: StreamBuilder<List<Board>>(//메모 리스트 불러오는 곳
                  stream: DatabaseService(uid: user.uid).Boarder_info,//모든 board 정보 가져옴
                  builder: (context, snap) {
                    if (snap.data == null || snap.data!.isEmpty) {//게시물이 아무것도 없을 경우
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          '지금 바로 "게시물 추가" 버튼을 눌러\n새로운 게시물을 추가해보세요!\n\n\n\n\n\n\n\n\n',
                          style: TextStyle(fontSize: 20, color: Colors.brown[600]),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    if(snap.hasData){
                      return ListView.builder(// 게시물이 하나라도 존재하면 실행
                        itemCount: snap.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){},
                            onLongPress: () async{
                              print('Boarder Info : ${snap.data![index].title}');
                              deleteAlt(context,snap.data![index]);
                            },
                            child: BoarderTile(board : snap.data![index]),
                          );
                        },
                      );
                    }else{//데이터 불러올동안 실행
                      return Loading();
                    }
                  },
                ),
              ),


              floatingActionButton: FloatingActionButton.extended(//버튼 클릭시 개시물 작성할수 있도록
                onPressed: () {
                  print("scaffold key: ${scaffoldKey} , type : ${scaffoldKey.runtimeType}");
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => EditPage(
                      ),
                    ),
                  );
                },
                tooltip: "게시물을 작성하세요",
                label: Text('게시물 추가'),
                icon: Icon(Icons.add),
                backgroundColor: Colors.lightGreen[700],
              ), // This trailing comma makes auto-formatting nicer for build methods.
            );
          }

        }
    );
  }

}
