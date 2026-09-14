import 'package:flutter/material.dart';
import 'package:keeptrack/src/features/circuit/domain/circuit.dart';

class MyAppBar extends StatelessWidget {
  const new({super.key, this.circuit});

  final Circuit? circuit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (circuit != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton.outlined(
                        color: Colors.white,
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(121, 41, 41, 41),
                          ),
                        ),
                        onPressed: () => Navigator.of(context).maybePop(),
                        icon: const Icon(Icons.arrow_back),
                      ),

                      const Spacer(),

                      Image.asset(
                        "assets/images/keeptrack_icon.png",
                        width: 50,
                      ),
                    ],
                  )
                else
                  Image.asset("assets/images/KeepTrack_logo.png", width: 230),

                const SizedBox(
                  width: 148,
                  child: Divider(color: Colors.white, thickness: 2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
