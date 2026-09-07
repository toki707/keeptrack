import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/features/circuit/data/fake_circuits_repository.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail_screen.dart/car_result_card.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail_screen.dart/circuit_infos.dart';
import 'package:keeptrack/src/features/user/data/fake_users_repository.dart';
import 'package:keeptrack/src/features/voiture/data/fake_voitures_repository.dart';

class CircuitDetailScreen extends ConsumerWidget {
  const new(this.circuitId, {super.key});

  final String circuitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final circuitRepository = ref.watch(fakeCircuitsRepositoryProvider);
    final circuit = circuitRepository.getCircuitById(circuitId);

    final userRepoistory = ref.watch(fakeUsersRepositoryProvider);
    final currentUser = userRepoistory.getUserById("1");
    final performance = currentUser.performances.firstWhere(
      (performance) => performance.circuit.id == circuit.id,
    );

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
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 55,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://flagcdn.com/w160/${circuit.location}.png",
                          ),
                        ),
                      ),
                      child: Expanded(child: SizedBox(width: 0)),
                    ),
                  ],
                ),
                Image.asset(circuit.outline!, width: 500),
                SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Info :",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "D3Euronism",
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 3.0),

                CircuitInfos(circuit: circuit),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Temps realisees :",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "D3Euronism",
                        fontSize: 18,
                      ),
                    ),

                    Expanded(child: SizedBox(width: 0)),

                    IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return BottomSheetAddVoiture();
                          },
                        );
                      },
                    ),
                  ],
                ),
                Divider(thickness: 3.0),

                CarResultCard(performance),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetAddVoiture extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<BottomSheetAddVoiture> createState() => _BottomSheetAddCarState();
}

class _BottomSheetAddCarState extends ConsumerState<BottomSheetAddVoiture> {
  String? selectedBrand;
  String? selectedVoiture;

  @override
  Widget build(BuildContext context) {
    final voitureRepository = ref.watch(fakeVoituresRepositoryProvider);
    final voitures = voitureRepository.getVoituresList();

    List<String> brands = [];

    for (var voiture in voitures) {
      brands.add(voiture.brand!);
    }

    List<DropdownMenuEntry<String>> brandEntries = brands
        .toSet()
        .toList()
        .map(
          (brand) => DropdownMenuEntry(
            value: brand,
            label: brand,
            style: MenuItemButton.styleFrom(
              textStyle: TextStyle(fontFamily: "D3Euronism"),
              foregroundColor: Colors.white,
            ),
          ),
        )
        .toList();

    List<DropdownMenuEntry<String>> voitureEntries = voitures
        .where((voiture) => voiture.brand == selectedBrand)
        .map(
          (v) => DropdownMenuEntry(
            value: v.name, // adapte selon le champ qui identifie ta voiture (ex: v.model)
            label: v.name,
            style: MenuItemButton.styleFrom(
              textStyle: TextStyle(fontFamily: "D3Euronism"),
              foregroundColor: Colors.white,
            ),
          ),
        )
        .toList();

    return Container(
      height: 900,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 39, 39, 39),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          mainAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            Row(
              mainAxisAlignment: .center,
              children: [
                Text(
                  "Ajouter une voiture",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "D3Euronism",
                    fontSize: 15,
                  ),
                ),
              ],
            ),

            SizedBox(
              width: 70,
              child: Divider(thickness: 2.0, color: Colors.white),
            ),

            SizedBox(height: 50),

            DropdownMenu<String>(
              width: 500,
              initialSelection: brands.first,
              requestFocusOnTap: true,
              label: Text(
                "marque",
                style: TextStyle(color: Colors.white, fontFamily: "D3Euronism"),
              ),
              textStyle: TextStyle(
                color: Colors.white,
                fontFamily: "D3Euronism",
              ),
              menuStyle: MenuStyle(
                backgroundColor: WidgetStatePropertyAll(
                  const Color.fromARGB(255, 39, 39, 39),
                ),
              ),
              dropdownMenuEntries: brandEntries,
              onSelected: (value) {
                setState(() {
                  selectedBrand = value;
                  selectedVoiture = null;
                });
              },
            ),

            SizedBox(height: 20),

            DropdownMenu<String>(
              key: ValueKey(selectedBrand),
              width: 500,
              enabled: selectedBrand != null,
              requestFocusOnTap: true,
              label: Text(
                "voiture",
                style: TextStyle(color: Colors.white, fontFamily: "D3Euronism"),
              ),
              textStyle: TextStyle(
                color: Colors.white,
                fontFamily: "D3Euronism",
              ),
              menuStyle: MenuStyle(
                backgroundColor: WidgetStatePropertyAll(
                  const Color.fromARGB(255, 39, 39, 39),
                ),
              ),
              dropdownMenuEntries: voitureEntries,
              onSelected: (value) {
                setState(() => selectedVoiture = value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
