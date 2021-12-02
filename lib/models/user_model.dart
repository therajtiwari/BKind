class UserModel {
  String uid;
  String name;
  String email;
  String country;
  String language;
  String pTimeFrom;
  String pTimeTill;
  String userSince;
  bool isVol;
  int rating;

  UserModel(
      {required this.uid,
      required this.name,
      required this.email,
      required this.country,
      required this.language,
      required this.pTimeFrom,
      required this.pTimeTill,
      required this.userSince,
      required this.isVol,
      required this.rating});

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
      isVol: map['isVol'],
      rating: map['rating'],
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
      'isVol': isVol,
      'rating': rating,
    };
  }
}
