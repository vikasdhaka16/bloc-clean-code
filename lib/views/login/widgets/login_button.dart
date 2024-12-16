import 'package:bloc_clean_code/config/routes/routes_name.dart';
import 'package:bloc_clean_code/utils/enums.dart';
import 'package:bloc_clean_code/utils/flush_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required GlobalKey<FormState> formkey,
  }) : _formkey = formkey;

  final GlobalKey<FormState> _formkey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginStates>(
      listenWhen: (previous, current) =>
          current.postApiSttaus != previous.postApiSttaus,
      listener: (context, state) {
        if (state.postApiSttaus == PostApiStatus.error) {
          FlushBarHelper.flushBarErrorMessage(
              state.message.toString(), context);
        }

        if (state.postApiSttaus == PostApiStatus.success) {
          Navigator.pushNamed(context, RoutesName.homeScreen);
        }
      },
      buildWhen: (previous, current) =>
          previous.postApiSttaus != current.postApiSttaus,
      builder: (context, state) {
        return ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                context.read<LoginBloc>().add(SubmitButton());
              }
            },
            child: state.postApiSttaus == PostApiStatus.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const Text('Login'));
      },
    );
  }
}
