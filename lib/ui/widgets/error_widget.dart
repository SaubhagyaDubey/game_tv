import 'package:flutter/material.dart';
import '../../resources/colors.dart';


class CommonErrorWidget extends StatelessWidget {
  final String message;
  CommonErrorWidget({this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.videogame_asset,
            color: kPrimaryWhite.withOpacity(0.8),
            size: 60,
          ),
          SizedBox(height: 20,),
          Text(message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kPrimaryWhite.withOpacity(0.8),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),)
        ],
      ),
    );
  }
}
