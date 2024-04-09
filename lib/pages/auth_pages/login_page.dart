import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/components/ask_if_already_user.dart';
import 'package:meals_app/components/auth_button.dart';
import 'package:meals_app/components/custom_text_field.dart';
import 'package:meals_app/components/heading_title.dart';
import 'package:meals_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:meals_app/helpers/show_snakbar.dart';
import 'package:meals_app/pages/auth_pages/resgister_page.dart';
import 'package:meals_app/pages/initial_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    String? email, password;
    bool isLoading = false;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Loading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          isLoading = false;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const InitialPage(),
            ),
          );
        } else if (state is LoginFailure) {
          isLoading = false;
          if (state.exceptionCode.code == 'invalid-credential') {
            showMessage(context, 'invalid password');
          } else if (state.exceptionCode.code == 'user-not-found') {
            showMessage(context, "No user found for that email.");
          } else {
            showMessage(context, 'invalid credentials');
          }
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/images/zou3.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Heading(
                    title: 'Login',
                    size: 35,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Please Sign in to continue',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    fieldIcon: Icons.email,
                    hintText: 'Enter your Email',
                    hideTypedText: false,
                    onChanged: (p0) {
                      email = p0;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    fieldIcon: Icons.password,
                    hintText: 'Enter your password',
                    hideTypedText: true,
                    onChanged: (p0) {
                      password = p0;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  AuthicationButton(
                    text: 'Login',
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context)
                            .loginUser(email: email!, password: password!);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AskIfAlreadyUserOrNot(
                    text: "don't have an account?",
                    page: " Sign Up",
                    onpressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
