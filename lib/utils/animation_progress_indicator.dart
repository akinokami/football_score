import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedProgressIndicator extends StatefulWidget {
  final double value;
  const AnimatedProgressIndicator({Key? key, required this.value}) : super(key: key);

  @override
  _AnimatedProgressIndicatorState createState() => _AnimatedProgressIndicatorState();
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: widget.value,
    ).animate(_controller);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AnimatedProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _animation = Tween<double>(
        begin: _animation.value,
        end: widget.value,
      ).animate(_controller);
      _controller.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          width: 80.w,
          height: 10.h,
          child: LinearProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            value: _animation.value,
          ),
        );
      },
    );
  }
}
