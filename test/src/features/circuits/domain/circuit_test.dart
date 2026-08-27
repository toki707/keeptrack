import 'package:flutter_test/flutter_test.dart';
import 'package:keeptrack/src/features/circuits/domain/circuit.dart';

void main() {
  group('Circuit', () {
    late Map<String, dynamic> spa;
    setUp(() {
      spa = {
        "_id": "6a82f5c8f30ec9c08d94324c",
        "name": "Spa",
        "country": "Belgique",
        "length_km": 7.004,
        "fastest_car": {"car": "Ferrari F1 2004", "time": "1:41.234"},
        "cars": [
          {
            "name": "Ferrari F1 2004",
            "times": ["1:42.987", "1:41.234", "1:43.501", "1:41.890"],
          },
          {
            "name": "Porsche 918 Spyder",
            "times": ["2:05.412", "2:04.876", "2:06.203"],
          },
          {
            "name": "Mclaren P1",
            "times": ["2:03.998", "2:04.512", "2:03.654", "2:05.001"],
          },
        ],
        "year_creation": 1921,
        "highest_point": "470m",
        "lowest_point": "373m",
      };
    });

    test(
      "fromJson is perfectly able to create a circuits object",
      () {
        final json = spa;
        final result = Circuit.fromJson(json);

        expect(result, isA<Circuit>());
      },
    );
  });
}
