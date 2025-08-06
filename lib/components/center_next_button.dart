import 'package:flutter/material.dart';
import 'package:animations/animations.dart';



class CenterNextButton extends StatelessWidget {

  final AnimationController animationController; // 控制动画的控制器
  final VoidCallback onNextClick;

  const CenterNextButton({super.key, required this.animationController, required this.onNextClick});

  @override
  Widget build(BuildContext context) {

    final _topMoveAnimation = Tween<Offset>(begin: Offset(0, 5), end: Offset(0, 0)).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.0, 0.2,curve: Curves.fastOutSlowIn),
    ));

    final _signUpMoveAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.6, 0.8, curve: Curves.fastOutSlowIn,),
    ));

    return Padding(
      padding: EdgeInsets.only(bottom: 16 + MediaQuery.of(context).padding.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SlideTransition(
            position: _topMoveAnimation,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => AnimatedOpacity(
                opacity: animationController.value >= 0.2 && animationController.value <= 0.6 ? 1 : 0,
                duration: Duration(milliseconds: 480),
                child: _pageView(),
              )
            ),
          ),
          Center(
            child: SlideTransition(
              position: _topMoveAnimation,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) => Padding(
                  padding: EdgeInsets.only(bottom: 38 - (38 * _signUpMoveAnimation.value)),
                  child: Container(
                    constraints: BoxConstraints(minWidth: 58),
                    height: 58,
                    width: 58 + (200 * _signUpMoveAnimation.value),
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(8 + (32 * (1 - _signUpMoveAnimation.value))),
                      color:Colors.grey,
                    ),
                    child: PageTransitionSwitcher(
                        duration: Duration(milliseconds: 480),
                        reverse: _signUpMoveAnimation.value < 0.7,
                        transitionBuilder: (
                            Widget child,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            ) {
                          return SharedAxisTransition( // 使用共享轴过渡效果
                            fillColor: Colors.transparent, // 填充颜色透明
                            child: child, // 子组件
                            animation: animation, // 正向动画
                            secondaryAnimation: secondaryAnimation, // 反向动画
                            transitionType: SharedAxisTransitionType.vertical, // 垂直方向的共享轴过渡
                          );
                        },
                        child: _signUpMoveAnimation.value > 0.7 ? InkWell(
                          key: ValueKey('home button'),
                          onTap: onNextClick,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Welcome', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500,),),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward_rounded, color: Colors.black),
                              ],
                            ),
                          ),
                        ) : InkWell(
                          key: ValueKey('next button'),
                          onTap: onNextClick,
                          child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Center(
                                child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                              )
                          ),
                        )
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _pageView() {

    int _selectedIndex = 0;

    if (animationController.value >= 0.7) {
      _selectedIndex = 3; // 当动画值≥0.7时，选中第四个页面
    } else if (animationController.value >= 0.5) {
      _selectedIndex = 2; // 当动画值≥0.5时，选中第三个页面
    } else if (animationController.value >= 0.3) {
      _selectedIndex = 1; // 当动画值≥0.3时，选中第二个页面
    } else if (animationController.value >= 0.1) {
      _selectedIndex = 0; // 当动画值≥0.1时，选中第一个页面
    }



    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for(var i = 0; i < 4; i++)
            Padding(
              padding: const EdgeInsets.all(4),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 480),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: _selectedIndex == i // 根据是否是当前页面决定颜色
                      ? Colors.grey // 当前页面指示点颜色（深蓝色）
                      : Colors.black,
                ),
              ),
            )
        ],
      ),
    );
  }


}

