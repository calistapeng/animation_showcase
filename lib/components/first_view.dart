import 'package:flutter/material.dart';

class FirstView extends StatefulWidget {

  final AnimationController animationController;

  const FirstView({Key? key, required this.animationController}) : super(key: key);

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {

  @override
  Widget build(BuildContext context) {

    final _introductionanimation =
    Tween<Offset>(begin: Offset(0, 0), end: Offset(0.0, -1.0))
        .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return SlideTransition(
      position: _introductionanimation,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/first_image.png', fit: BoxFit.cover,),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0), // 设置上下内边距
                child: Text(
                  "Youth Fashion", // 应用名称
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold), // 字体大小25，加粗
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 64, right: 64), // 设置左右内边距
                child: Text(
                  "Pink floral deep V-strap short skirt, paired with black high-heeled boots, sweet with a hint of sexiness", // 应用介绍文字
                  textAlign: TextAlign.center, // 文本居中对齐
                ),
              ),
              SizedBox(
                height: 48, // 高度为48的空白区域
              ),
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 16),
                child: InkWell(
                  onTap: (){
                    widget.animationController.animateTo(0.2);
                  },
                  child: Container(
                    height: 58, // 按钮高度
                    padding: EdgeInsets.only(
                      left: 56.0,
                      right: 56.0,
                      top: 16,
                      bottom: 16,
                    ), // 按钮内边距
                    decoration: BoxDecoration( // 按钮装饰
                      borderRadius: BorderRadius.circular(38.0), // 圆角半径
                      color: Colors.grey, // 按钮颜色（深蓝色）
                    ),
                    child: Text( // 按钮文字
                      "Let's begin", // "让我们开始"
                      style: TextStyle(
                        fontSize: 18, // 字体大小
                        color: Colors.black, // 文字颜色（白色）
                      ),
                    ),
                  ),
                ),
              ),
            ],

          ),
        ),
      )
    );
  }
}
