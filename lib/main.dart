import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'app_router.dart';
import 'features/creating_profile/bloc/creating_profile_bloc.dart';
import 'features/swipe_cards/bloc/swipe_cards_bloc.dart';

import '.env';

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
        BlocProvider<CreatingProfileBloc>(
          create: (context) => CreatingProfileBloc(),
        ),
        BlocProvider<SwipeCardsBloc>(
          create: (context) => SwipeCardsBloc(),
        ),
      ],
      child: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {},
        child: MaterialApp.router(
          title: 'Dator',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}
