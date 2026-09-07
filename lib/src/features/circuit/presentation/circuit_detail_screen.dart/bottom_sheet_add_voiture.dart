import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/features/voiture/data/fake_voitures_repository.dart';

class BottomSheetAddVoiture extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<BottomSheetAddVoiture> createState() =>
      _BottomSheetAddCarState();
}

class _BottomSheetAddCarState extends ConsumerState<BottomSheetAddVoiture> {
  String? selectedBrand;
  String? selectedVoiture;
  final List<TextEditingController> _tempsControllers = [
    TextEditingController(),
  ];

  void _ajouterTemps() {
    setState(() {
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
                      const Color.fromARGB(255, 39, 39, 39),
                    ),
                  ),
                  dropdownMenuEntries: voitureEntries,
                  onSelected: (value) {
                    setState(() => selectedVoiture = value);
                  },
                ),

                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: .start,
                  children: [
                    Text(
                      "Temps :",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "D3Euronism",
                        fontSize: 18,
                      ),
                    ),
                    Expanded(child: SizedBox(width: 0)),
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: _ajouterTemps,
                    ),
                  ],
                ),
                Divider(thickness: 2.0, color: Colors.white),

                ...List.generate(_tempsControllers.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _tempsControllers[index],
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              hintText: "ex: 1:23.456",
                              hintStyle: TextStyle(color: Colors.white54),
                              labelText: "Tour ${index + 1}",
                              labelStyle: TextStyle(color: Colors.white70),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white38),
                              ),
                            ),
                          ),
                        ),
                        // on garde toujours au moins un champ visible
                      ],
                    ),
                  );
                }),

                SizedBox(height: 30),

                
                ElevatedButton(
                  onPressed: () {
                    // Récupère les temps saisis (on ignore les champs vides)
                    final tempsList = _tempsControllers
                        .map((c) => c.text.trim())
                        .where((t) => t.isNotEmpty)
                        .toList();
                  },
                  child: Text("Valider"),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
