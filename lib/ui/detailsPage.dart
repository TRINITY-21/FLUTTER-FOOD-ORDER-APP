import 'package:ange/api/foodModel.dart';
import 'package:ange/api/listModel.dart';
import 'package:ange/ui/networkHandler/network_handler.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  final String imgPath;
  final String pricePerItem;
  final String foodName;
  final String heroTag;

  DetailsPage({this.foodName, this.heroTag, this.imgPath, this.pricePerItem});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var netPrice = 1;
  var quantity = 1;


bool isLoaded = false;

  NetworkHandler networkHandler = NetworkHandler();
  FoodModel foodModel = FoodModel();
  ListModel fmodel = ListModel();

  recommendedFoods() async {
    final food = await networkHandler.get('/api/book/books');

    setState(() {
      fmodel = ListModel.fromJson(food);
      isLoaded = true;
      print(fmodel.book);
    });
  }

  @override
  void initState() {
    super.initState();
    recommendedFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.heroTag != null? ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: Colors.black),
                  Stack(
                    children: [
                      Container(
                        height: 45.0,
                        width: 45.0,
                        color: Colors.transparent,
                      ),
                      Container(
                          height: 45.0,
                          width: 45.0,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.3),
                              blurRadius: 6.0,
                              spreadRadius: 4.0,
                              offset: Offset(0.0, 4.0),
                            ),
                          ], color: Color(0xFFFE7D6A), shape: BoxShape.circle),
                          child: Center(
                              child: Icon(Icons.shopping_cart,
                                  color: Colors.white))),
                      Positioned(
                          top: 1.0,
                          right: 4.0,
                          child: Container(
                              height: 12.0,
                              width: 12.0,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Center(
                                  child: Text(
                                '1',
                                style: GoogleFonts.notoSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 7.0,
                                    textStyle: TextStyle(color: Colors.red)),
                              )))),
                    ],
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "Buy",
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, color:Colors.red,fontSize: 27),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              widget.foodName,
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, fontSize: 27),
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                  tag: widget.heroTag,
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkHandler().getImage(widget.imgPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              SizedBox(width: 15.0),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.3),
                              blurRadius: 6.0,
                              spreadRadius: 4.0,
                              offset: Offset(5.0, 11.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Icon(
                            Icons.favorite_border,
                            color: Color(0xFFFE7D6A),
                            size: 25.0,
                          ))),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.3),
                              blurRadius: 6.0,
                              spreadRadius: 4.0,
                              offset: Offset(5.0, 11.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Icon(
                            Icons.restore,
                            color: Color(0xFFFE7D6A),
                            size: 25.0,
                          ))),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50.0,
                width: 125.0,
                color: Colors.white,
                child: Center(
                  child: Text(
                    '\GHC' +
                        (int.parse(widget.pricePerItem) * quantity).toString(),
                    style: GoogleFonts.notoSans(
                        color: Color(0xFF5E6166),
                        fontWeight: FontWeight.w500,
                        fontSize: 30.0),
                  ),
                ),
              ),
              Container(
                height: 50.0,
                width: 225.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFE7D6A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 105,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            iconSize: 17.0,
                            icon: Icon(Icons.remove, color: Color(0xFFFE7D6A)),
                            onPressed: () {
                              adjustQuantity("MINUS");
                            },
                          ),
                          Text(
                            quantity.toString(),
                            style: GoogleFonts.notoSans(
                                color: Color(0xFFFE7D6A),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0),
                          ),
                          IconButton(
                            iconSize: 17.0,
                            icon: Icon(Icons.add, color: Color(0xFFFE7D6A)),
                            onPressed: () {
                              adjustQuantity("PLUS");
                            },
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Add to Bucket",
                      style: GoogleFonts.notoSans(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "FEATURED",
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          // Container(
          //     height: 225,
          //     width: MediaQuery.of(context).size.width,
              // child: ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: [
              //     _buildListItem('1'),
              //     _buildListItem('2'),
              //   ],
              // ))


               Container(
                       height: 150,
              width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fmodel.book.length,
                      itemBuilder: (BuildContext context, index) {
                        FoodModel _food = fmodel.book[index];
                        return Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                              imgPath: _food.filePath,
                                              foodName: _food.title,
                                              pricePerItem:
                                                  _food.price.toString(),
                                              heroTag: _food.title)));
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
                                      color: Color(0xFFF588D1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Hero(
                                          tag: _food.title,
                                          child: Container(
                                              height: 75.0,
                                              width: 75.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                  child: CircleAvatar(
                                                      backgroundImage:networkHandler.getImage(_food.filePath)
                                              )))),
                                        
                                        SizedBox(height: 15.0),
                                        Text(
                                          _food.title,
                                          style: GoogleFonts.notoSans(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 17,
                                            color: Color(0xFF075046),
                                          ),
                                        ),
                                        Text(
                                          '\GHC' + _food.price.toString(),
                                          style: GoogleFonts.notoSans(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 12,
                                            color: Color(0xFFC70F0F),
                                          ),
                                        ),
                                      ],
                                    ))));
                      }

                      //  children: [
                      //   _buildListItem('Hamburg', 'assets/19.jpg', '21',
                      //       Color(0xFFC6E7FE), Color(0xFF04243B)),
                      //   _buildListItem('Chips', 'assets/21.png', '30', Color(0xFFDCE964),
                      //       Color(0xFF6A8CAA)),
                      //   _buildListItem('Donuts', 'assets/20.png', '10', Color(0xFFD7FADA),
                      //       Color(0xFF56CC7E)),
                      //  _buildListItem('Pear', 'assets/19.jpg', '10', Color(0xFFADFF4F),
                      //       Color(0xFF4DD82A)),
                      //   _buildListItem('Burger', 'assets/17.jpg', '100', Color(0xFFF3E787),
                      //       Color(0xFFD3BD86)),

                      // ],
                      ),
                ),

          // )
        ],
      ) : Center(child: CircularProgressIndicator()),
    );
  }

  // _buildListItem(String columnNumber) {
  //   return Padding(
  //       padding: EdgeInsets.all(15.0),
  //       child: Column(
  //         children: [
  //           if (columnNumber == '1')
  //             _buildColumnItem(
  //                 'assets/20.png', 'Sweet Pastries', '110', Color(0xFF8E9AC7)),
  //           if (columnNumber == '1')
  //           SizedBox(height: 10.0),
  //           if (columnNumber == '1')
  //             _buildColumnItem(
  //                 'assets/20.png', 'Sweet Pastries', '50', Color(0xFFF588D1)),
  //           if (columnNumber == '2')
  //             _buildColumnItem(
  //                 'assets/20.png', 'Sweet Pastries', '30', Color(0xFF92D2F0)),
            
  //           if (columnNumber == '2')
  //           SizedBox(height: 10.0),
             
                  
  //           if (columnNumber == '2')
  //             _buildColumnItem(
  //                 'assets/20.png', 'Sweet Pastries', '48', Color(0xFF9FE9BA)),
  //         ],
  //       ));
  // }

  // _buildColumnItem(
  //     String imgPath, String foodName, String price, Color bgColor) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Container(
  //         width: 210.0,
  //         child:Row(
  //           children: [
  //             Container(
  //               height: 75,
  //               width:75,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(7.0),
  //                 color:bgColor,

  //               ),
  //               child: Center(
  //                 child:Image.asset(imgPath, height:50.0,width:50.0)
  //               )

  //             ),
  //             SizedBox(width:20.0),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   foodName,
  //                    style: GoogleFonts.notoSans(
  //                       fontWeight: FontWeight.w400,
  //                       fontSize: 14,
                       
  //                     ),
  //                 ),

  //                     Text(
  //                     '\GHC' + price,
  //                     style: GoogleFonts.lato(
  //                       fontWeight: FontWeight.w600,
  //                       fontSize: 15,
  //                       color: Color(0xFFF68D7F),
  //                     ),
  //                   ),
  //               ],
  //             ),

  //           ],
  //         )

  //       )
  //     ],
  //   );
  // }

  adjustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;

      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });

        return;
    }
  }
}
