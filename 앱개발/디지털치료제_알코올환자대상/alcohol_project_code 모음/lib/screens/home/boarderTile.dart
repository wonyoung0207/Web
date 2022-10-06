import 'package:alcohol_project/models/Board.dart';
import 'package:flutter/material.dart';

class BoarderTile extends StatelessWidget {

  final Board board;
  BoarderTile({ required this.board });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top : 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(

            radius: 25.0,
            backgroundImage: AssetImage('assets/${board.avatar_choose()}.png'),
          ),

          title: Text(
            '${board.title}',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '${board.text}\n${board.date}',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),

        ),
      ),
    );
  }
}
