
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_tv/core/bloc/login_bloc/login_bloc.dart';
import 'package:game_tv/core/bloc/login_bloc/login_state.dart';
import 'package:game_tv/ui/screens/tournament_screen.dart';
import 'package:game_tv/ui/widgets/login_widget.dart';
import '../../resources/images.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  double opacity;

  @override
  void initState() {
    opacity = 0;
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    controller.addListener(() {
      if(controller.isCompleted){
        setState(() {
         opacity = 1;
        });
      }
    });
    BlocProvider.of<LoginBloc>(context).listen((state) {
      if(state is LoginBlocStateCompleted){
        Navigator.pushReplacement(context, CupertinoPageRoute(
          builder: (context){
            return TournamentScreen(profileData: state.response,);
          }
        ));
      }
    });
    animation = Tween<double>(begin: 0,end: 1).animate(controller);
    controller.forward();
    super.initState();
  }

  double scale (double val){
    var  value = 1.0 - val/2;
      return value;
  }
  Offset translate (double val){
    var  value = -val*218;
      return Offset(0, value);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage(kSplashBG),
                fit: BoxFit.fitWidth,
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AnimatedBuilder(
                    animation: animation,
                  builder: (context,child){
                      return Transform.scale(
                        scale: scale(animation.value),
                        child: Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.32),
                          child: Image.asset(
                            kLogo,
                            width: 278,
                          ),
                        ),
                      );
                },
                  child: Transform.scale(
                    scale: scale(animation.value),
                    child: Image.asset(
                        kLogo,
                      width: 278,
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity:opacity,
                    duration: Duration(milliseconds: 1500),
                  child: LoginWidget()

                )
              ],
            ),
          ),
        )
    );
  }
}
