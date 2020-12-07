import 'dart:convert';
import 'package:ange/api/cartModel.dart';
import 'package:ange/api/foodModel.dart';
import 'package:ange/api/listModel.dart';
import 'package:ange/ui/detailsPage.dart';
import 'package:ange/ui/networkHandler/network_handler.dart';
import 'package:flutter/material.dart';



class SearchFood extends StatefulWidget {
  @override
  _SearchFoodState createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  CartModel fmodel = CartModel();
  NetworkHandler networHandler = NetworkHandler();
  ListModel searchModel = ListModel();
  bool isLoaded = false;
  

  searchFood(String searchValue) async {
    // print(searchValue);

    fmodel = CartModel(search: searchValue);
    print(fmodel);

    final search = await networHandler.post(
        '/api/book/search', json.encode(fmodel.toJson()));
    var res = json.decode(search.body);
    print(res);

    if (res['success']) {
      setState(() {
        searchModel = ListModel.fromJson(res);
        isLoaded = true;
      });
    } else {
      print('unable to Search Food');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDE2E6),
      appBar: AppBar(
         backgroundColor: Colors.teal,
        title: TextFormField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            hintText: "Search for Foods",
            hintStyle: TextStyle(color: Colors.white),
            fillColor: Color(0xFFE65B9C),
            labelStyle:
                TextStyle(color: Colors.purple, fontWeight: FontWeight.w300),
          ),
          onFieldSubmitted: searchFood,
        ),
      ),
      body:isLoaded == false 
          ? Center(
              child: Text('No item Found',
                  style: TextStyle(fontSize:30, color:Colors.black, fontWeight:FontWeight.w200)),
            )
          : SingleChildScrollView(
              child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:searchModel.books.length,
                    itemBuilder: (context, index) {
                      FoodModel usersSnap = searchModel.books[index];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/18.jpg'),
                            backgroundColor: Colors.white,
                          ),
                          title: Text(usersSnap.title),
                          subtitle: Text("GHC ${usersSnap.price.toString()}"),
                          trailing: Container(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsPage(
                                            imgPath: usersSnap.filePath,
                                            fid: usersSnap.id,
                                            foodName: usersSnap.title,
                                            pricePerItem:
                                                usersSnap.price.toString(),
                                            heroTag: usersSnap.id)));
                              },
                              child: Center(
                                  child: Text("View",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white))),
                            ),
                            height: 80,
                            width: 64,
                            margin: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                                color: Color(0xFF0A7F83),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      );
                    }))
            
            
    );
  }
}
