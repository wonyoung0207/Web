import 'package:alcohol_project/models/Person.dart';
import 'package:alcohol_project/models/user.dart';
import 'package:alcohol_project/screens/home/person_tile.dart';
import 'package:alcohol_project/service/database.dart';
import 'package:alcohol_project/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonList extends StatefulWidget {
  const PersonList({Key? key}) : super(key: key);

  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  @override
  Widget build(BuildContext context) {
    final member_info = Provider.of<List<Person>>(context); //home.dart 에서 streamProvider로 Person<List> 형식으로 데이터 가져옴
    final user = Provider.of<MyUser>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,//Top3 의 정보만 출력함
      itemBuilder: (context, index) {
        if(member_info.isEmpty){
          return Loading();
        }else{
          return PersonTile(person: member_info[index]);
        }
      },
    );
  }
}

