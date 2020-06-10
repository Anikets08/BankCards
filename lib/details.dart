import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insurence_app/cardlist.dart';

class Details extends StatefulWidget {
  final int index;
  Details(this.index);
  
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children:<Widget>[
            SizedBox(height: 80,),
            Center(child: Text("Full Card Details",style: TextStyle(fontSize: 22.5,fontWeight: FontWeight.bold),)),
            SizedBox(height: 20,),
             Center(child: Text("Tap on the card to view security code",style: TextStyle(fontSize: 18.5,color: Colors.white54),)),
             SizedBox(height: 20,),
             Hero(
               tag: "card$index",
                            child: Material(
                              type: MaterialType.transparency,
                              child: InkWell(
                                    onTap: (){
                                      Fluttertoast.showToast(
                                      msg: cards[index].cvv,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.transparent,
                                      textColor: Colors.white,
                                      fontSize: 16.0
    );
                                    },
                                    child: Container(height: 200,
                                    width: 360,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      gradient: LinearGradient(
                                        colors: [
                                          cards[widget.index].colors[0],
                                          cards[widget.index].colors[1],
                                          cards[widget.index].colors[2],
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.2, 0.5, 1.0],
                                        tileMode: TileMode.clamp,
                                      ),
                                    ),child: Stack(children:<Widget>[
                                      Column(
                                        children: [
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                             Positioned(
                                              top: 10,
                                              left: 10,
                                              child: Icon(
                                                Icons.wifi,
                                                size: 30.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                           SizedBox(width: 100,),
                                            Image.network("https://pngimg.com/uploads/visa/visa_PNG4.png",color: Colors.white,height: 50,width: 50,),
                                          ],),
                                          SizedBox(height: 60,),
                                          Text(cards[index].realnum,
                                          style: TextStyle(
                                            fontSize: 24.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        ],
                                      ),
                                     
                                    ]),),
                              ),
                            ),
             ),
          ],
        ),
      ),
    );
  }
}