class UserModel {
  int? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? emailAddress;
  dynamic? phoneNumber;
  String? companyName;
  Null? dateOfBirth;
  Null? userRole;
  String? userType;
  String? userAvatar;
  Null? role;
  String? accessToken;

  UserModel(
      {this.id,
      this.userId,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.phoneNumber,
      this.companyName,
      this.dateOfBirth,
      this.userRole,
      this.userType,
      this.accessToken,
      this.userAvatar,
      this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    emailAddress = json['email_address'];
    phoneNumber = json['phone_number'];
    companyName = json['company_name'];
    dateOfBirth = json['date_of_birth'];
    userRole = json['user_role'];
    userType = json['user_type'];
    userAvatar = json['user_avatar'];
    role = json['Role'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email_address'] = emailAddress;
    data['phone_number'] = phoneNumber;
    data['company_name'] = companyName;
    data['date_of_birth'] = dateOfBirth;
    data['user_role'] = userRole;
    data['user_type'] = userType;
    data['user_avatar'] = userAvatar;
    data['Role'] = role;
    return data;
  }
}
