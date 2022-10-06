class Board{

  late final String date;
  late final String name;
  late final String uid;
  late final String text;
  late final String title;
  late final int score;



  Board({required this.name, required this.date,required this.uid,required this.text,required this.title,required this.score});

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