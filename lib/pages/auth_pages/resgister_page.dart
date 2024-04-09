import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/components/ask_if_already_user.dart';
import 'package:meals_app/components/auth_button.dart';
import 'package:meals_app/components/custom_text_field.dart';
import 'package:meals_app/components/heading_title.dart';
import 'package:meals_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:meals_app/helpers/show_snakbar.dart';
import 'package:meals_app/pages/initial_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    bool isLoading = false;
    String? email;
    String? password;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Loading) {
          isLoading = true;
        }
        if (state is RegisterSuccess) {
          isLoading = false;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const InitialPage(),
            ),
          );
        } else if (state is RegisterFailure) {
          isLoading = false;
          if (state.exceptionCode.code == 'weak-password') {
            showMessage(context, 'The password provided is too weak.');
          } else if (state.exceptionCode.code == 'email-already-in-use') {
            showMessage(context, 'The account already exists for that email.');
          } else {
            showMessage(context, 'An Error has Occured');
          }
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
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
                      title: 'Register',
                      size: 35,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Please Sign Up to continue',
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
                      height: 20,
                    ),
                    const CustomFormTextField(
                      fieldIcon: Icons.password,
                      hintText: 'Confirm your password',
                      hideTypedText: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    AuthicationButton(
                      text: 'Sign Up',
                      onpressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).registerUser(
                            email: email!,
                            password: password!,
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AskIfAlreadyUserOrNot(
                      text: "Already have an account?",
                      page: " Sign In",
                      onpressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
