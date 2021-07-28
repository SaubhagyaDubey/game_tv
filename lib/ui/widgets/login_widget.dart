import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_tv/core/bloc/login_bloc/login_bloc.dart';
import 'package:game_tv/core/bloc/login_bloc/login_event.dart';
import 'package:game_tv/core/bloc/login_bloc/login_state.dart';
import 'package:game_tv/core/repository/login/model/login_model.dart';
import 'package:game_tv/resources/colors.dart';
import 'package:game_tv/resources/localization/app_localization.dart';
import 'package:game_tv/ui/widgets/loading_placeholder_box.dart';
import 'package:game_tv/ui/widgets/text_field.dart';
import '../../resources/localization/translate.dart';
import 'login_button.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController controllerUserName;
  TextEditingController controllerPassword;

  @override
  void initState() {
    controllerPassword = TextEditingController();
    controllerUserName = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonTextField(
            label: kUserName.translation(context),
            isObscure: false,
            controller: controllerUserName,
            errorText: kErrorUsername.translation(context),
          ),
          SizedBox(
            height: 40,
          ),
          CommonTextField(
            label: kPassword.translation(context),
            isObscure: true,
            controller: controllerPassword,
            errorText: kErrorPassword.translation(context),
          ),
          SizedBox(
            height: 40,
          ),
          BlocBuilder<LoginBloc,LoginBlocState>(
            bloc: BlocProvider.of<LoginBloc>(context),
              builder: (context,state){
              if(state is LoginBlocStateLoading){
                return LoadingAnimatedBorder(borderColor: kPrimaryWhite,
                    borderWidth: 6,
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                    ));
              }
              else if(state is LoginBlocStateError){
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LoginButton(
                    onPressed: () {
                  if(
                  controllerPassword.text.length>3&&
                      controllerPassword.text.length<=8&&
                      controllerUserName.text.length>3&&
                      controllerUserName.text.length<=8
                  ){
                    BlocProvider.of<LoginBloc>(context).add(LoginEvent(params: LoginModel()
                      ..username=controllerUserName.text
                      ..password = controllerPassword.text
                    ));
                  }
                },
                ),
                    SizedBox(height: 10,),
                    Text(
                      state.message.translation(context),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12
                      ),
                    )
                  ],
                );
              }
              return LoginButton(
                onPressed: () {
                  if(
                  controllerPassword.text.length>3&&
                      controllerPassword.text.length<=8&&
                      controllerUserName.text.length>3&&
                      controllerUserName.text.length<=8
                  ){
                    BlocProvider.of<LoginBloc>(context).add(LoginEvent(params: LoginModel()
                      ..username=controllerUserName.text
                      ..password = controllerPassword.text
                    ));
                  }
                },
              );
              }
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
              onTap: (){},
              child: Text(
                kSignUp.translation(context),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryWhite,
                  fontSize: 12
                ),
              )
          )
        ],
      ),
    );
  }
}
