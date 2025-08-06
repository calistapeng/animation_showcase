// Dart UI库，提供图形和视觉效果（用于BackdropFilter）
import 'dart:ui';

// Flutter框架核心包
import 'package:flutter/material.dart';

/// 毛玻璃效果容器组件
/// 为子组件提供模糊背景效果，常用于底部导航栏等需要半透明效果的场景
/// 继承自StatelessWidget，表示这是一个无状态组件
class GlassBox extends StatelessWidget {
  /// 子组件，将被包装在毛玻璃效果容器中
  final child;

  /// 构造函数
  /// [child] 需要应用毛玻璃效果的子组件，必需参数
  /// [key] Widget的唯一标识符，可选参数
  const GlassBox({Key? key, required this.child}) : super(key: key);

  /// 构建毛玻璃效果容器UI的方法
  /// 返回带有模糊背景效果的容器
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // 设置圆角半径为10像素
      borderRadius: BorderRadius.circular(10),
      child: Container(
        // 固定容器高度为100像素
        height: 100,
        // 容器内边距为2像素
        padding: EdgeInsets.all(2),
        child: BackdropFilter(
          // 应用模糊滤镜效果
          // sigmaX和sigmaY控制水平和垂直方向的模糊程度
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            // 子组件在容器底部居中对齐
            alignment: Alignment.bottomCenter,
            child: child, // 显示传入的子组件
          ),
        ),
      ),
    );
  }
}
