import 'package:objectbox/objectbox.dart';

@Entity()
class UserCredential {
  UserCredential({
    required this.email,
    required this.displayName,
    required this.uid,
    required this.creationDate,
    required this.photoBase64,
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
  @Property()
  final String creationDate;
  @Property()
  String photoBase64;

  static UserCredential fromJson(Map<String, dynamic> json) {
    return UserCredential(
      email: json['email'],
      displayName: json['displayName'],
      uid: json['uid'],
      creationDate: json['creationDate'],
      photoBase64: json['photoBase64'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'displayName': displayName,
        'uid': uid,
        'creationDate': creationDate,
        'photoBase64': photoBase64,
      };
}
