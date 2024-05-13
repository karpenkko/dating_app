import 'package:dating_app/features/creating_profile/repos/creating_profile_repo.dart';
import 'package:dating_app/features/user_connections/repos/user_connections_repo.dart';
import 'package:dating_app/features/user_profile/repos/user_profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'navigation/app_router.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/auth/repos/auth_repo.dart';
import 'features/creating_profile/bloc/creating_profile_bloc.dart';
import 'features/swipe_cards/bloc/swipe_cards_bloc.dart';

import '.env';
import 'features/swipe_cards/repos/swiping_cards_repo.dart';
import 'features/switching_themes/bloc/theme_bloc.dart';
import 'features/user_connections/bloc/user_connections_bloc.dart';
import 'features/user_profile/bloc/user_profile_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
  await dotenv.load(fileName: "lib/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            AuthRepository(),
          ),
        ),
        BlocProvider<CreatingProfileBloc>(
          create: (context) => CreatingProfileBloc(CreatingProfileRepo()),
        ),
        BlocProvider<SwipeCardsBloc>(
          create: (context) => SwipeCardsBloc(SwipingCardsRepo()),
        ),
        BlocProvider<UserConnectionsBloc>(
          create: (context) => UserConnectionsBloc(
            UserConnectionsRepo(),
          ),
        ),
        BlocProvider<UserProfileBloc>(
          create: (context) => UserProfileBloc(
            UserProfileRepo(),
          ),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc()..add(InitialThemeSetEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, state) {
          return PopScope(
            canPop: true,
            onPopInvoked: (didPop) {},
            child: MaterialApp.router(
              title: 'Dator',
              debugShowCheckedModeBanner: false,
              theme: state,
              routerConfig: router,
            ),
          );
        },
      ),
    );
  }
}
