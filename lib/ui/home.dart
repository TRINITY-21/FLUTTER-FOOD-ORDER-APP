import 'package:ange/ui/detailsPage.dart';
import 'package:ange/ui/foodTabs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(1),
      body: Container(
        height: MediaQuery.of(context).size.height,
        
        decoration:BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomRight:Radius.circular(0), topLeft: Radius.circular(150))
        ),
        child: ListView(children: [
          Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: Colors.black),
                  Container(
                    height: 40.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: Offset(0.0, 3.0),
                          ),
                        ],
                        color: Color(0xFFC6E7FE),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/man-156584__340.webp'),
                            fit: BoxFit.contain)),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "SEARCH FOR",
              style:
                  GoogleFonts.notoSans(fontWeight: FontWeight.w800, fontSize: 27),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "RECIPES",
              style:
                  GoogleFonts.notoSans(fontWeight: FontWeight.w800, fontSize: 27),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                 boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: Offset(0.0, 1.0),
                          ),
                        ],
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search Recipes",
                  hintStyle: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w300, fontSize: 14),
                  prefixIcon:
                      Icon(Icons.search, color: Colors.grey.withOpacity(0.5)),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "Recommended",
              style:
                  GoogleFonts.notoSans(fontWeight: FontWeight.w400, fontSize: 18),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
              height: 150.0,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                _buildListItem('Hamburg', 'assets/19.jpg', '21',
                    Color(0xFFC6E7FE), Color(0xFF04243B)),
                _buildListItem('Chips', 'assets/21.png', '30', Color(0xFFDCE964),
                    Color(0xFF6A8CAA)),
                _buildListItem('Donuts', 'assets/20.png', '10', Color(0xFFD7FADA),
                    Color(0xFF56CC7E)),
               _buildListItem('Pear', 'assets/19.jpg', '10', Color(0xFFADFF4F),
                    Color(0xFF4DD82A)), 
                _buildListItem('Burger', 'assets/17.jpg', '100', Color(0xFFF3E787),
                    Color(0xFFD3BD86)),
              ],),
              ),

               //SizedBox(height: 10.0,),
               Padding(
                 padding: EdgeInsets.only(left:15),
                 child: TabBar(
                   controller: _controller,
                   isScrollable: true,
                   indicatorColor: Colors.transparent,
                   labelColor: Colors.black,
                   unselectedLabelColor: Colors.grey.withOpacity(0.5),
                   labelStyle: GoogleFonts.notoSans(
                     fontSize:16.0, fontWeight: FontWeight.w700,  
                   ),
                   unselectedLabelStyle: GoogleFonts.notoSans(
                     fontSize:12.0, fontWeight: FontWeight.w500,  
                   ),
                   tabs: [
                     Tab(
                       child: Text("FEATURED"),),
                      Tab(
                       child: Text("COMBO"),),
                      Tab(
                       child: Text("FAVORITES"),),
                      Tab(
                       child: Text("RECOMMENDED"),),
                   ],
                 )
               ),
            Container(
              height: MediaQuery.of(context).size.height - 450,
              child: TabBarView(
                controller:_controller,
                children: [
                  FoodTab(),
                  FoodTab(),
                  FoodTab(),
                  FoodTab(),
                ],
              )
            ),

        ]),
      ),
    );
  }

  _buildListItem(String foodName, String imgPath, String price, Color bgColor,
      Color textColor) {
    return Padding(
        padding: EdgeInsets.only(left: 15),
        child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DetailsPage(
                  imgPath: imgPath,
                  foodName : foodName,
                  pricePerItem : price,
                  heroTag: foodName
                )
                  
                   ));

            },
            child: Container(
                height: 130.0,
                width: 130.0,
                decoration: BoxDecoration(
                   boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6.0,
                          spreadRadius: 4.0,
                          offset: Offset(0.0, 3.0),
                        ),
                      ],
                  color: bgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: foodName,
                      child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: Image.asset(imgPath,
                                  height: 50.0, width: 150.0))),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      foodName,
                      style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                        color: textColor,
                      ),
                    ),
                    Text(
                      '\GHC' + price,
                      style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                        color: textColor,
                      ),
                    ),

                   

                  ],
                ))));
  }
}
