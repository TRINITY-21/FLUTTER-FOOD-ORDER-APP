import 'dart:convert';
import 'package:ange/api/cartItems.dart';
import 'package:ange/api/cartModel.dart';
import 'package:ange/api/foodModel.dart';
import 'package:ange/api/registerModel.dart';
import 'package:ange/ui/networkHandler/network_handler.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Favorite extends StatefulWidget {
  // final String cid;

  // Favorite({this.cid});

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite>
    with SingleTickerProviderStateMixin {

  bool isLoaded = false;
  NetworkHandler networkHandler = NetworkHandler();
  CartModel fmodel = CartModel();
  RegistersModel registersModel = RegistersModel();
  FoodModel foodModel = FoodModel();


  void getCurrentUser() async {
    final currentUser = await networkHandler.get('/api/users/auth');

    setState(() {
      registersModel = RegistersModel.fromJson(currentUser);
      isLoaded = true;
    });

    if(registersModel.id != null){

        
  // recommendedFoods() async {
    final food = await networkHandler
        .get('/api/favorite/getFavoredMovie/${registersModel.id}');

    setState(() {
      fmodel = CartModel.fromJson(food);
      isLoaded = true;
      print('${fmodel.doc}');
    });

    print('regi${registersModel.id}');
  }
    }
     
  // }

  removeItem(String _id) async {
    fmodel = CartModel(
      userFrom: registersModel.id,
      movieId: _id
    );

    final fav = await networkHandler.post(
        '/api/favorite/removeFromFavorite', json.encode(fmodel.toJson()));
    var res = json.decode(fav.body);
    print(res);

    if (res['success']) {
      setState(() {
        // cartModel = CartModel.fromJson(res);
        // subscribedFood = !subscribedFood;
        getCurrentUser();
      });
    } else {
      print('unable to favorite');
    }
  }

  @override
  void initState() {
    super.initState();
    // recommendedFoods();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("favorite Items"),
        ),
        body: isLoaded == true
            ? ListView.builder(
                itemCount: fmodel.doc.length,
                itemBuilder: (buildContext, index) {
                  CartItems food = fmodel.doc[index];

                  return Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFF7EDEC),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(500),
                            topLeft: Radius.circular(150))),
                    child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 200.0,
                              child: Row(children: [
                                Container(
                                    width: 75.0,
                                    height: 75.0,
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
                                      color: Color(0xFFFFE3DF),
                                    ),
                                    child: Center(
                                      child: Image.asset('assets/18.jpg',
                                          height: 50.0, width: 50.0),
                                    )),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      food.movieId.title,
                                      style: GoogleFonts.notoSans(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SmoothStarRating(
                                      allowHalfRating: false,
                                      starCount: 3,
                                      onRated: (value) {},
                                      rating: 3,
                                      color: Color(0xFFFFD143),
                                      borderColor: Color(0xFFFFD143),
                                      size: 15.0,
                                      spacing: 0.0,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\GHC' + food.movieId.price.toString(),
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
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 12,
                                            color: Colors.grey.withOpacity(0.4),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ]),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                removeItem(food.movieId.id);
                              },
                              mini: true,
                              child: Center(
                                  child:
                                      Icon(Icons.delete, color: Colors.white)),
                              backgroundColor: Color(0xFFEE3518),
                            ),
                          ],
                        )),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()));
  }
}
