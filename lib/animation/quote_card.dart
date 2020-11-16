import 'package:ange/animation/details.dart';
import 'package:flutter/material.dart';
import 'package:ange/animation/quotes.dart';

class QuoteCard extends StatefulWidget {
  final Quote quote;
  final Function delete;
  QuoteCard({this.quote, this.delete});

  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<double> _sizeAnimation;

  bool isFav = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: Duration(milliseconds: 400), vsync: this);

    _colorAnimation = ColorTween(begin: Colors.grey[200], end: Colors.red[400])
        .animate(
            CurvedAnimation(curve: Curves.bounceInOut, parent: _controller));
    
    _sizeAnimation  = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween:Tween(begin: 50, end: 30), 
          weight: 50),
    
     TweenSequenceItem(
          tween:Tween(begin: 30, end: 50), 
          weight: 50),
        
      ]
    ).animate(_controller);

    _controller.addListener(() {
      // print(_colorAnimation.value);
      // print(_controller.value);
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isFav = true;
      }
      if (status == AnimationStatus.dismissed) {
        isFav = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(seconds: 2),
              curve: Curves.bounceIn,
              builder: (BuildContext context, double _val, Widget child) {
                return Opacity(
                    opacity: _val,
                    child: Padding(
                      padding: EdgeInsets.only(top: _val * 28),
                      child: child,
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.quote.text, style: TextStyle(fontSize: 30)),
              ),
            ),
            AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, _) {
                  return IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: _colorAnimation.value,
                      size: _sizeAnimation.value,
                    ),
                    onPressed: () {
                      isFav ? _controller.reverse() : _controller.forward();
                    },
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.quote.author,
                style: TextStyle(fontSize: 20),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Details(quote: widget.quote.author)));
              },
              child: Hero(
                tag: "image-${widget.quote.author}",
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      'assets/bag.png',
                      width: 50,
                      height: 50,
                    )),
              ),
            ),
            FlatButton.icon(
                onPressed: widget.delete,
                icon: Icon(Icons.delete),
                label: Text("Delete"))
          ])),
    );
  }
}
