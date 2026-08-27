import 'package:flutter_test/flutter_test.dart';
import 'package:keeptrack/src/features/circuits/domain/car.dart';

void main() {
  group('Car', (){
    late Map<String, dynamic> car;
    setUp((){
      car = {
        "name": "Ferrari F1 2004",
        "times": [
          "1:42.987",
          "1:41.234",
          "1:43.501",
          "1:41.890"
        ]
      };
    });

    test("fromJson is perfectly able to create a car object", (){
      final json = car;
      final result = Car.fromJson(json);
      expect(result, isA<Car>());
    });
  });
}