class UserModel {
  String? uid;
  String? name;
  String? email;
  String? country;
  String? language;
  String? pTimeFrom;
  String? pTimeTill;
  String? userSince;

  UserModel(
      {this.uid,
      this.name,
      this.email,
      this.country,
      this.language,
      this.pTimeFrom,
      this.pTimeTill,
      this.userSince});

  //get the data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      country: map['country'],
      language: map['language'],
      pTimeFrom: map['pTimeFrom'],
      pTimeTill: map['pTimeTill'],
      userSince: map['userSince'],
    );
  }

  //post data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'country': country,
      'language': language,
      'pTimeFrom': pTimeFrom,
      'pTimeTill': pTimeTill,
      'userSince': userSince,
    };
  }
}
