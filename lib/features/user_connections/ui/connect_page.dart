import 'package:dating_app/widgets/round_copmonents/round_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../switching_themes/utils/colors.dart';
import '../../../widgets/cards/connect_card.dart';
import '../bloc/user_connections_bloc.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({super.key});

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  @override
  void initState() {
    BlocProvider.of<UserConnectionsBloc>(context).add(
      UserConnectionsFetchEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserConnectionsBloc, UserConnectionsState>(
      builder: (context, state) {
        if (state is UserConnectionsInitial) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is UserConnectionsFetch) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                    child: Column(
                      children: [
                        const RoundTitle(titleText: 'ваші конекти'),
                        const SizedBox(height: 60),
                        ...state.users.map((user) => Column(
                          children: [
                            ConnectCard(user: user),
                            const SizedBox(height: 30),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Сталася помилка під час завантаження вподобань.'),
            ),
          );
        }
      },
    );
  }
}
