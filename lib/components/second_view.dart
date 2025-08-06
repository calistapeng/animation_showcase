import 'package:flutter/material.dart';

class SecondView extends StatelessWidget {
  final AnimationController animationController;
  
  const SecondView({Key? key, required this.animationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.2, curve: Curves.fastOutSlowIn,),
      ),);
    
    final  _secondHalfAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0)).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.2, 0.4, curve: Curves.fastOutSlowIn,)
    ));

    final _textAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0)).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.2, 0.4, curve: Curves.bounceOut),
    ));
    
    final _imageAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(-4, 0)).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.2, 0.4,curve: Curves.fastOutSlowIn),
      ),);

    final _titleAnimation = Tween<Offset>(begin: Offset(0, -2), end: Offset(0, 0)).animate(CurvedAnimation(
      parent:animationController,
      curve: Interval(0.0, 0.2, curve: Curves.bounceOut,),
    ));
    
    
    
    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _titleAnimation,
                child: Text("Skirt Combo", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
              ),
              SlideTransition(
                position: _textAnimation,
                child: Padding(
                  padding: EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16),
                  child: Text(
                    "A beige loose colored patterned sweater, paired with a brown crossbody bag and black boots, creates a lazy and girlish overall look.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SlideTransition(
                position: _imageAnimation,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/second_image.png',fit: BoxFit.cover,),
                )
              )
            ],
          ),
        ),
        
      )
    );
  }
}

