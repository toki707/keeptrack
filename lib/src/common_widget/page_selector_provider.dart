import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppPage { home, circuits, profil }

final selectedPageProvider = StateProvider<AppPage>((ref) => AppPage.home);

class NavPageToggle extends ConsumerWidget {
  const NavPageToggle({super.key});

  static const Map<AppPage, String> _labels = {
    AppPage.home: 'Home',
    AppPage.circuits: 'Circuits',
    AppPage.profil: 'Profil',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedPageProvider);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: _labels.entries.map((entry) {
          final bool isSelected = selected == entry.key;
          return Expanded(
            child: GestureDetector(
              onTap: () =>
                  ref.read(selectedPageProvider.notifier).state = entry.key,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 14,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF000000)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(46),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    entry.value,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
