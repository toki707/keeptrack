import 'package:keeptrack/src/features/voiture/domain/specs.dart';
import 'package:keeptrack/src/features/voiture/domain/voiture.dart';

List<Voiture> testVoitures = [
  Voiture(
    id: "1",
    name: "Mclaren P1",
    brand: "Mclaren",
    description: "The astonishing new McLaren P1™ has a clear goal - to be the best driver's car in the world on road and track. To achieve this objective, McLaren is using all of its 50 years of racing experience and success, especially in the fields of aerodynamics and lightweight carbon fibre technology.The result is a car that has an unprecedented amount of downforce for a road vehicle. Similar levels to a GT3 racing car and yet with even greater ground effect. This downforce not only boosts cornering and braking performance. It also helps balance, stability and driveability at all speeds.</br></br> The best driver's car in the world must also have exceptional straight-line performance and instant throttle response. To deliver this, the McLaren P1™ uses an innovative IPAS petrol-electric powertrain comprising a substantially revised 3.8-litre twin-turbo V8 petrol engine, coupled to a single electric motor, collectively known as M838TQ. Combined power output is 916 PS. As important as absolute power is the electric motor's ability to provide instant torque, making the powertrain superbly responsive.</br></br> Top speed is electronically limited to 350 km/h, with the 0-100 km/h standing start acceleration taking less than three seconds. The McLaren P1™ will power from rest to 200 km/h in less than seven seconds, and on to 300 km/h in less than 17 seconds - a full five seconds quicker than the McLaren F1.",
    tags: ["#Hypercars", "rwd", "street", "semiautomatic", "great britain"],
    classCar: "street",
    specs: Specs(
      bhp: "903bhp",
      torque: "900Nm",
      weight: "1450kg",
      topSpeed: "350km/h",
      acceleration: "2.8s 0-100",
      pwratio: "1.60kg/hp",
      range: 135,
    ),
  ),
  Voiture(
    id: "2",
    name: "Ferrari F2004",
    brand: "Ferrari",
    description: "The year 2004, the record season for Ferrari, went into a second act with the 2004 Championship: out of the 18 GPs, the Scuderia won 15 races (13 by Schumacher, 2 by Barrichello), 8 one-two wins, 12 pole positions for a total of 262 points in the Constructors' Championship. Already in August, Ferrari archived the Championship files: at the Hungarian GP the Scuderia won the Constructors' Title – the 14th in its history – with a one-two win, while Schumacher gained his fifth title in a row, the seventh of his career, in Belgium, on the same track where he debuted in the year 1991. The season made history also thanks to one of the most competitive single-seaters ever built: the F2004, fitted with the new engine dubbed 053, a 10-cylinder unit with 865 bhp at 18,300 rpm, which exceeded all expectations in terms of performance and reliability, also regarding the new challenge set by the regulations, which aimed at reducing costs: one engine per race weekend, with an average lifespan of 800 instead of 350 kilometres.",
    tags: [
      "#F2004",
      "rwd",
      "race",
      "sequential",
      "gp",
      "singleseater",
      "italy",
    ],
    classCar: "race",
    specs: Specs(
      bhp: "865bhp",
      torque: "--Nm",
      weight: "--kg",
      topSpeed: "--kn/h",
      acceleration: "--s 0-100",
      pwratio: "--kg/hp",
    ),
  ),
];
