import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeptrack/src/common_widget/flag_avatar.dart';
import 'package:keeptrack/src/common_widget/styled_text.dart';
import 'package:keeptrack/src/constants/app_sizes.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
import 'package:keeptrack/theme/theme.dart';

class CircuitCard extends StatelessWidget {
  const CircuitCard(this.circuit, {super.key});

  final Circuit circuit;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () =>
          context.goNamed("circuitDetail", pathParameters: {'id': circuit.id}),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(circuit.preview!),
            fit: BoxFit.fitHeight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.p16)),
        ),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            Image.asset(circuit.outline!, width: size.width * 0.35),
            Expanded(child: SizedBox(height: 0)),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.p8,
                horizontal: Sizes.p8,
              ),
              decoration: BoxDecoration(
                color: AppColors.cardNameBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Sizes.p16),
                  bottomRight: Radius.circular(Sizes.p16),
                ),
              ),
              child: Row(
                mainAxisSize: .max,
                mainAxisAlignment: .start,
                children: [
                  Expanded(
                    child: StyledText(
                      circuit.name,
                      fontSize: Sizes.p20,
                      maxLines: 1,
                    ),
                  ),
                  gapW8,
                  FlagAvatar(circuit.location, radius: Sizes.p12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
