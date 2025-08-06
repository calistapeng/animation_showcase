import 'package:flutter/material.dart';

class ThirdView extends StatelessWidget {
  final AnimationController animationController;

  const ThirdView({Key? key, required this.animationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _firstHalfAnimation = Tween<Offset>(begin: Offset(1, 0),end: Offset(0, 0)).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.2, 0.4, curve: Curves.fastOutSlowIn),
    ));

    final _secondHalfAnimation =
    Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.6, // 动画在40%-60%的范围内执行
        curve: Curves.fastOutSlowIn, // 使用快出慢进的动画曲线
      ),
    ));

    final _titleFirstHalfAnimation =
    Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.2,
        0.4, // 动画在20%-40%的范围内执行
        curve: Curves.bounceOut, // 使用快出慢进的动画曲线
      ),
    ));
    // 标题的第二段动画，从(0,0)到(-2,0)的水平滑动，使标题更快地向左滑出
    final _titleSecondHalfAnimation =
    Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.6, // 动画在40%-60%的范围内执行
        curve: Curves.fastOutSlowIn, // 使用快出慢进的动画曲线
      ),
    ));

    final _imageFirstHalfAnimation =
    Tween<Offset>(begin: Offset(4, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.2,
        0.4, // 动画在20%-40%的范围内执行
        curve: Curves.fastOutSlowIn // 使用快出慢进的动画曲线
      ),
    ));
    // 图片的第二段动画，从(0,0)到(-4,0)的水平滑动，使图片最快地向左滑出
    final _imageSecondHalfAnimation =
    Tween<Offset>(begin: Offset(0, 0), end: Offset(-4, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.6, // 动画在40%-60%的范围内执行
        curve: Curves.fastOutSlowIn, // 使用快出慢进的动画曲线
      ),
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
                position: _imageSecondHalfAnimation,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/third_image.png', fit: BoxFit.cover, ),
                )
              ),
              SlideTransition(
                position: _titleFirstHalfAnimation,
                child: SlideTransition(
                  position: _titleSecondHalfAnimation, // 应用标题的第二段动画
                  child: Text( // 标题文本
                    "Watercolor Breeze", // "关怀"
                    style:
                    TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold), // 字体大小26，加粗
                  ),
                ),
              ),
              Padding( // 描述文本的内边距
                padding:
                EdgeInsets.only(left: 64, right: 64, bottom: 16, top: 16), // 左右64，上下16的内边距
                child: Text( // 描述文本
                  "Pink polka dot sleeveless top, paired with vintage washed blue wide leg pants, waistband drawstring and patch pocket design add a sense of workwear, exuding a lazy summer vibe", // 关怀功能的介绍文字
                  textAlign: TextAlign.center, // 文本居中对齐
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}


