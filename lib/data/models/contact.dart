import 'package:geodot/data/models/user.dart';

class Contact {
  Contact({
    this.id,
    this.user,
    this.state,
  });

  final String? id ;
  final User? user ;
  bool? state ;



  factory Contact.fromJson(Map<String, dynamic> json ) => Contact(
    id: json["id"],
    user: User.fromJson(json["user"]),
    state: json["state"]["enable"],
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