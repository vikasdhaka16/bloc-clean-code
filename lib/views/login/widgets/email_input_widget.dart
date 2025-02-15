import 'package:bloc_clean_code/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  const EmailInputWidget({
    super.key,
    required this.emailFocusNode,
  });

  final FocusNode emailFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => current.email != previous.email,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocusNode,
          decoration: const InputDecoration(
              hintText: 'Email', border: OutlineInputBorder()),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(email: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Email';
            } else if (!Validations.emailValidator(value)) {
              return 'Please enter valid email';
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
