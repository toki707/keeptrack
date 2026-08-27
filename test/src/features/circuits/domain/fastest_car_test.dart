import 'package:flutter_test/flutter_test.dart';
import 'package:keeptrack/src/features/circuits/domain/fastest_car.dart';

void main() {
  group("Fastest Car", () {
    late Map<String, dynamic> fastestCar;
    setUp(() {
      fastestCar = {"car": "Ferrari F1 2004", "time": "1:41.234"};
    });

    test("fromJson is perfectly able to create a fastestCar object", () {
      final json = fastestCar;
      final result = FastestCar.fromJson(json);
      expect(result, isA<FastestCar>());
    });
  });
}
