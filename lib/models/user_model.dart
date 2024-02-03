class UserModel{
  const UserModel({required this.firstName, required this.lastName, required this.height, required this.weight, required this.dob});

  final String firstName;
  final String lastName;
  final int height;
  final double weight;
  final DateTime dob;
}
