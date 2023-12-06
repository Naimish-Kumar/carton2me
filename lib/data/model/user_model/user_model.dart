
class UserModel {
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? userPassword;
  int? phoneNumber;
  String? companyName;
  String? startDate;
  String? endDate;
  String? dateOfBirth;

  UserModel(
      {this.firstName,
      this.lastName,
      this.emailAddress,
      this.userPassword,
      this.phoneNumber,
      this.companyName,
      this.startDate,
      this.endDate,
      this.dateOfBirth});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    emailAddress = json['email_address'];
    userPassword = json['user_password'];
    phoneNumber = json['phone_number'];
    companyName = json['company_name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    dateOfBirth = json['date_of_birth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email_address'] = emailAddress;
    data['user_password'] = userPassword;
    data['phone_number'] = phoneNumber;
    data['company_name'] = companyName;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['date_of_birth'] = dateOfBirth;
    return data;
  }
}
