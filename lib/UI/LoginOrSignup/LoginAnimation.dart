import 'package:vanilla/actions/open_home_screen_action.dart';
import 'package:vanilla/configs/app_colors.dart';
import 'package:vanilla/model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

/// Componen Login Animation to set Animation in login like a bounce ball to fullscreen
class LoginAnimation extends StatefulWidget {
  /// To set type animation and  start and end animation
  LoginAnimation({Key key, this.animationController})
      : animation = new Tween(
          end: 900.0,
          begin: 70.0,
        ).animate(CurvedAnimation(
            parent: animationController, curve: Curves.bounceInOut)),
        super(key: key);

  final AnimationController animationController;
  final Animation animation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    /// Setting shape a animation
    return Padding(
        padding: EdgeInsets.only(bottom: 60.0),
        child: Container(
          height: animation.value,
          width: animation.value,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            shape: animation.value < 600 ? BoxShape.circle : BoxShape.rectangle,
          ),
        ));
  }

  @override
  _LoginAnimationState createState() => _LoginAnimationState();
}

class _LoginAnimationState extends State<LoginAnimation> {
  @override

  /// To navigation after animation complete
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(onInit: (Store<AppState> store) {
      widget.animationController.addListener(() {
        if (widget.animation.isCompleted) {
          store.dispatch(OpenHomeScreenAction());
        }
      });
    }, builder: (BuildContext ctx, Store<AppState> store) {
      return AnimatedBuilder(
        animation: widget.animationController,
        builder: widget._buildAnimation,
      );
    });
  }
}
