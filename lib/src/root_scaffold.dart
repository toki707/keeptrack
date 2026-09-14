import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/common_widget/page_selector_provider.dart';
import 'package:keeptrack/src/features/user/presentation/user_home/user_home_screen.dart';

class RootScaffold extends ConsumerWidget {
  const RootScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPage = ref.watch(selectedPageProvider);

    return Scaffold(
      body: switch (selectedPage) {
        AppPage.home => UserHomeScreen(),
        AppPage.circuits => UserHomeScreen(),
        AppPage.profil => UserHomeScreen(),
      },
      bottomNavigationBar: const NavPageToggle(),
    );
  }
}
