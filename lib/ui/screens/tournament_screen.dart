import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_tv/common/drawer_items.dart';
import 'package:game_tv/core/bloc/tournament_bloc/tournament_bloc.dart';
import 'package:game_tv/core/bloc/tournament_bloc/tournament_event.dart';
import 'package:game_tv/core/bloc/tournament_bloc/tournament_state.dart';
import 'package:game_tv/core/repository/login/model/login_response_model.dart';
import 'package:game_tv/core/repository/tournaments/models/tournament_request_model.dart';
import 'package:game_tv/resources/colors.dart';
import 'package:game_tv/resources/images.dart';
import 'package:game_tv/resources/localization/app_localization.dart';
import 'package:game_tv/ui/widgets/common_list_loading.dart';
import 'package:game_tv/ui/widgets/error_widget.dart';
import 'package:game_tv/ui/widgets/player_info_widget.dart';
import 'package:game_tv/ui/widgets/tournament_card.dart';
import '../../resources/localization/translate.dart';
import '../../common/extensions.dart';

class TournamentScreen extends StatefulWidget {
  final LoginResponseModel profileData;
  TournamentScreen({this.profileData});
  @override
  _TournamentScreenState createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  @override
  void initState() {
    BlocProvider.of<TournamentBloc>(context)
        .add(TournamentEvent(params: TournamentRequestModel()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: kDrawerPurple,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
                  Image.asset(
                    kLogo,
                    height: 40,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ] +
                List.generate(
                    drawerItems.length,
                    (index) => Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            color: kPrimaryWhite,
                          ),
                          child: Text(
                            drawerItems[index].translation(context),
                            style: TextStyle(
                              color: kDrawerPurple,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        )),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${widget.profileData.userName}',
          style: TextStyle(
              color: kPrimaryWhite, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kPurpleGradientBegin,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              kPurpleGradientBegin,
              kPurpleGradientBegin,
              kPurpleGradientBegin.withOpacity(0.8),
              kPurpleGradientEnd
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlayerInfoWidget(profileData: widget.profileData),
            SizedBox(
              height: 20,
            ),
            Text(
              kRecommended.translation(context),
              style: TextStyle(
                color: kPrimaryWhite.withOpacity(0.7),
                fontSize: 25,
                fontWeight: FontWeight.w300,
              ),
            ),
            Expanded(
                child: BlocBuilder<TournamentBloc, TournamentBlocState>(
              bloc: BlocProvider.of<TournamentBloc>(context),
              builder: (context, state) {
                if (state is TournamentBlocStateLoading) {
                  return CommonListLoader();
                } else if (state is TournamentBlocStateCompleted) {
                  var data = state.response.data.tournaments;
                  if(data.hasData()){
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return TournamentCard(data: data[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 12,);
                      },
                      itemCount: data.length);
                  }
                  else{
                    return CommonErrorWidget(
                      message: kSomethingWrong.translation(context),
                    );
                  }
                }
                if(state is TournamentBlocStateError){
                  return CommonErrorWidget(
                    message: kSomethingWrong.translation(context),
                  );
                }
                return CommonErrorWidget(
                  message: kSomethingWrong.translation(context),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
