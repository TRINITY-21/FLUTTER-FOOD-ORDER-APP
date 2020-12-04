import 'dart:convert';
import 'package:ange/api/cartModel.dart';
import 'package:ange/ui/networkHandler/network_handler.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class SearchFood extends StatefulWidget {
  @override
  _SearchFoodState createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {

  CartModel fmodel = CartModel();
  NetworkHandler networHandler = NetworkHandler();

  search(String term) async {
    fmodel = CartModel(search: term);

    final fav = await networHandler.post(
        '/api/favorite/removeFromFavorite', json.encode(fmodel.toJson()));
    var res = json.decode(fav.body);
    print(res);

    if (res['success']) {
      setState(() {
        // cartModel = CartModel.fromJson(res);
        // subscribedFood = !subscribedFood;
  
      });
    } else {
      print('unable to favorite');
    }
  }

  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<Post>(
            onSearch: search,
            onItemFound: (Post post, int index) {
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.description),
              );
            },
          ),
        ),
      ),
    );
  }
}
