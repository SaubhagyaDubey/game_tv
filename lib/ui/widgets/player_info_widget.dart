import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_tv/core/repository/login/model/login_response_model.dart';
import 'package:game_tv/resources/colors.dart';
import 'package:game_tv/resources/localization/app_localization.dart';
import 'package:game_tv/ui/widgets/loading_placeholder_box.dart';
import '../../resources/localization/translate.dart';

class PlayerInfoWidget extends StatelessWidget {
  final LoginResponseModel profileData;
  PlayerInfoWidget({this.profileData});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 50,),
        Row(
          children: [
            Container(
              height: 110,
              width: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: CachedNetworkImage(
                  imageUrl: profileData.profilePicture,
                  fit: BoxFit.cover,
                  height: 90,
                  width: 90,
                  placeholder: (context , value){
                    return LoadingAnimatedBorder(
                        cornerRadius: 60,
                        borderWidth: 4,
                        borderColor: kPrimaryWhite, child: Container(
                      height: 90,
                      width: 90,
                    ));
                  },
                  errorWidget: (context,value,error){
                    return Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: kPurpleGradientEnd,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 16,),
            Expanded(child:
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${profileData.firstName} ${profileData.lastName}',
                    style: TextStyle(
                        color: kPrimaryWhite,
                        fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kBluePressed,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${profileData.rating}',
                          style: TextStyle(
                              color: kBluePressed,
                              fontSize: 25,
                          ),
                        ),
                        SizedBox(width: 13,),
                        Text(
                          'Elo ${kRating.translation(context)}',
                          style: TextStyle(
                              color: kPrimaryWhite.withOpacity(0.8),
                              fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            )
          ],
        ),
        SizedBox(height: 20,),
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    height: 100,
                    color: Colors.deepOrangeAccent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${profileData.tournamentPlayed}",
                          style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${kTournamentsPlayed.translation(context)}",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(width: 2,),
              Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    height: 100,
                    color: Colors.amber,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${profileData.tournamentWon}",
                          style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${kTournamentsWon.translation(context)}",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(width: 2,),
              Expanded(

                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    height: 100,
                    color: Colors.deepPurpleAccent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${(profileData.tournamentWon/profileData.tournamentPlayed*100).round()}%",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "${kWinningPercentage.translation(context)}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )),

            ],
          ),
        )
      ],
    );
  }
}
