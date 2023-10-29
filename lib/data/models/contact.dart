import 'package:geodot/data/models/user.dart';

class Contact {
  Contact({
    this.id,
    this.user,
    this.state,
    this.online,
  });

  String? id ;
  User? user ;
  bool? state ;
  bool? online ;



  factory Contact.fromJson(Map<String, dynamic> json ) => Contact(
    id: json["id"],
    user: User.fromJson(json["user"]),
    state: json["state"]["enable"],
    online: json["online"]
  );

}



class AuthenticatedUser {
  AuthenticatedUser({
    this.token,
    this.tokenType,
    this.user
  });

  final String? token ;
  final String? tokenType ;
  final User? user ;


  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) => AuthenticatedUser(
      token: json["token"],
      tokenType: json["tokenType"],
      user: User.fromJson(json["user"])
  );


}