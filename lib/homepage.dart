import 'package:flutter/material.dart';
import 'package:insurence_app/cardlist.dart';
import 'package:insurence_app/details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int _currentIndex = 0;
PageController _pageController;

 @override
  void initState() {
    _pageController = PageController(
        initialPage: _currentIndex,
        viewportFraction: 0.90,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:<Widget>[
              Text("Bank Cards",style: 
              TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(width: 50,),
              CircleAvatar(backgroundImage: NetworkImage("https://www.clipartmax.com/png/full/257-2572603_user-man-social-avatar-profile-icon-man-avatar-in-circle.png"),),
            ],),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Text("Balance",style: 
              TextStyle(
                color: Colors.white54,
                fontSize: 17.5
              ),),
            ),
            SizedBox(height: 10,),
             Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Text(cards[_currentIndex].balance,style: 
              TextStyle(
                fontSize: 20
              ),),
            ),
            SizedBox(height: 50,),
            Flexible(
              fit: FlexFit.tight,
                child: InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(_currentIndex)));
                  } ,
                  child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cards.length,
                    controller: _pageController,
                    onPageChanged: (int currentIndex){
                      setState(() {
                        _currentIndex = currentIndex;
                      });
                    },
                    itemBuilder: (context,index){
                      return Hero(
                        tag: "card$index",
                        child: Material(
                        type: MaterialType.transparency,
                          child: Container(
                          padding: EdgeInsets.all(16),
                                margin: EdgeInsets.only(right: 32),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                    colors: [
                                      cards[index].colors[0],
                                      cards[index].colors[1],
                                      cards[index].colors[2],
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    stops: [0.2, 0.5, 1.0],
                                    tileMode: TileMode.clamp,
                                  ),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    // topLeft wifi icon
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Icon(
                                        Icons.wifi,
                                        size: 40.0,
                                        color: Colors.white,
                                      ),
                                    ),

                                    // topRight VISA text
                                    cards[index].cardName == "Visa"?
                                    Positioned(
                                        top: 20.0,
                                        right: -25.0,
                                        child: Transform.rotate(
                                        angle: -1.56,
                                        child: Text("Visa".toUpperCase(),
                                          style: TextStyle(
                                            fontSize: 36.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      )) :
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        height: 64.0,
                                        width: 40.0,
                                        child: Image.network("https://pluspng.com/img-png/mastercard-hd-png-other-resolutions-320-239-pixels-pluspng-com-mastercard-png-640.png",),
                                      ),
                                    ),

                               
                                    Positioned(
                                      left: -20.0,
                                      bottom: 40.0,
                                      child: Transform.rotate(
                                        angle: -1.56,
                                        child: Text("Credit Card",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // bottomCenter image : sim card
                                    Positioned(
                                      left: 80.0,
                                      bottom: 0,
                                      height: 100.0,
                                      width: 100.0,
                                      child: Transform.rotate(
                                          angle: -1.56,
                                          child: Image.network(
                                                "https://img.icons8.com/plasticine/2x/sim-card-chip.png"),
                                      ),
                                    ),

                                    // bottomRight text: account
                                    Positioned(
                                      right: -80.0,
                                      bottom: 80.0,
                                      child: Transform.rotate(
                                        angle: -1.56,
                                        child: Text("**** **** **** ****",
                                          style: TextStyle(
                                            fontSize: 24.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                                              ),
                      );
                    },
                  ),
              ),
                ),
            ),
     
          ]
        ),
      ),
    );
  }
}