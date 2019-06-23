import 'package:dafluta/dafluta.dart';

class Office {
  final String address;
  final int numberOfEmployees;

  Office(this.address, this.numberOfEmployees);

  static Office fromJson(JsonData json) => Office(
        json.string('address'),
        json.integer('numberOfEmployees'),
      );

  Map<String, dynamic> toJson() {
    return {'address': address, 'numberOfEmployees': numberOfEmployees};
  }
}
