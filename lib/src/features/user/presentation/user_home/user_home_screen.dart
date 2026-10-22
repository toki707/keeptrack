import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/common_widget/app_background.dart';
import 'package:keeptrack/src/common_widget/my_app_bar.dart';
import 'package:keeptrack/src/common_widget/section_title.dart';
import 'package:keeptrack/src/common_widget/tab_item.dart';
import 'package:keeptrack/src/constants/app_sizes.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
import 'package:keeptrack/src/features/circuit/presentation/list_circuits/list_circuits_screen.dart';
import 'package:keeptrack/src/features/user/data/fake_users_repository.dart';
import 'package:keeptrack/src/features/user/domain/user.dart';
import 'package:keeptrack/src/features/user/presentation/user_home/last_result.dart';
import 'package:keeptrack/src/features/user/presentation/user_home/last_track_driven.dart';
import 'package:keeptrack/theme/theme.dart';

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
        body: AppBackground(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.p12,
              horizontal: Sizes.p16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyAppBar(),
                gapH20,

                Container(
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: AppColors.tabBarColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Sizes.p100),
                    ),
                    border: BoxBorder.all(
                      color: AppColors.tabBarBorder,
                      width: 2,
                    ),
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Sizes.p100),
                      ),
                    ),

                    tabs: [
                      TabItem(title: 'Home'),
                      TabItem(title: 'Circuits'),
                      TabItem(title: 'Profile'),
                    ],
                  ),
                ),

                gapH32,
                Expanded(
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
        SectionTitle("Dernier Resultat :"),
        gapH12,
        LastResult(users.first),
        gapH64,
        SectionTitle("Derniers Circuits roules :"),
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
