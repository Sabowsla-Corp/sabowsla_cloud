import 'package:objectbox/objectbox.dart';

@Entity()
class UserCredential {
  UserCredential({
    required this.email,
    required this.displayName,
    required this.uid,
    this.id = 0,
  });

  @Id()
  int id;
  @Property()
  final String email;
  @Property()
  final String displayName;
  @Property()
  final String uid;

  static UserCredential fromJson(Map<String, dynamic> json) {
    return UserCredential(
      email: json['email'],
      displayName: json['displayName'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'displayName': displayName,
        'uid': uid,
      };
}
