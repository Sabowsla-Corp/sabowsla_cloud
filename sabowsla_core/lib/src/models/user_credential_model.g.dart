// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credential_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserCredentialCollection on Isar {
  IsarCollection<UserCredential> get userCredentials => this.collection();
}

const UserCredentialSchema = CollectionSchema(
  name: r'UserCredential',
  id: -7714792641037430134,
  properties: {
    r'creationDate': PropertySchema(
      id: 0,
      name: r'creationDate',
      type: IsarType.dateTime,
    ),
    r'displayName': PropertySchema(
      id: 1,
      name: r'displayName',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 2,
      name: r'email',
      type: IsarType.string,
    ),
    r'passwordHash': PropertySchema(
      id: 3,
      name: r'passwordHash',
      type: IsarType.string,
    ),
    r'photoBase64': PropertySchema(
      id: 4,
      name: r'photoBase64',
      type: IsarType.string,
    ),
    r'uid': PropertySchema(
      id: 5,
      name: r'uid',
      type: IsarType.string,
    )
  },
  estimateSize: _userCredentialEstimateSize,
  serialize: _userCredentialSerialize,
  deserialize: _userCredentialDeserialize,
  deserializeProp: _userCredentialDeserializeProp,
  idName: r'id',
  indexes: {
    r'email': IndexSchema(
      id: -26095440403582047,
      name: r'email',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'email',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'displayName': IndexSchema(
      id: -825365117524145674,
      name: r'displayName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'displayName',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'uid': IndexSchema(
      id: 8193695471701937315,
      name: r'uid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'uid',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'creationDate': IndexSchema(
      id: -78501097794997996,
      name: r'creationDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'creationDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'photoBase64': IndexSchema(
      id: 3311653266985603659,
      name: r'photoBase64',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'photoBase64',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'passwordHash': IndexSchema(
      id: 4905199729250638487,
      name: r'passwordHash',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'passwordHash',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _userCredentialGetId,
  getLinks: _userCredentialGetLinks,
  attach: _userCredentialAttach,
  version: '3.1.0+1',
);

int _userCredentialEstimateSize(
  UserCredential object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.displayName.length * 3;
  bytesCount += 3 + object.email.length * 3;
  bytesCount += 3 + object.passwordHash.length * 3;
  bytesCount += 3 + object.photoBase64.length * 3;
  bytesCount += 3 + object.uid.length * 3;
  return bytesCount;
}

void _userCredentialSerialize(
  UserCredential object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.creationDate);
  writer.writeString(offsets[1], object.displayName);
  writer.writeString(offsets[2], object.email);
  writer.writeString(offsets[3], object.passwordHash);
  writer.writeString(offsets[4], object.photoBase64);
  writer.writeString(offsets[5], object.uid);
}

UserCredential _userCredentialDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserCredential(
    creationDate: reader.readDateTimeOrNull(offsets[0]),
    displayName: reader.readString(offsets[1]),
    email: reader.readString(offsets[2]),
    id: id,
    passwordHash: reader.readStringOrNull(offsets[3]) ?? '',
    photoBase64: reader.readString(offsets[4]),
    uid: reader.readString(offsets[5]),
  );
  return object;
}

P _userCredentialDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userCredentialGetId(UserCredential object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userCredentialGetLinks(UserCredential object) {
  return [];
}

void _userCredentialAttach(
    IsarCollection<dynamic> col, Id id, UserCredential object) {
  object.id = id;
}

extension UserCredentialQueryWhereSort
    on QueryBuilder<UserCredential, UserCredential, QWhere> {
  QueryBuilder<UserCredential, UserCredential, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhere> anyEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'email'),
      );
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhere> anyDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'displayName'),
      );
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhere> anyUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'uid'),
      );
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhere> anyCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'creationDate'),
      );
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhere> anyPhotoBase64() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'photoBase64'),
      );
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhere> anyPasswordHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'passwordHash'),
      );
    });
  }
}

