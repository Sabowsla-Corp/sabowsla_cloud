import 'dart:math';

import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sabowsla_server/features/auth/models/register_request_model.dart';
import 'package:sabowsla_server/features/auth/presentation/users_page_view/user_credential_property.dart';

@Entity()
class UserCredential {
  UserCredential({
    required this.email,
    required this.displayName,
    required this.uid,
    required this.creationDate,
    required this.photoBase64,
    this.passwordHash = '',
    this.id = 0,
  });

  @Id()
  int id;
  @Property()
  String email;
  @Property()
  String displayName;
  @Property()
  String uid;
  @Property(type: PropertyType.date)
  DateTime? creationDate;
  @Property()
  String photoBase64;
  @Property()
  String passwordHash;

  List<UIProperty> get properties => [
        UIProperty(Icons.numbers, uid, 2),
        UIProperty(Icons.person, displayName, 2),
        UIProperty(Icons.email, email, 2),
        UIProperty(
          Icons.calendar_month,
          creationDate?.toIso8601String() ?? '',
          2,
        ),
        UIProperty(Icons.image, photoBase64, 1),
      ];

  List<Widget> get propertiesAsWidgets => properties
      .map(
        (e) => UserCredentialPropertyView(
          property: e,
          isImage: e.flex == 1,
        ),
      )
      .toList();

  static UserCredential fromJson(Map<String, dynamic> json) {
    return UserCredential(
      email: json['email'],
      displayName: json['displayName'],
      uid: json['uid'],
      creationDate: json['creationDate'],
      photoBase64: json['photoBase64'],
      passwordHash: json['passwordHash'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'displayName': displayName,
        'uid': uid,
        'creationDate': creationDate,
        'photoBase64': photoBase64,
        'passwordHash': passwordHash,
      };

  @override
  String toString() {
    return 'UserCredential(email: $email, displayName: $displayName, uid: $uid, creationDate: $creationDate, photoBase64: ${photoBase64.isNotEmpty}, passwordHash: ${passwordHash.isNotEmpty})';
  }

  static UserCredential randomUser() {
    var emailDomainRandomized = Random().nextInt(1000000);
    var randomEmail =
        "${Random().nextInt(1000000)}@$emailDomainRandomized.random";
    return UserCredential(
      email: randomEmail,
      displayName: "displayName",
      uid: "",
      creationDate: DateTime.now(),
      photoBase64: "",
      passwordHash: "asdasd",
    );
  }
}

class UIProperty {
  UIProperty(
    this.icon,
    this.property,
    this.flex,
  );
  final IconData icon;
  final String property;
  final int flex;
}

extension UserCredentialExtension on UserCredential {
  RegisterRequest asRegisterRequest() {
    return RegisterRequest(
      email: email,
      passwordHash: passwordHash,
    );
  }
}
