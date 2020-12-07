import 'dart:convert';
import 'package:ange/api/cartModel.dart';
import 'package:ange/api/foodModel.dart';
import 'package:ange/api/listModel.dart';
import 'package:ange/api/registerModel.dart';
import 'package:ange/ui/cart.dart';
import 'package:ange/ui/networkHandler/network_handler.dart';
import 'package:ange/ui/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  final String imgPath;
  final String pricePerItem;
  final String foodName;
  final String heroTag;
  final String fid;

  DetailsPage(
      {this.foodName, this.heroTag, this.imgPath, this.fid, this.pricePerItem});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var netPrice = 1;
  var quantity = 1;
  int number = 0;
  bool subscribedFood = false;

  RegistersModel registersModel = RegistersModel();
  void getCurrentUser() async {
    final currentUser = await networkHandler.get('/api/users/auth');

    setState(() {
      registersModel = RegistersModel.fromJson(currentUser);
      isLoaded = true;
      print(registersModel.id);
      print(registersModel.name);
    });
  }

  bool isLoaded = false;

  NetworkHandler networkHandler = NetworkHandler();
  FoodModel foodModel = FoodModel();
  ListModel fmodel = ListModel();
  CartModel cartModel = CartModel();
  int cartNums = 0;

  recommendedFoods() async {
    final food = await networkHandler.get('/api/book/books');

    setState(() {
      fmodel = ListModel.fromJson(food);
      isLoaded = true;
      print(fmodel.book);
    });
  }

  cartNum() async {
    cartModel = CartModel(onlineUser: registersModel.id);

    final res = await networkHandler.post(
        '/api/cart/cartNum', json.encode(cartModel.toJson()));

    var cartNumber = json.decode(res.body);

    if (cartNumber['success']) {
      print(cartNumber);
      setState(() {
        cartModel = CartModel.fromJson(cartNumber);
        cartNums = cartModel.cartNum;
        print(cartNums);
      });
    }
  }

  addToCart() async {
    cartModel = CartModel(
      onlineUser: registersModel.id,
      books: widget.fid,
    );

    final cart = await networkHandler.post(
        '/api/cart/saveCart', json.encode(cartModel.toJson()));

     var output = json.decode(cart.body);

    if (output['success']) {
      setState(() {
        isLoaded = true;

        cartNum();
      });
    }
  }

  Future changeSubscribeNum() async {
    cartModel = CartModel(movieId: widget.fid);
    var subNum = await networkHandler.post(
        '/api/favorite/favoriteNumber', json.encode(cartModel.toJson()));

    var res = json.decode(subNum.body);
    // print(res);

    setState(() {
      cartModel = CartModel.fromJson(res);
      number = cartModel.subscribeNumber;
    });

    print(cartModel.subscribeNumber);

    //// subscribed
    if (isLoaded) {
      cartModel = CartModel(movieId: widget.fid, userFrom: registersModel.id);
      var subscribed = await networkHandler.post(
          '/api/favorite/favorited', json.encode(cartModel.toJson()));

      var sub = json.decode(subscribed.body);
      // print(sub);

      setState(() {
        cartModel = CartModel.fromJson(sub);
        subscribedFood = cartModel.subcribed;

        //isLoaded = true;
      });

       print('subi${cartModel.subcribed}');
    }
  }

  favoriteFoods() async {
    if (subscribedFood) {
      cartModel = CartModel(
        userFrom: registersModel.id,
        movieId: widget.fid,
      );

      final fav = await networkHandler.post(
          '/api/favorite/removeFromFavorite', json.encode(cartModel.toJson()));
      var res = json.decode(fav.body);
      print(res);

      if (res['success']) {
        setState(() {
          // cartModel = CartModel.fromJson(res);
          subscribedFood = !subscribedFood;
        });
      } else {
        print('unable to favorite');
      }

      // print(res);
    } else {
      cartModel = CartModel(
        userFrom: registersModel.id,
        movieId: widget.fid,
      );
      final fav = await networkHandler.post(
          '/api/favorite/addToFavorite', json.encode(cartModel.toJson()));

      var res = json.decode(fav.body);
      // print(res);

      if (res['success']) {
        setState(() {
          // cartModel = CartModel.fromJson(res);
          subscribedFood = !subscribedFood;
        });
      } else {
        print('unable to favorite');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    // addToFav();
    changeSubscribeNum();
    recommendedFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.heroTag != null
          ? ListView(
              children: [
                Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UserProfilePage()));
                          },
                          child: Icon(Icons.menu, color: Colors.black),
                        ),
                        
                        Stack(
                          children: [
                            Container(
                              height: 45.0,
                              width: 45.0,
                              color: Colors.transparent,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Cart()));
                              },
                              child: Container(
                                  height: 45.0,
                                  width: 45.0,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFFE7D6A)
                                              .withOpacity(0.3),
                                          blurRadius: 6.0,
                                          spreadRadius: 4.0,
                                          offset: Offset(0.0, 4.0),
                                        ),
                                      ],
                                      color: Color(0xFFFE7D6A),
                                      shape: BoxShape.circle),
                                  child: Center(
                                      child: Icon(Icons.shopping_cart,
                                          color: Colors.white))),
                            ),
                            Positioned(
                                top: 1.0,
                                right: 4.0,
                                child: Container(
                                    height: 15.0,
                                    width: 15.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: Center(
                                        child: Text(
                                      cartNums.toString(),
                                      style: GoogleFonts.notoSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 7.0,
                                          textStyle:
                                              TextStyle(color: Colors.red)),
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
                        fontWeight: FontWeight.w800,
                        color: Colors.red,
                        fontSize: 27),
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
                              image: AssetImage('assets/18.jpg'),
                              // fit: BoxFit.cover,
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
                                    child: InkWell(
                                        onTap: () {
                                          favoriteFoods();
                                        },
                                        child:
                                           Icon(
                                                Icons.favorite,
                                                color: subscribedFood ? Color(0xFFEE3705) :Color(0xFFCACACA) ,
                                                size: 25.0,
                                              
                                            
                                              )))),
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
                              (int.parse(widget.pricePerItem) * quantity)
                                  .toString(),
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
                                  icon: Icon(Icons.remove,
                                      color: Color(0xFFFE7D6A)),
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
                                  icon:
                                      Icon(Icons.add, color: Color(0xFFFE7D6A)),
                                  onPressed: () {
                                    adjustQuantity("PLUS");
                                  },
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              addToCart();
                            },
                            child: Text(
                              "Add to Bucket",
                              style: GoogleFonts.notoSans(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0),
                            ),
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
                                              heroTag: _food.id)));
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
                                            tag: _food.price,
                                            child: Container(
                                                height: 75.0,
                                                width: 75.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Center(
                                                    child: Image.asset(
                                                        'assets/18.jpg')))),
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
                      }),
                ),

                // )
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

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
