class ProfileModel {
  final String name;
  final int age;
  final String weightAddress;
  final String facebookApi;
  final String gender;

  ProfileModel(this.gender, {
    required this.age,
    required this.facebookApi,
    required this.weightAddress,
    required this.name,
  });
}
