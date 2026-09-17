import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail_screen.dart/modal_bottom_sheet/add_button.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail_screen.dart/modal_bottom_sheet/lap_time_formatter.dart';
import 'package:keeptrack/src/features/user/data/fake_users_repository.dart';
import 'package:keeptrack/src/features/user/domain/user.dart';
import 'package:keeptrack/src/features/voiture/data/fake_voitures_repository.dart';
import 'package:keeptrack/src/features/voiture/domain/voiture.dart';

class BottomSheetAddVoiture extends ConsumerStatefulWidget {
  const new(this.currentUser, this.circuit, {super.key});

  final User currentUser;
  final Circuit circuit;

  @override
  ConsumerState<BottomSheetAddVoiture> createState() =>
      _BottomSheetAddCarState();
}

class _BottomSheetAddCarState extends ConsumerState<BottomSheetAddVoiture> {
  String? selectedBrand;
  String? selectedVoiture;

  int nombreDeTemps = 1;

  final List<TextEditingController> _tempsControllers = [
    TextEditingController(),
  ];

  void _ajouterTemps() {
    setState(() {
      nombreDeTemps++;
      _tempsControllers.add(TextEditingController());
    });
  }

  @override
  void dispose() {
    for (final controller in _tempsControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addPerformance(List<Voiture> voitures) {
    if (selectedBrand == null || selectedVoiture == null) return;

    final tempsList = _tempsControllers
        .map((controller) => controller.text)
        .where((temps) => temps.isNotEmpty)
        .toList();

    if (tempsList.isEmpty) return;

    final voitureSelectionnee = voitures.firstWhere(
      (voiture) => voiture.name == selectedVoiture,
    );

    ref
        .read(fakeUsersRepositoryProvider)
        .addUserPerformance(
          userId: widget.currentUser.id,
          circuit: widget.circuit,
          voiture: voitureSelectionnee,
          temps: tempsList,
        );

    Navigator.of(context).pop();
  }

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
          (voiture) => DropdownMenuEntry(
            value: voiture.name,
            label: voiture.name,
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
        color: const Color.fromARGB(236, 15, 0, 0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Column(
              mainAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      "Ajouter un Temp",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "D3Euronism",
                        fontSize: 22,
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
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "D3Euronism",
                    ),
                  ),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: "D3Euronism",
                  ),
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 0, 0, 0),
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
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "D3Euronism",
                    ),
                  ),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: "D3Euronism",
                  ),
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 5, 5, 5),
                    ),
                  ),
                  dropdownMenuEntries: voitureEntries,
                  onSelected: (value) {
                    setState(() => selectedVoiture = value);
                  },
                ),

                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Temps",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "D3Euronism",
                        fontSize: 20,
                      ),
                    ),
                    Expanded(child: SizedBox(width: 0)),
                    IconButton(
                      onPressed: _ajouterTemps,
                      icon: Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),

                ...List.generate(nombreDeTemps, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: TextFormField(
                      controller: _tempsControllers[index],
                      inputFormatters: [LapTimeFormatter()],
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "D3Euronism",
                      ),
                      decoration: InputDecoration(
                        hintText: "1:23.456",
                        hintStyle: TextStyle(color: Colors.white38),
                        labelText: "Tour ${index + 1}",
                        labelStyle: TextStyle(color: Colors.white70),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white38),
                        ),
                      ),
                    ),
                  );
                }),

                SizedBox(height: 30),

                AddButton(onPressed: () => _addPerformance(voitures)),

                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
