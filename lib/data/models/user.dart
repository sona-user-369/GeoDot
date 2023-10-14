class User {
  User({
    this.id,
    this.username,
    this.conId,
  });

  final String? id ;
  final String? username ;
  final String? conId ;



 factory User.fromJson(Map<String, dynamic> json ) => User(
   id: json["id"],
   username: json["username"],
   conId: json["conId"],
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