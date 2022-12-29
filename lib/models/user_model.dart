// import realm package
part 'user_model.g.dart';

@RealmModel()
class _UserModel {
  late String username;
  late String userEmail;
  late String password;
  late String token;
  late DateTime tokenEmitDate;
}
