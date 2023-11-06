import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/bloc/auth_bloc/auth_bloc.dart';
import 'package:market/cubits/tabs_box_cubit.dart';
import 'package:market/data/firebase/auth_service.dart';
import 'package:market/data/firebase/user_service.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/repositories/auth_repository.dart';
import 'package:market/repositories/user_repository.dart';
import 'package:market/ui/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  await Firebase.initializeApp();
  runApp(AppLevel(authService: AuthService(), userService: UserService()));
}

class AppLevel extends StatelessWidget {
  const AppLevel({
    super.key,
    required this.authService,
    required this.userService,
  });

  final AuthService authService;
  final UserService userService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => AuthRepository(authService: authService)),
        RepositoryProvider(
            create: (context) => UserRepository(userService: userService)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TabsBoxCubit()),
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
              userRepository: context.read<UserRepository>(),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
