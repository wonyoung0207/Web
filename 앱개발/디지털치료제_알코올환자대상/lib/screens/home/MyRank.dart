import 'package:alcohol_project/models/Person.dart';
import 'package:alcohol_project/models/user.dart';
import 'package:alcohol_project/service/database.dart';
import 'package:alcohol_project/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyRank extends StatefulWidget {

  @override
  _MyRankState createState() => _MyRankState();
}

class _MyRankState extends State<MyRank> {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    final member_info = Provider.of<List<Person>>(context);

    int Myrank_calc() {
      int count = 1;
      for(int i=0; i < member_info.length; i++){
        if(user.uid == member_info[i].uid){
          print("나의 순위를 찾았습니다. ");
          break;
        }else{
          count++;
        }
      }
      return count;
    }

    final int myRank = Myrank_calc() ?? 1;

    return StreamBuilder<List<Person>>(
      stream: DatabaseService(uid:'').member_info,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return Column(
            children: <Widget>[
              Text(
                '나의 순위',
                style : TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/${member_info[myRank-1].avatar_choose()}.png'),
                  radius: 50.0,
                  backgroundColor: Colors.blueGrey,
                ),
              ),

              Text(
                '${myRank} 위',
                style : TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),

              Text(
                '나의 점수 ${member_info[myRank-1].score} 점',
                style : TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ],
          );
        }else{
          return Loading();
        }
      }
    );
  }
}
