import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/features/circuit/data/fake_circuits_repository.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
import 'package:keeptrack/src/features/circuit/presentation/list_circuits/circuit_card.dart';

class ListCircuitsScreen extends ConsumerStatefulWidget {
  const ListCircuitsScreen({super.key});

  @override
  ConsumerState<ListCircuitsScreen> createState() => _ListCircuitsScreenState();
}

class _ListCircuitsScreenState extends ConsumerState<ListCircuitsScreen> {
  String _searchText = '';
  List<Circuit> _filteredCircuits = [];

  @override
  Widget build(BuildContext context) {
    final circuitsRepository = ref.watch(fakeCircuitsRepositoryProvider);
    final circuits = circuitsRepository.getCircuitsList();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SearchBar(
              hintText: "Rechercher...",
              hintStyle: WidgetStatePropertyAll(
                TextStyle(
                  fontFamily: "D3Euronism",
                  color: const Color.fromARGB(109, 223, 176, 176),
                  fontSize: 18,
                ),
              ),
              leading: Icon(
                Icons.search,
                color: const Color.fromARGB(109, 223, 176, 176),
              ),
              backgroundColor: WidgetStatePropertyAll(
                const Color.fromARGB(117, 0, 0, 0),
              ),
              textStyle: WidgetStatePropertyAll(
                TextStyle(
                  fontFamily: "D3Euronism",
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              shadowColor: WidgetStatePropertyAll(Colors.transparent),
              side: WidgetStatePropertyAll(
                BorderSide(
                  color: const Color.fromARGB(155, 90, 89, 89),
                  width: 2,
                ),
              ),
              onChanged: (text) {
                setState(() {
                  _searchText = text;
                  if (text.isNotEmpty) {
                    _filteredCircuits = circuits
                        .where(
                          (circuit) => circuit.name.toLowerCase().contains(
                            text.toLowerCase(),
                          ),
                        )
                        .toList();
                  } else {
                    Text(
                      "Aucun circuit trouvé",
                      style: TextStyle(
                        fontFamily: "D3Euronism",
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    );
                  }
                });
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _searchText.isEmpty
                  ? circuits.length
                  : _filteredCircuits.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) {
                if (_searchText.isEmpty) {
                  final circuit = circuits[index];
                  return CircuitCard(circuit);
                }

                final circuit = _filteredCircuits[index];
                return CircuitCard(circuit);
              },
            ),
          ),
        ],
      ),
    );
  }
}
