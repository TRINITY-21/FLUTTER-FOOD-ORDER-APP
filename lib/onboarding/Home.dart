import 'dart:io';
import 'package:ange/onboarding/model/data.dart';
import 'package:ange/ui/registration/signUp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController _controller = new PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
          decoration:BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomRight:Radius.circular(300), topLeft: Radius.circular(100))
        ),
        child: PageView.builder(
          itemCount: slides.length,
          controller: _controller,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemBuilder: (context, i) {
            SliderModel slide = slides[i];
            return SliderTile(
              description: slide.getDescription,
              title: slide.getTitle,
              imgPath: slide.getImgPath,
            );
          },
        ),
      ),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              height: Platform.isIOS ? 30 : 50,
              padding: EdgeInsets.symmetric(horizontal: 12),
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _controller.animateToPage(slides.length - 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.bounceIn);
                      },
                      child: Text("Skip"),
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < slides.length; i++)
                          currentIndex == i
                              ? pageIndexIndicator(true)
                              : pageIndexIndicator(false),
                      ],
                    ),
                    GestureDetector(
                       onTap: () {
                        _controller.animateToPage(currentIndex + 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.slowMiddle);
                      },
                      child: Text("Next"),
                    ),
                  ]),
            )
          : InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(topLeft:Radius.circular(34)),
                   //color:Colors.teal,
                ),
                alignment: Alignment.center,
                height: Platform.isIOS ? 30 : 50,
                width: MediaQuery.of(context).size.width,
               
                child: Text(
                  "Get Started",
                  softWrap: true,
                  style: TextStyle(color:  Color(0xFFFE7D6A), fontSize: 23),
                ),
              ),
            ),
         );
       }
}

// ignore: must_be_immutable
class SliderTile extends StatelessWidget {
  String imgPath;
  String title;
  String description;

  SliderTile(
      {@required this.description,
      @required this.imgPath,
      @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imgPath),
              SizedBox(height: 10),
              Text(title, ),
              SizedBox(height: 10),
              Text(description,
               style: GoogleFonts.notoSans(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 27.0,
                                        textStyle: TextStyle(color: Colors.black)),),
            ],
          ),
        ),
      ),
    );
  }
}

Widget pageIndexIndicator(bool isCurrentPage) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 2.0),
    height: isCurrentPage ? 10 : 6,
    width: isCurrentPage ? 10 : 6,
    decoration: BoxDecoration(
      color: isCurrentPage ?  Color(0xFFFE7D6A): Colors.blueGrey,
      borderRadius: BorderRadius.only(topLeft:Radius.circular(34)),
    ),
  );
}
