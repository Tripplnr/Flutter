class ChangePasswordModel {
  String? currentPassword;
  String? passwordConfirmation;
  String? password;

  ChangePasswordModel(
      {this.currentPassword, this.passwordConfirmation, this.password});

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    currentPassword = json['current_password'];
    passwordConfirmation = json['password_confirmation'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_password'] = this.currentPassword;
    data['password_confirmation'] = this.passwordConfirmation;
    data['password'] = this.password;
    return data;
  }
}
