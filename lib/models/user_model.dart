class UserModel {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? nic;
  String? phone;
  String? password;
  String? token;

  UserModel(
      {this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.nic,
      this.phone,
      this.password,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstname = json['user']['firstname'];
    lastname = json['user']['lastname'];
    email = json['user']['email'];
    nic = json['user']['nic'];
    phone = json['user']['phone'];
    password = json['user']['password'];
    token = json['user']['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['nic'] = nic;
    data['phone'] = phone;
    data['password'] = password;
    data['token'] = token;
    return data;
  }
}
