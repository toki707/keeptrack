import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/common_widget/aura_background.dart';
import 'package:keeptrack/src/common_widget/my_app_bar.dart';
import 'package:keeptrack/src/common_widget/tab_item.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
import 'package:keeptrack/src/features/circuit/presentation/list_circuits/list_circuits_screen.dart';
import 'package:keeptrack/src/features/user/data/fake_users_repository.dart';
import 'package:keeptrack/src/features/user/domain/user.dart';
import 'package:keeptrack/src/features/user/presentation/user_home/last_result.dart';
import 'package:keeptrack/src/features/user/presentation/user_home/last_track_driven.dart';

class UserHomeScreen extends ConsumerWidget {
  const UserHomeScreen({super.key, this.user, this.circuit});

  final User? user;
  final Circuit? circuit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersRepository = ref.watch(fakeUsersRepositoryProvider);
    final users = usersRepository.getUsersList();

    final size = MediaQuery.sizeOf(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 38, 0, 0),
          child: AuraBackground(
            colors: [
              const Color.fromARGB(99, 255, 1, 1),
              Colors.black,
              const Color.fromARGB(54, 204, 0, 0),
            ],
            points: [
              Alignment.topLeft,
              Alignment(12, 0),
              Alignment.bottomCenter,
            ],
            radiuses: [500, 100, 500],
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyAppBar(),
                  SizedBox(height: 20),

                  Container(
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(180, 22, 22, 22),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      border: BoxBorder.all(
                        color: const Color.fromARGB(64, 182, 182, 182),
                        width: 2,
                      ),
                    ),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        color: const Color.fromARGB(255, 139, 9, 0),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),

                      tabs: [
                        TabItem(title: 'Home'),
                        TabItem(title: 'Circuits'),
                        TabItem(title: 'Profile'),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),
                  SizedBox(
                    width: size.height,
                    height: size.height - 198,
                    child: TabBarView(
                      children: [
                        HomeScreen(users),
                        ListCircuitsScreen(),
                        Placeholder(),
                      ],
                    ),
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

class HomeScreen extends StatelessWidget {
  const new(this.users, {super.key});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .start,
          children: [
            Text(
              "Dernier Resultat :",
              style: TextStyle(
                fontFamily: "D3Euronism",
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Divider(color: Colors.white, thickness: 2),
        SizedBox(height: 10),
        LastResult(users.first),
        SizedBox(height: 70),
        Row(
          mainAxisAlignment: .start,
          children: [
            Text(
              "Derniers Circuits roules :",
              style: TextStyle(
                fontFamily: "D3Euronism",
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Divider(color: Colors.white, thickness: 2),
        Expanded(
          child: ListView.builder(
            itemCount: users.first.performances.length,
            itemBuilder: (context, index) {
              final circuit = users.first.performances[index].circuit;
              return LastTrackDriven(circuit);
            },
          ),
        ),
      ],
    );
  }
}
