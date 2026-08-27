import 'package:keeptrack/src/features/circuits/domain/car.dart';
import 'package:keeptrack/src/features/circuits/domain/circuit.dart';
import 'package:keeptrack/src/features/circuits/domain/fastest_car.dart';

List<Circuit> testCircuits = [
  Circuit(
    id: "1",
    name: "Circuit de Spa-Francorchamps",
    country: "Belgique",
    lengthKm: 7.004,
    fastestCar: FastestCar(name: "Ferrari F1 2004", time: "1:41.234"),
    cars: [
      Car(
        name: "Ferrari F1 2004",
        time: ["1:42.987", "1:41.234", "1:43.501", "1:41.890"],
      ),
      Car(
        name: "Porsche 918 Spyder",
        time: ["2:05.412", "2:04.876", "2:06.203"],
      ),
      Car(
        name: "Mclaren P1",
        time: ["2:03.998", "2:04.512", "2:03.654", "2:05.001"],
      ),
    ],
  ),
  Circuit(
    id: "2",
    name: "Silverstone Circuit",
    country: "Royaume-Uni",
    lengthKm: 5.891,
    fastestCar: FastestCar(name: "Ferrari LaFerrari", time: "1:38.452"),
    cars: [
      Car(
        name: "Ferrari LaFerrari",
        time: ["1:39.876", "1:38.452", "1:40.120"],
      ),
      Car(
        name: "Abarth 500",
        time: ["2:15.334", "2:14.789", "2:16.045", "2:14.998"],
      ),
      Car(name: "Mclaren P1", time: ["1:41.223", "1:40.876", "1:41.998"]),
    ],
  ),
  Circuit(
    id: "3",
    name: "Nürburgring 24H",
    country: "Allemagne",
    lengthKm: 25.378,
    fastestCar: FastestCar(name: "Porsche 918 Spyder", time: "8:12.456"),
    cars: [
      Car(
        name: "Porsche 918 Spyder",
        time: ["8:15.789", "8:12.456", "8:18.234"],
      ),
      Car(
        name: "Ferrari LaFerrari",
        time: ["8:20.112", "8:22.876", "8:19.543", "8:21.998"],
      ),
      Car(name: "Abarth 500", time: ["10:45.678", "10:52.334", "10:48.901"]),
    ],
  ),
];
