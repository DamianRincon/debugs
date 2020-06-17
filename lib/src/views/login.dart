import 'package:flutter/material.dart';
import 'package:Debug/src/widgets/fade_transition.dart';

import '../../src/widgets/cliprect_login.dart';
import '../../src/widgets/custom_field.dart';
import '../../src/widgets/header_login.dart';

class Login extends StatefulWidget {
  final double screenHeight;

  const Login({
    @required this.screenHeight,
  }) : assert(screenHeight != null);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Duration kButtonAnimationDuration = Duration(milliseconds: 600);
  Duration kCardAnimationDuration = Duration(milliseconds: 400);
  Duration kRippleAnimationDuration = Duration(milliseconds: 400);
  Duration kLoginAnimationDuration = Duration(milliseconds: 1500);

  AnimationController _animationController;
  Animation<double> _headerTextAnimation;
  Animation<double> _formElementAnimation;
  Animation<double> _whiteTopClipperAnimation;
  Animation<double> _blueTopClipperAnimation;
  Animation<double> _greyTopClipperAnimation;

  FocusNode email = new FocusNode();
  FocusNode pass = new FocusNode();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: kLoginAnimationDuration,                                   
    );

    var fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);
    _headerTextAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.6,
        curve: Curves.easeInOut,
      ),
    ));

    _formElementAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.7,
        1.0,
        curve: Curves.easeInOut,
      ),
    ));

    var clipperOffsetTween = Tween<double>(
      begin: widget.screenHeight,
      end: 0.0,
    );
    _blueTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.2,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _greyTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.35,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _whiteTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.5,
          0.9,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _animationController.forward();

    super.initState();
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: <Widget>[

          AnimatedBuilder(
            animation: _whiteTopClipperAnimation,
            child: Container(
              color: Colors.blue[50],
            ),
            builder: (_, Widget child) {
              return ClipPath(
                clipper: WhiteTopClipper(
                  yOffset: _whiteTopClipperAnimation.value,
                ),
                child: child,
              );
            },
          ),
          
          AnimatedBuilder(
            animation: _greyTopClipperAnimation,
            child: Container(
              color: Colors.blue[100],
            ),
            builder: (_, Widget child) {
              return ClipPath(
                clipper: GreyTopClipper(
                  yOffset: _greyTopClipperAnimation.value,
                ),
                child: child,
              );
            },
          ),

          AnimatedBuilder(
            animation: _blueTopClipperAnimation,
            child: Container(
              color: Colors.white,
            ),
            builder: (_, Widget child) {
              return ClipPath(
                clipper: BlueTopClipper(
                  yOffset: _blueTopClipperAnimation.value,
                ),
                child: child,
              );
            },
          ),

          ListView(
            padding: EdgeInsets.only(top: 25),
            children: <Widget>[
              Header(
                animation: _headerTextAnimation,
                title: "Bienvenido de nuevo",
                description: "Inicia sesión con tu correo y la contraseña asignada."
              ),
              SizedBox(height: 100),

              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    children: <Widget>[
                      FadeSlideTransition(
                        animation: _formElementAnimation,
                        additionalOffset: 0.0,
                        child: CustomField(
                          dense: true,
                          label: "Correo",
                          borderRadius: 5,
                          actionNode: TextInputAction.next,
                          node: email,
                          onComplete: ()=> FocusScope.of(context).requestFocus(pass),
                          placeholder: "example@domain.com",
                          type: TextInputType.emailAddress,
                        )
                      ),

                      SizedBox(height: 8),
                            
                      FadeSlideTransition(
                        animation: _formElementAnimation,
                        additionalOffset: 20,
                        child: CustomField(
                          dense: true,
                          label: "Contraseña",
                          borderRadius: 5,
                          actionNode: TextInputAction.done,
                          node: pass,
                          placeholder: "********",
                          type: TextInputType.visiblePassword,
                        )
                      ),

                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: (){},
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "Recuperar contraseñas", 
                              style: TextStyle(
                              color: Colors.blueGrey[900], fontWeight: FontWeight.bold
                            )),
                          )
                        )
                      ),

                      SizedBox(height: 20),

                      FadeSlideTransition(
                        animation: _formElementAnimation,
                        additionalOffset: 3 * 20.0,
                        child: Material(
                          color: Colors.blue,
                          elevation: 5,
                          shadowColor: Colors.blue[200],
                          borderRadius: BorderRadius.circular(5),
                          child: InkWell(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, "/home");
                              /*if (_formKey.currentState.validate()) {

                              }*/
                            },
                            child: Container(
                              height: 55,
                              child: Center(
                                child: Text(
                                  "ACCEDER",
                                  style: TextStyle(color: Colors.white)),
                              )
                            )
                          )
                        )
                      ),
                            
                      /*Padding(
                        padding: EdgeInsets.only(top: 25, bottom: 5),
                        child: Row(
                          children: <Widget>[
                            Expanded(child: Divider()),
                            SizedBox(width: 15),
                            //Text(translations.text("login.o")),
                            SizedBox(width: 15),
                            Expanded(child: Divider())
                          ]
                        )
                      ),

                      FlatButton(
                        onPressed: ()=> Navigator.pushNamed(context, "/register"),
                        //child: Text(translations.text("login.create_account"))
                      )*/
                    ]    
                  )
                )
              )
            ]
          )
        ]
      )
    );
  }
}