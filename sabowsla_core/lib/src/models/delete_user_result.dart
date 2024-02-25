enum DeleteUserResult {
  success,
  invalidEmail,
  operationNotAllowed,
  userDisabled,
  userNotFound,
  wrongPassword,
  unknown,
}

extension DeleteUserResultExtensions on DeleteUserResult {
  bool get deleted => this == DeleteUserResult.success;
}
