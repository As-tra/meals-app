import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:meals_app/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:meals_app/cubits/image_cubit/image_cubit.dart';
import 'package:meals_app/cubits/tags_cubit/tags_cubit.dart';
import 'package:meals_app/pages/intro_pages/page0.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MealsApp());
}

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoritesCubit(),
        ),
        BlocProvider(
          create: (context) => TagsCubit(),
        ),
        BlocProvider(
          create: (context) => ImageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage0(),
      ),
    );
  }
}
