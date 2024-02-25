import 'dart:math';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'register_request_model.dart';

part 'user_credential_model.g.dart';

@collection
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

  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(type: IndexType.value)
  String email;
  @Index(type: IndexType.value)
  String displayName;
  @Index(type: IndexType.value, name: 'uid')
  String uid;
  @Index(type: IndexType.value, name: 'creationDate')
  DateTime? creationDate;
  @Index(type: IndexType.value)
  String photoBase64;
  @Index(type: IndexType.value)
  String passwordHash;

  @ignore
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
      };

  Map<String, dynamic> toMapSimple() {
    return {
      'email': email,
      'displayName': displayName,
      'uid': uid,
      'creationDate': creationDate?.toIso8601String(),
    };
  }

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
