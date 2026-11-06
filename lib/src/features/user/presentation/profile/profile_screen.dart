import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/common_widget/styled_text.dart';
import 'package:keeptrack/src/constants/app_sizes.dart';
import 'package:keeptrack/src/features/user/domain/user.dart';

class ProfileScreen extends ConsumerWidget {
  const new(this.user, {super.key});

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 1000,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(user.banner!),
                      opacity: 0.8,
                      fit: .fitWidth,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 150),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(user.pfp!),
                    radius: 50,
                  ),
                ),
              ],
            ),

            StyledText(user.name!, fontSize: Sizes.p32),
          ],
        ),
      ],
    );
  }
}
