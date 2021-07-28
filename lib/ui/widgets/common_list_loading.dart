import 'package:flutter/material.dart';
import 'package:game_tv/resources/colors.dart';
import 'package:game_tv/ui/widgets/loading_placeholder_box.dart';

class CommonListLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ClipRRect(
          borderRadius:  BorderRadius.circular(20),
          child: LoadingAnimatedBorder(borderColor: Colors.amber,
            cornerRadius: 20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 220 ,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.deepOrange.withOpacity(0.5),
                        Colors.deepPurpleAccent.withOpacity(0.5),
                      ]
                  )
              ),
            ),),
        ),
        SizedBox(height: 12,),
        ClipRRect(
          borderRadius:  BorderRadius.circular(20),
          child: LoadingAnimatedBorder(borderColor: Colors.amber,
            cornerRadius: 20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 220 ,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.deepOrange.withOpacity(0.5),
                        Colors.deepPurpleAccent.withOpacity(0.5),
                      ]
                  )
              ),
            ),),
        ),
        SizedBox(height: 12,),
        ClipRRect(
          borderRadius:  BorderRadius.circular(20),
          child: LoadingAnimatedBorder(borderColor: Colors.amber,
              cornerRadius: 20,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 220 ,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.deepOrange.withOpacity(0.5),
                          Colors.deepPurpleAccent.withOpacity(0.5),
                        ]
                    )
                ),
              ),),
        )
      ],
    );
  }
}
