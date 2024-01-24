enum DeleteUserResult {
  success,
  invalidEmail,
  operationNotAllowed,
  userDisabled,
  userNotFound,
  wrongPassword,
  unknown,
}

extension DeleteUserResultX on DeleteUserResult {
  bool get deleted => this == DeleteUserResult.success;
}
