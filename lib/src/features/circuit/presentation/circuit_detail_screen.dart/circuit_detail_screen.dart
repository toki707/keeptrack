import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/features/circuit/data/fake_circuits_repository.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail_screen.dart/car_result_card.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail_screen.dart/circuit_infos.dart';
import 'package:keeptrack/src/features/user/data/fake_users_repository.dart';
import 'package:keeptrack/src/features/voiture/data/fake_voitures_repository.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail_screen.dart/bottom_sheet_add_voiture.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail_screen.dart/car_result_card.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail_screen.dart/circuit_infos.dart';
import 'package:keeptrack/src/features/user/data/fake_users_repository.dart';

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