extension UserCredentialQueryWhere
    on QueryBuilder<UserCredential, UserCredential, QWhereClause> {
  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause> emailEqualTo(
      String email) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'email',
        value: [email],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      emailNotEqualTo(String email) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [],
              upper: [email],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [email],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [email],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [],
              upper: [email],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      emailGreaterThan(
    String email, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'email',
        lower: [email],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause> emailLessThan(
    String email, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'email',
        lower: [],
        upper: [email],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause> emailBetween(
    String lowerEmail,
    String upperEmail, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'email',
        lower: [lowerEmail],
        includeLower: includeLower,
        upper: [upperEmail],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      emailStartsWith(String EmailPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'email',
        lower: [EmailPrefix],
        upper: ['$EmailPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'email',
        value: [''],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'email',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'email',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'email',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'email',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      displayNameEqualTo(String displayName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'displayName',
        value: [displayName],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      displayNameNotEqualTo(String displayName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'displayName',
              lower: [],
              upper: [displayName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'displayName',
              lower: [displayName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'displayName',
              lower: [displayName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'displayName',
              lower: [],
              upper: [displayName],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      displayNameGreaterThan(
    String displayName, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'displayName',
        lower: [displayName],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      displayNameLessThan(
    String displayName, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'displayName',
        lower: [],
        upper: [displayName],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      displayNameBetween(
    String lowerDisplayName,
    String upperDisplayName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'displayName',
        lower: [lowerDisplayName],
        includeLower: includeLower,
        upper: [upperDisplayName],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      displayNameStartsWith(String DisplayNamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'displayName',
        lower: [DisplayNamePrefix],
        upper: ['$DisplayNamePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      displayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'displayName',
        value: [''],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      displayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'displayName',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'displayName',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'displayName',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'displayName',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause> uidEqualTo(
      String uid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uid',
        value: [uid],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause> uidNotEqualTo(
      String uid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [],
              upper: [uid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [uid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [uid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [],
              upper: [uid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      uidGreaterThan(
    String uid, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uid',
        lower: [uid],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause> uidLessThan(
    String uid, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uid',
        lower: [],
        upper: [uid],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause> uidBetween(
    String lowerUid,
    String upperUid, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uid',
        lower: [lowerUid],
        includeLower: includeLower,
        upper: [upperUid],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause> uidStartsWith(
      String UidPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uid',
        lower: [UidPrefix],
        upper: ['$UidPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause> uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uid',
        value: [''],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'uid',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'uid',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'uid',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'uid',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      creationDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'creationDate',
        value: [null],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      creationDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'creationDate',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      creationDateEqualTo(DateTime? creationDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'creationDate',
        value: [creationDate],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      creationDateNotEqualTo(DateTime? creationDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'creationDate',
              lower: [],
              upper: [creationDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'creationDate',
              lower: [creationDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'creationDate',
              lower: [creationDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'creationDate',
              lower: [],
              upper: [creationDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      creationDateGreaterThan(
    DateTime? creationDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'creationDate',
        lower: [creationDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      creationDateLessThan(
    DateTime? creationDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'creationDate',
        lower: [],
        upper: [creationDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      creationDateBetween(
    DateTime? lowerCreationDate,
    DateTime? upperCreationDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'creationDate',
        lower: [lowerCreationDate],
        includeLower: includeLower,
        upper: [upperCreationDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      photoBase64EqualTo(String photoBase64) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'photoBase64',
        value: [photoBase64],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      photoBase64NotEqualTo(String photoBase64) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'photoBase64',
              lower: [],
              upper: [photoBase64],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'photoBase64',
              lower: [photoBase64],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'photoBase64',
              lower: [photoBase64],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'photoBase64',
              lower: [],
              upper: [photoBase64],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      photoBase64GreaterThan(
    String photoBase64, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'photoBase64',
        lower: [photoBase64],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      photoBase64LessThan(
    String photoBase64, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'photoBase64',
        lower: [],
        upper: [photoBase64],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      photoBase64Between(
    String lowerPhotoBase64,
    String upperPhotoBase64, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'photoBase64',
        lower: [lowerPhotoBase64],
        includeLower: includeLower,
        upper: [upperPhotoBase64],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      photoBase64StartsWith(String PhotoBase64Prefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'photoBase64',
        lower: [PhotoBase64Prefix],
        upper: ['$PhotoBase64Prefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      photoBase64IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'photoBase64',
        value: [''],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      photoBase64IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'photoBase64',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'photoBase64',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'photoBase64',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'photoBase64',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      passwordHashEqualTo(String passwordHash) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'passwordHash',
        value: [passwordHash],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      passwordHashNotEqualTo(String passwordHash) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'passwordHash',
              lower: [],
              upper: [passwordHash],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'passwordHash',
              lower: [passwordHash],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'passwordHash',
              lower: [passwordHash],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'passwordHash',
              lower: [],
              upper: [passwordHash],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      passwordHashGreaterThan(
    String passwordHash, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'passwordHash',
        lower: [passwordHash],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      passwordHashLessThan(
    String passwordHash, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'passwordHash',
        lower: [],
        upper: [passwordHash],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      passwordHashBetween(
    String lowerPasswordHash,
    String upperPasswordHash, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'passwordHash',
        lower: [lowerPasswordHash],
        includeLower: includeLower,
        upper: [upperPasswordHash],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      passwordHashStartsWith(String PasswordHashPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'passwordHash',
        lower: [PasswordHashPrefix],
        upper: ['$PasswordHashPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      passwordHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'passwordHash',
        value: [''],
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterWhereClause>
      passwordHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'passwordHash',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'passwordHash',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'passwordHash',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'passwordHash',
              upper: [''],
            ));
      }
    });
  }
}

extension UserCredentialQueryFilter
    on QueryBuilder<UserCredential, UserCredential, QFilterCondition> {
  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      creationDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'creationDate',
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      creationDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'creationDate',
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      creationDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      creationDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      creationDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      creationDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creationDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      displayNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      displayNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      displayNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      displayNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      displayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      displayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      displayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      displayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      displayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      displayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      emailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      emailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      emailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      emailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      passwordHashEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passwordHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      passwordHashGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'passwordHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      passwordHashLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'passwordHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      passwordHashBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'passwordHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      passwordHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'passwordHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      passwordHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'passwordHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      passwordHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'passwordHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      passwordHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'passwordHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      passwordHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passwordHash',
        value: '',
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      passwordHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'passwordHash',
        value: '',
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      photoBase64EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      photoBase64GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photoBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      photoBase64LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photoBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      photoBase64Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photoBase64',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      photoBase64StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photoBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      photoBase64EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photoBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      photoBase64Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoBase64',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      photoBase64Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoBase64',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      photoBase64IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoBase64',
        value: '',
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      photoBase64IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoBase64',
        value: '',
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      uidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      uidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      uidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      uidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      uidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      uidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      uidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      uidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterFilterCondition>
      uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }
}

extension UserCredentialQueryObject
    on QueryBuilder<UserCredential, UserCredential, QFilterCondition> {}

extension UserCredentialQueryLinks
    on QueryBuilder<UserCredential, UserCredential, QFilterCondition> {}

extension UserCredentialQuerySortBy
    on QueryBuilder<UserCredential, UserCredential, QSortBy> {
  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      sortByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.asc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      sortByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.desc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      sortByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      sortByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      sortByPasswordHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordHash', Sort.asc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      sortByPasswordHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordHash', Sort.desc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      sortByPhotoBase64() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoBase64', Sort.asc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      sortByPhotoBase64Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoBase64', Sort.desc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension UserCredentialQuerySortThenBy
    on QueryBuilder<UserCredential, UserCredential, QSortThenBy> {
  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      thenByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.asc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      thenByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.desc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      thenByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      thenByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      thenByPasswordHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordHash', Sort.asc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      thenByPasswordHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordHash', Sort.desc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      thenByPhotoBase64() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoBase64', Sort.asc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy>
      thenByPhotoBase64Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoBase64', Sort.desc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension UserCredentialQueryWhereDistinct
    on QueryBuilder<UserCredential, UserCredential, QDistinct> {
  QueryBuilder<UserCredential, UserCredential, QDistinct>
      distinctByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creationDate');
    });
  }

  QueryBuilder<UserCredential, UserCredential, QDistinct> distinctByDisplayName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QDistinct>
      distinctByPasswordHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'passwordHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QDistinct> distinctByPhotoBase64(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoBase64', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserCredential, UserCredential, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }
}

extension UserCredentialQueryProperty
    on QueryBuilder<UserCredential, UserCredential, QQueryProperty> {
  QueryBuilder<UserCredential, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserCredential, DateTime?, QQueryOperations>
      creationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creationDate');
    });
  }

  QueryBuilder<UserCredential, String, QQueryOperations> displayNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayName');
    });
  }

  QueryBuilder<UserCredential, String, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<UserCredential, String, QQueryOperations>
      passwordHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'passwordHash');
    });
  }

  QueryBuilder<UserCredential, String, QQueryOperations> photoBase64Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoBase64');
    });
  }

  QueryBuilder<UserCredential, String, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }
}
