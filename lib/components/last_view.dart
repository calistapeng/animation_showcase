import 'package:flutter/material.dart';

class LastView extends StatelessWidget {

  final AnimationController animationController;
  
  const LastView({Key? key, required this.animationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _firstHalfAnimation =
    Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.6,
          0.8, // 动画在60%-80%的范围内执行
          curve: Curves.fastOutSlowIn, // 使用快出慢进的动画曲线
        ),
      ),
    );
    // 创建第二段动画，从(0,0)到(-1,0)的水平滑动，使视图向左滑出屏幕
    final _secondHalfAnimation =
    Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.8,
          1.0, // 动画在80%-100%的范围内执行
          curve: Curves.fastOutSlowIn, // 使用快出慢进的动画曲线
        ),
      ),
    );

    // 欢迎文字的动画，从(2,0)到(0,0)的水平滑动，使欢迎文字从更远的右侧滑入
    final _titleFirstHalfAnimation =
    Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8, // 动画在60%-80%的范围内执行
        curve: Curves.bounceOut, // 使用快出慢进的动画曲线
      ),
    ));

    // 图片的动画，从(4,0)到(0,0)的水平滑动，使图片从最远的右侧滑入
    final _ImageAnimation =
    Tween<Offset>(begin: Offset(4, 0), end: Offset(0, 0))
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
              SlideTransition( // 图片的滑动过渡
                position: _ImageAnimation, // 应用图片动画
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset( // 加载图片资源
                    'assets/last_image.png', // 欢迎相关的图片
                    fit: BoxFit.cover, // 图片适应容器，保持比例
                  ),
                )
              ),
              SlideTransition( // 欢迎文字的滑动过渡
                position: _titleFirstHalfAnimation, // 应用欢迎文字动画
                child: Text( // 欢迎文字
                  "Relaxation", // "欢迎"
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold), // 字体大小25，加粗
                ),
              ),
              Padding( // 描述文本的内边距
                padding:
                EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16), // 左右64，上下16的内边距
                child: Text( // 描述文本
                  "Watercolor blending creates a sense of relaxation, the off shoulder short top is adorned with playful polka dots, and the flared jeans flow freely", // "通过you-do应用保持组织并免除压力"
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


