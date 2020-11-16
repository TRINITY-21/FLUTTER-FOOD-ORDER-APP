import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodTab extends StatefulWidget {
  FoodTab({Key key}) : super(key: key);

  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        _buildListItem("Delicious ", 4.0, '4', "assets/20.png"),
        _buildListItem("Hot Pastries ", 4.0, '4', "assets/20.png"),
      ],
    ));
  }

  _buildListItem(String foodName, rating, String price, String imgPath) {
    return Container(
      decoration:BoxDecoration(
          //color: Colors.teal.withOpacity(1),
          borderRadius: BorderRadius.only(bottomRight:Radius.circular(500), topLeft: Radius.circular(150))
        ),
      child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Container(
              width:200.0,
                 child: Row(
                  children:[
                    Container(
                      width:75.0,
                      height:75.0,
                      decoration: BoxDecoration(
                         boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: Offset(0.0, 3.0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(7),
                        color:Color(0xFFFFE3DF),
                      ),
                      child:Center(
                        child: Image.asset(imgPath, height:50.0, width:50.0),)
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                      foodName,
                       style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                         
                        ),

                        ),
                        SmoothStarRating(
                          allowHalfRating: false,
                          starCount: rating.toInt(),
                          onRated:(value){

                          },
                          rating: rating,
                          color:Color(0xFFFFD143),
                          borderColor: Color(0xFFFFD143),
                          size: 15.0,
                          spacing: 0.0,
                          
                        ),

                        Row(
                          children: [
                      Text(
                        '\GHC' + price,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Color(0xFFF68D7F),
                        ),
                      ),

                      SizedBox(width: 3.0),
                      
                      Text(
                        '\GHC' + '18',
                        style: GoogleFonts.lato(
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                      
  
                          ],
                        )
                      ],
                    )
                  ]
              ),
               ),

               FloatingActionButton(
                 onPressed: (){},
                 heroTag: foodName,
                 mini:true,
                 child: Center(
                   child: Icon(Icons.add, color:Colors.white)
                 ),
                 backgroundColor: Color(0xFFFE7D6A),
                 ),
                 
            ],
          )),
    );
  }
}
