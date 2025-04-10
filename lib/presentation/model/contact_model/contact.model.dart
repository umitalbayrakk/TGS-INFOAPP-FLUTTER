// Contact Models Class...
class Contact {
  final String name;
  final String surname;
  final String birthDate;
  final String phone;

  Contact({required this.name, required this.surname, required this.birthDate, required this.phone});
  
  Map<String, String> toJson() => {'name': name, 'surname': surname, 'birthDate': birthDate, 'phone': phone};
  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'] as String,
      surname: json['surname'] as String,
      birthDate: json['birthDate'] as String,
      phone: json['phone'] as String,
    );
  }
}
