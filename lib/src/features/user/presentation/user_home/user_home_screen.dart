import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:keeptrack/src/features/user/data/fake_users_repository.dart';
import 'package:keeptrack/src/features/user/presentation/user_home/last_result.dart';
import 'package:keeptrack/src/features/user/presentation/user_home/last_track_driven.dart';

class UserHomeScreen extends ConsumerWidget {
  const UserHomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersRepository = ref.watch(fakeUsersRepositoryProvider);
    final users = usersRepository.getUsersList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Column(
          children: [
            SizedBox(height: 10),
            Image.asset("assets/images/KeepTrack_logo.png", width: 200),
            SizedBox(
              width: 148,
              child: Divider(color: Colors.white, thickness: 2),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => context.go('/'),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
                    color: const Color.fromARGB(255, 131, 131, 131),
                    child: Text(
                      "Home",
                      style: TextStyle(
                        fontFamily: "D3Euronism",
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => context.go('/list'),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
                    color: const Color.fromARGB(255, 131, 131, 131),
                    child: Text(
                      "Circuits",
                      style: TextStyle(
                        fontFamily: "D3Euronism",
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
                    color: const Color.fromARGB(255, 131, 131, 131),
                    child: Text(
                      "profil",
                      style: TextStyle(
                        fontFamily: "D3Euronism",
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(color: Colors.white, thickness: 2),
            Text(
              "Dernier Resultat",
              style: TextStyle(fontFamily: "D3Euronism", color: Colors.white),
            ),
            Divider(color: Colors.white, thickness: 2),
            SizedBox(height: 10),
            LastResult(users.first),
            SizedBox(height: 70),
            Divider(color: Colors.white, thickness: 2),
            Text(
              "Dernier Resultat",
              style: TextStyle(fontFamily: "D3Euronism", color: Colors.white),
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
        ),
      ),
    );
  }
}
