import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeptrack/src/common_widget/app_background.dart';
import 'package:keeptrack/src/common_widget/my_app_bar.dart';
import 'package:keeptrack/src/common_widget/section_title.dart';
import 'package:keeptrack/src/constants/app_sizes.dart';
import 'package:keeptrack/src/features/circuit/data/fake_circuits_repository.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail/car_result_card.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail/circuit_infos.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail/track_pres.dart';
import 'package:keeptrack/src/features/user/data/fake_users_repository.dart';
import 'package:keeptrack/src/features/circuit/presentation/circuit_detail/modal_bottom_sheet/bottom_sheet_add_voiture.dart';
import 'package:keeptrack/src/features/user/domain/voiture_performance.dart';
import 'package:keeptrack/theme/theme.dart';

class CircuitDetailScreen extends ConsumerWidget {
  const CircuitDetailScreen(this.circuitId, {super.key});

  final String circuitId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final circuitRepository = ref.watch(fakeCircuitsRepositoryProvider);
    final circuit = circuitRepository.getCircuitById(circuitId);

    final userReposistory = ref.watch(fakeUsersRepositoryProvider);
    final currentUser = userReposistory.getUserById("1");

    final List<VoiturePerformance> voituresDuCircuit = currentUser.performances
        .where((performance) => performance.circuit.id == circuit.id)
        .expand((performance) => performance.voitures)
        .toList();

    return Scaffold(
      body: AppBackground(
        child: ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: Sizes.p400,
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
                                AppColors.headerShadow,
                                Colors.transparent,
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.p16,
                            vertical: Sizes.p12,
                          ),
                          child: MyAppBar(circuit: circuit),
                        ),
                        gapH32,
                        TrackPres(circuit),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      CircuitCaracteristiques(circuit),
                      gapH40,
                      SectionTitle(
                        "Temps realises :",
                        trailing: IconButton.outlined(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.addIconButton,
                            ),
                          ),
                          icon: Icon(Icons.add, color: AppColors.textColor),
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return BottomSheetAddVoiture(
                                  currentUser,
                                  circuit,
                                );
                              },
                            );
                          },
                        ),
                      ),

                      ...voituresDuCircuit
                          .map(
                            (voiturePerformance) => Padding(
                              padding: const EdgeInsets.only(top: Sizes.p8),
                              child: CarResultCard(voiturePerformance),
                            ),
                          )
                          .toList()
                          .reversed,

                      gapH12,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
