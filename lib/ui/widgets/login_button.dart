import 'package:flutter/material.dart';
import 'package:game_tv/resources/colors.dart';
import 'package:game_tv/resources/localization/app_localization.dart';
import '../../resources/localization/translate.dart';


class LoginButton extends StatelessWidget {
  final Function onPressed;
  LoginButton({this.onPressed});





  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed))
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              );
            else if (states.contains(MaterialState.disabled))
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              );
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ); // Use the component's default.
          },),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed))
              return kBluePressed;
            else if (states.contains(MaterialState.disabled))
              return kPrimaryWhite.withOpacity(0.5);
            return kPrimaryWhite; // Use the component's default.
          },)
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            kLogin.translation(context),
            style: TextStyle(
                color: kBlack,
              fontWeight: FontWeight.bold
          )
          ),
        )
    );
  }
}
