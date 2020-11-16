import 'package:ange/animation/quote_card.dart';
import 'package:ange/animation/quotes.dart';
import 'package:flutter/material.dart';

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(author: 'Trinity', text: "Are you Home"),
    Quote(author: 'Ama', text: "Are you Home"),
    Quote(author: 'hannah', text: "Are you Home"),
    Quote(author: 'janice', text: "Are you Home"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        title: Text("List"),
      ),
      body: SingleChildScrollView(
          child: Column(
          children: quotes
              .map((quote) => QuoteCard(
                  quote: quote,
                  delete: () {
                    setState(() {
                      quotes.remove(quote);
                    });
                  }))
              .toList(),

        ),

      ),
    );
  }
}