import 'package:alcohol_project/models/Person.dart';
import 'package:flutter/material.dart';

class PersonTile extends StatelessWidget {

  final Person person;
  PersonTile({ required this.person });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Card(
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: ListTile(
            dense: true,
            leading: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.brown[person.score],
              backgroundImage: AssetImage('assets/${person.avatar_choose()}.png'),
            ),
            title: Text(
              person.name,
              style : TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              '점수 : ${person.score} 점',
              style : TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}