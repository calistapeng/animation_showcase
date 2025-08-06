import 'package:flutter/material.dart'; // 导入Flutter材料设计包

// 导入所有需要的组件视图
import '/components/first_view.dart'; // 导入关怀视图组件
import '/components/center_next_button.dart'; // 导入中央下一步按钮组件
import '/components/second_view.dart'; // 导入心情日记视图组件
import '/components/third_view.dart'; // 导入放松视图组件
import '/components/fourth_view.dart'; // 导入启动画面视图组件
import '/components/top_back_skip_view.dart'; // 导入顶部返回跳过视图组件
import '/components/last_view.dart'; // 导入欢迎视图组件


class IntroductionAnimationScreen extends StatefulWidget {
  const IntroductionAnimationScreen({super.key});

  @override
  State<IntroductionAnimationScreen> createState() => _IntroductionAnimationScreenState();
}

class _IntroductionAnimationScreenState extends State<IntroductionAnimationScreen> with TickerProviderStateMixin{
  AnimationController? _animationController;
  
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
    super.initState();
  }
  
  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ClipRect(
        child: Stack(
          children: [
            FirstView(animationController: _animationController!,),
            SecondView(animationController: _animationController!,),
            ThirdView(animationController: _animationController!),
            FourthView(animationController: _animationController!),
            LastView(animationController: _animationController!),
            TopBackSkipView(animationController: _animationController!, onBackClick: _onBackClick, onSkipClick: _onSkipClick,),
            CenterNextButton(animationController: _animationController!, onNextClick: _onNextClick),
          ],
        ),
      ),
      
    );
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4); // 如果在0-20%之间，前进到40%位置
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6); // 如果在20-40%之间，前进到60%位置
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8); // 如果在40-60%之间，前进到80%位置
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0); // 如果在60-80%之间，调用注册函数（实际是退出引导页）
    }
  }


  void _onSkipClick() {
    _animationController?.animateTo(0.8, duration: Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0); // 如果在0-20%之间，回到起始点
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2); // 如果在20-40%之间，回到20%位置
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4); // 如果在40-60%之间，回到40%位置
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6); // 如果在60-80%之间，回到60%位置
    } else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8); // 如果在80-100%之间，回到80%位置
    }
  }
}
