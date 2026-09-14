import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/common_widget/aura_background.dart';
import 'package:keeptrack/src/common_widget/my_app_bar.dart';
import 'package:keeptrack/src/features/circuit/data/fake_circuits_repository.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail_screen.dart/car_result_card.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail_screen.dart/circuit_infos.dart';
import 'package:keeptrack/src/features/user/data/fake_users_repository.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail_screen.dart/bottom_sheet_add_voiture.dart';

class CircuitDetailScreen extends ConsumerWidget {
  const new(this.circuitId, {super.key});

  final String circuitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final circuitRepository = ref.watch(fakeCircuitsRepositoryProvider);
    final circuit = circuitRepository.getCircuitById(circuitId);

    final userReposistory = ref.watch(fakeUsersRepositoryProvider);
    final currentUser = userReposistory.getUserById("1");
    final performance = currentUser.performances.firstWhere(
      (performance) => performance.circuit.id == circuit.id,
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),

      body: Container(
        color: const Color.fromARGB(255, 38, 0, 0),
        child: AuraBackground(
          colors: [
            const Color.fromARGB(99, 255, 1, 1),
            Colors.black,
            const Color.fromARGB(54, 204, 0, 0),
          ],
          points: [Alignment.topLeft, Alignment(12, 0), Alignment.bottomCenter],
          radiuses: [500, 100, 500],
          child: ListView(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 500,
                        height: 500,
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: .topCenter,
                              end: .bottomCenter,
                              colors: [Colors.black, Colors.transparent],
                              stops: [0, 1.0],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.dstIn,
                          child: Image.asset(circuit.preview!, fit: .cover),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: .topCenter,
                                end: .bottomCenter,
                                colors: [
                                  const Color.fromARGB(190, 0, 0, 0),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: MyAppBar(circuit: circuit),
                          ),
                          SizedBox(height: 50),
                          TrackPres(circuit),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        CircuitInfos(circuit: circuit),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Temps realises :",
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
                                    return BottomSheetAddVoiture(currentUser);
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
            ],
          ),
        ),
      ),
    );
  }
}

class TrackPres extends StatelessWidget {
  const new(this.circuit, {super.key});

  final Circuit circuit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: .start,

        children: [
          Row(
            crossAxisAlignment: .center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://flagcdn.com/w160/${circuit.location}.png",
                ),
              ),
              SizedBox(width: 8),

              Text(
                circuit.name,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "D3Euronism",
                  fontSize: 50,
                ),
              ),
            ],
          ),

          SizedBox(height: 4),

          Text(
            circuit.description!,
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontFamily: "D3Euronism",
              fontSize: 30,
            ),
          ),

          SizedBox(height: 40),

          Text(
            "${circuit.country}, ${circuit.city}",
            style: TextStyle(
              color: const Color.fromARGB(188, 255, 255, 255),
              fontFamily: "D3Euronism",
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
