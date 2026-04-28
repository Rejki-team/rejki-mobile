class CreateTrainingParams {
  final String title;
  final String description;
  final String companyName;
  final String locationAddress;
  final DateTime dateOfTraining;
  final int feePerPerson;
  final String bankName;
  final String bankAccountNumber;
  final String bankAccountHolderName;
  final List<String> facilities;
  final List<String> imagePaths;

  const CreateTrainingParams({
    required this.title,
    required this.description,
    required this.companyName,
    required this.locationAddress,
    required this.dateOfTraining,
    required this.feePerPerson,
    required this.bankName,
    required this.bankAccountNumber,
    required this.bankAccountHolderName,
    this.facilities = const [],
    this.imagePaths = const [],
  });
}
