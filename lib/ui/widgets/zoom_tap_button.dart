import 'dart:async';
import 'package:flutter/widgets.dart';

class ZoomTapButton extends StatefulWidget {
  final Widget child;

  final double begin, end;

  final Duration beginDuration, endDuration, longTapRepeatDuration;

  final Function()? onTap, onLongTap;

  final bool enableLongTapRepeatEvent;

  final Curve beginCurve, endCurve;

  const ZoomTapButton(
      {Key? key,
        required this.child,
        this.onTap,
        this.begin = 1.0,
        this.end = 0.93,
        this.beginDuration = const Duration(milliseconds: 20),
        this.endDuration = const Duration(milliseconds: 120),
        this.longTapRepeatDuration = const Duration(milliseconds: 100),
        this.beginCurve = Curves.decelerate,
        this.endCurve = Curves.fastOutSlowIn,
        this.onLongTap,
        this.enableLongTapRepeatEvent = false})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _ZoomTapButtonState();
}

class _ZoomTapButtonState extends State<ZoomTapButton>
    with SingleTickerProviderStateMixin<ZoomTapButton> {
  AnimationController? _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: widget.endDuration,
        value: 1.0,
        reverseDuration: widget.beginDuration);
    _animation = Tween(begin: widget.end, end: widget.begin).animate(
        CurvedAnimation(
            parent: _controller!,
            curve: widget.beginCurve,
            reverseCurve: widget.endCurve));
    _controller?.forward();
  }

  bool _isOnTap = true;
  @override
  Widget build(BuildContext context) {
    Future<void> onLongPress() async {
      await _controller?.forward();
      await widget.onLongTap?.call();
    }

    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongTap != null && !widget.enableLongTapRepeatEvent
          ? onLongPress
          : null,
      child: Listener(
          onPointerDown: (c) async {
            _isOnTap = true;
            _controller?.reverse();
            if (widget.enableLongTapRepeatEvent) {
              await Future.delayed(widget.longTapRepeatDuration);
              while (_isOnTap) {
                await Future.delayed(widget.longTapRepeatDuration, () async {
                  await (widget.onLongTap ?? widget.onTap)?.call();
                });
              }
            }
          },
          onPointerUp: (c) async {
            _isOnTap = false;
            await _controller?.forward();
          },
          child: ScaleTransition(scale: _animation, child: widget.child)),
    );
  }

  @override
  void dispose() {
    _controller?.stop();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }
}
