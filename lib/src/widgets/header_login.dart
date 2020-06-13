import 'package:flutter/material.dart';
import 'fade_transition.dart';

class Header extends StatelessWidget {
  final Animation<double> animation;
  final String title;
  final String description;
  
  const Header({
    @required this.animation, 
    this.title,
    this.description,
  }) : assert(animation != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: "logo_txt",
            child: Material(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              color: Colors.blue,
              elevation: 10,
              shadowColor: Colors.blue,
              child: Container(
                height: 50,
                width: 200,
                child: Center(
                  child: Transform.rotate(
                    angle: 0.0, 
                    child: Text(
                      "Logo Aquí",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                )
              )
            )
          ),
          SizedBox(height: 10),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: Text(
              'Nombre aquí',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
            ),
          ),
          
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 16.0,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.blueGrey[900], fontSize: 22),
            )
          ),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 16.0,
            child: Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.blueGrey[700]),
            )
          )
        ]
      )
    );
  }
}