import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Mainpage(),
  ));
}

class Mainpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Column(
      children: [
        Container(
          color: Colors.blueAccent,
          height:MediaQuery.of(context).size.height/2,
          width:double.infinity,
          child: Center(
            child: MaterialButton(
            color: Colors.white,
            shape: CircleBorder(),
            height:150,
            minWidth: 150,
            onPressed:(){
              Navigator.push(context,MaterialPageRoute(builder: (context) => Gamepage()));
            },
            child: Text("Start"),
             ),
          )
        ),
        Container(
          color: Colors.redAccent,
          height: MediaQuery.of(context).size.height/2,
          width: double.infinity,
          child: Center(
            child: MaterialButton(
            color:Colors.white,
            shape: CircleBorder(),
            height: 150,
            minWidth:150,
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=> Gamepage()));
            },
            child: Text("Start"),
            ),
          )
        )
      ],
    )
   );
  }
}

class Gamepage extends StatefulWidget{
  @override
  State<Gamepage> createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {

  double bluecardheight=0;
  double redcardheight=0;
  int PlayerAScore=0;
  int PlayerBScore=0;
  
  bool initialized=false;
  @override
  Widget build(BuildContext context) {

    if(initialized==false){
      bluecardheight=MediaQuery.of(context).size.height/2;
      redcardheight=MediaQuery.of(context).size.height/2;

      initialized=true;
    }
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              print(bluecardheight);
              setState(() {
                bluecardheight=bluecardheight+30;
                redcardheight=redcardheight-30;
                PlayerBScore=PlayerBScore+5;
              });

              double WinningHeight=MediaQuery.of(context).size.height-60;

              print(bluecardheight);
              print(WinningHeight);
              if(bluecardheight>WinningHeight){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> Resultpage(PlayerBScore,"B")));
              }


            },
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.blueAccent,
              height:bluecardheight,
              width: double.infinity,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(child: 
                  Text("Player B",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                  Text(PlayerBScore.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                redcardheight=redcardheight+30;
                bluecardheight=bluecardheight-30;
                PlayerAScore=PlayerAScore+5;
              });

              double ScreenHeight=MediaQuery.of(context).size.height;
              double WinningHeight=MediaQuery.of(context).size.height-30;

              print(redcardheight);
              print(WinningHeight);

              if(redcardheight>WinningHeight){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Resultpage(PlayerAScore,"A")));
              }

            },
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.redAccent,
              height:redcardheight,
              width:double.infinity,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child:Text("Player A",
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                    Text(PlayerAScore.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ],),
            ),
          )
        ],
      ),
    );
  }
}


class Resultpage extends StatelessWidget{
  
  int score=0;
  String player="";

  Resultpage(this.score,this.player);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: player=="A"?Colors.redAccent:Colors.blueAccent,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(score.toString(),style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
            Text(player=="A"?"Player A Won":"Player B Won",style: TextStyle(fontSize: 35,),),
            MaterialButton(
            onPressed: (){
              Navigator.pop(context);
              Navigator.pop(context);
            } ,
            color: Colors.white,
            child: Text("Restart Game"),
            )
          ],
        ),
      )
    );
  }
}