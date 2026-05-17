class CreateTrainingParams {
  final String email;
  final String role;
  final String title;
  final String description;
  final String companyName;
  final String locationAddress;
  final String province;
  final String city;
  final String district;
  final String village;
  final DateTime dateOfTraining;
  final int feePerPerson;
  final String bankName;
  final String bankAccountNumber;
  final String bankAccountHolderName;
  final List<String> facilities;
  final List<String> imagePaths;

  const CreateTrainingParams({
    required this.email,
    required this.role,
    required this.title,
    required this.description,
    required this.companyName,
    required this.locationAddress,
    required this.province,
    required this.city,
    required this.district,
    required this.village,
    required this.dateOfTraining,
    required this.feePerPerson,
    required this.bankName,
    required this.bankAccountNumber,
    required this.bankAccountHolderName,
    this.facilities = const [],
    this.imagePaths = const [],
  });
}
