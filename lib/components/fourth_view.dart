import 'package:flutter/material.dart';

class FourthView extends StatelessWidget {
  final AnimationController animationController;
  const FourthView({Key? key, required this.animationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _firstHalfAnimation =
    Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.6, // 动画在40%-60%的范围内执行
        curve: Curves.fastOutSlowIn, // 使用快出慢进的动画曲线
      ),
    ));
    // 创建第二段动画，从(0,0)到(-1,0)的水平滑动，使视图向左滑出屏幕
    final _secondHalfAnimation =
    Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8, // 动画在60%-80%的范围内执行
        curve: Curves.fastOutSlowIn, // 使用快出慢进的动画曲线
      ),
    ));

    // 描述文本的第一段动画，从(2,0)到(0,0)的水平滑动，使描述从更远的右侧滑入
    final _titleFirstHalfAnimation =
    Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.6, // 动画在40%-60%的范围内执行
        curve: Curves.bounceOut, // 使用快出慢进的动画曲线
      ),
    ));
    // 描述文本的第二段动画，从(0,0)到(-2,0)的水平滑动，使描述更快地向左滑出
    final _titleSecondHalfAnimation =
    Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8, // 动画在60%-80%的范围内执行
        curve: Curves.fastOutSlowIn, // 使用快出慢进的动画曲线
      ),
    ));
    // 图片的第一段动画，从(4,0)到(0,0)的水平滑动，使图片从最远的右侧滑入
    final _imageFirstHalfAnimation =
    Tween<Offset>(begin: Offset(4, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.6, // 动画在40%-60%的范围内执行
        curve: Curves.fastOutSlowIn, // 使用快出慢进的动画曲线
      ),
    ));
    // 图片的第二段动画，从(0,0)到(-4,0)的水平滑动，使图片最快地向左滑出
    final _imageSecondHalfAnimation =
    Tween<Offset>(begin: Offset(0, 0), end: Offset(-4, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8, // 动画在60%-80%的范围内执行
        curve: Curves.fastOutSlowIn, // 使用快出慢进的动画曲线
      ),
    ));

    return SlideTransition( // 使用滑动过渡动画
      position: _firstHalfAnimation, // 应用第一段动画：从右侧滑入
      child: SlideTransition( // 嵌套的滑动过渡
        position: _secondHalfAnimation, // 应用第二段动画：向左滑出
        child: Padding( // 添加内边距
          padding: const EdgeInsets.only(bottom: 100), // 底部添加100的内边距
          child: Column( // 垂直排列子组件
            mainAxisAlignment: MainAxisAlignment.center, // 垂直居中对齐
            children: [
              Text( // 标题文本
                "Playful", // "心情日记"
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold), // 字体大小26，加粗
              ),
              SlideTransition( // 描述文本的滑动过渡
                position: _titleFirstHalfAnimation, // 应用描述文本的第一段动画
                child: SlideTransition( // 嵌套的滑动过渡
                  position: _titleSecondHalfAnimation, // 应用描述文本的第二段动画
                  child: Padding( // 添加内边距
                    padding: EdgeInsets.only(
                        left: 64, right: 64, top: 16, bottom: 16), // 左右64，上下16的内边距
                    child: Text( // 描述文本
                      "Colorful short shirt, purple wide leg pants, paired with a yellow shoulder bag, blending out youth", // 心情日记功能的介绍文字
                      textAlign: TextAlign.center, // 文本居中对齐
                    ),
                  ),
                ),
              ),
              SlideTransition( // 图片的滑动过渡
                position: _imageFirstHalfAnimation, // 应用图片的第一段动画
                child: SlideTransition( // 嵌套的滑动过渡
                  position: _imageSecondHalfAnimation, // 应用图片的第二段动画
                  child:SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset( // 加载图片资源
                      'assets/fourth_image.png', // 心情日记相关的图片
                      fit: BoxFit.cover, // 图片适应容器，保持比例
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 
}


