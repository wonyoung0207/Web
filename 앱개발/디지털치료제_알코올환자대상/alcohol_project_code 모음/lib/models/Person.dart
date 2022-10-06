class Person {
  late final String name;
  late final String drink;
  late final int score;
  late final String uid;
  late final String steps;
  late final String startday;

  Person(
      {required this.name, required this.drink, required this.score, required this.uid, required this.steps, required this.startday});

  int avatar_choose() {
    if(score < 100){
      return 1;
    }else if(score >= 100 && score < 200){
      return 2;
    }else if(score >= 200 && score < 300){
      return 3;
    }else if(score >= 300 && score < 400){
      return 4;
    }else if(score >= 400 && score < 500){
      return 5;
    }else if(score >= 500 && score < 600){
      return 6;
    }else if(score >= 600 && score < 700){
      return 7;
    }else if(score >= 700 && score < 800){
      return 8;
    }else{
      return 9;
    }

  }

}