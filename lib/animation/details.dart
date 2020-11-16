import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String quote;
  Details({this.quote});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Hero(
            
              tag: "image-${widget.quote}",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.asset(
                    'assets/bag.png',
                   
                  )),
            ),
          
          ),
           Text(widget.quote),
        ],
      ),
     
    );
  }
}
