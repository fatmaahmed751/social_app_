import 'package:flutter/material.dart';
import 'package:social_app/presentation/screens/social_layout.dart';

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
 bool isLast=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
        ],
      ),
      body: PageView.builder(
        onPageChanged: (int index){
          if(index==1){
            setState(() {
              isLast=true;


          });
          }
        },
        controller: boardController,
        itemBuilder: (context, index) => buildItem(),
        itemCount: 1,
        //controller: boardController,
      ),
    );
  }

  Widget buildItem() =>
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                image: AssetImage(
                  'assets/images/on.jpg',
                ),
                height: 400,
              ),
            ),

            //SizedBox(height: 10.0,),

            Center(
              child: Text(
                'Communicate With World',
                textAlign: TextAlign.center,

                style: TextStyle(color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w300,
                    fontSize: 20
                ),
              ),
            ),
            SizedBox(height: 34.0,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        if(isLast=true) {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=> SocialLayout()),
                            (Route<dynamic>route)=>false,
                            );
                        }
                        boardController.nextPage(
                            duration: Duration(
                              microseconds: 700,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn);

                      },
                      child: Icon(Icons.arrow_forward_ios_rounded,
                      ),
                      backgroundColor: Colors.orange[400],
                      mini: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}