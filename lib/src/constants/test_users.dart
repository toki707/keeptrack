import 'package:keeptrack/src/features/circuit/domain/circuit.dart';
import 'package:keeptrack/src/features/user/domain/performance.dart';
import 'package:keeptrack/src/features/user/domain/user.dart';
import 'package:keeptrack/src/features/voiture/domain/voiture.dart';

List<User> testUsers = [
  User(
    id: "1",
    name: "cp-24jon",
    performances: [
      Performance(
        circuit: Circuit(
          id: "1",
          name: "Monza",
          location: "it",
          country: "Italie",
          city: "Monza (DI)",
          preview: "assets/images/tracks/previews/monza.png",
          outline: "assets/images/tracks/outlines/monza.png",
        ),
        voiture: Voiture(id: "1", name: "Mclaren P1"),
        temps: ["1:31.245", "1:32.055", "1:31.789", "1:31.583"],
      ),
      Performance(
        circuit: Circuit(
          id: "2",
          name: "Spa",
          location: "be",
          country: "Belgique",
          city: "Francorchamps",
          preview: "assets/images/tracks/previews/spa.png",
          outline: "assets/images/tracks/outlines/spa.png",
        ),
        voiture: Voiture(id: "2", name: "Ferrari F2004"),
        temps: ["1:42.987", "1:41.234", "1:43.501", "1:41.890"],
      ),
    ],
  ),
];
