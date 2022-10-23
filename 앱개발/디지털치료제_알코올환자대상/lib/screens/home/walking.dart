import 'package:alcohol_project/models/user.dart';
import 'package:alcohol_project/service/database.dart';
import 'package:alcohol_project/shared/loading.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pedometer/pedometer.dart';
import 'package:provider/provider.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}


class walking extends StatefulWidget {
  const walking({Key? key}) : super(key: key);

  @override
  _walkingState createState() => _walkingState();
}

class _walkingState extends State<walking> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '0', _steps = '0';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();

    });
  }


  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = '보행자 사용 X';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = '0';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    void step_choose(member_UserData user, String step_string){
      int step = int.parse(step_string);

      if(step== 5000){
        DatabaseService(uid : user.uid).member_updateUserStepsScore(user.score,5);
      }else if(step == 10000){
        DatabaseService(uid : user.uid).member_updateUserStepsScore(user.score,10);
      }else if(step == 15000){
        DatabaseService(uid : user.uid).member_updateUserStepsScore(user.score,15);
      }else if(step == 20000){
        DatabaseService(uid : user.uid).member_updateUserStepsScore(user.score,20);
      }

    }


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<member_UserData>(
        stream: DatabaseService(uid: user.uid).member_userData,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            DatabaseService(uid : user.uid).member_updateUserSteps(_steps);
            step_choose(snapshot.data!,_steps);

            return Scaffold(
              backgroundColor: Colors.lightBlue[600],
              body: Center(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    Text(
                      '오늘 걸은 횟수',
                      style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                    Text(
                      '${snapshot.data!.steps} 걸음',
                      //_steps,
                      style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          }else{
            return Loading();
          }
        }
      ),
    );
  }
}
