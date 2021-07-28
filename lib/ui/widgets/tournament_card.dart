import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_tv/core/repository/tournaments/entities/tournament_response.dart';
import 'package:game_tv/resources/colors.dart';

import 'loading_placeholder_box.dart';

class TournamentCard extends StatelessWidget {
  final Tournaments data;
  TournamentCard({@required this.data});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 220,
        decoration: BoxDecoration(color: Colors.amber
            /*gradient: LinearGradient(
            colors: [
              Colors.deepOrange,
              Colors.deepPurpleAccent,
            ]
          )*/
            ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl: data.coverUrl,
                    fit: BoxFit.cover,
                    height: 130,
                    placeholder: (context, value) {
                      return LoadingAnimatedBorder(
                          cornerRadius: 20,
                          borderWidth: 4,
                          borderColor: kPrimaryWhite,
                          child: Container(
                            height: 90,
                            color: Colors.amber,
                            width: MediaQuery.of(context).size.width,
                          ));
                    },
                    errorWidget: (context, value, error) {
                      return Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.amber,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            
                            kCardGradient,
                            kCardGradient.withOpacity(0),
                            //kCardGradient.withOpacity(0),
                          ]
                      )
                  ),
                ),
              ],
            ),
            Container(
              height: 90,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          letterSpacing: -1,
                          color: kPrimaryWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        data.gameName,
                        style: TextStyle(
                          color: kBlack.withOpacity(0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )),
                  Icon(Icons.arrow_forward_ios_rounded,size: 30,color: kPrimaryWhite.withOpacity(0.8),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
