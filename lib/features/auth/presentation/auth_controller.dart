import 'package:rxdart/subjects.dart';
import 'package:sabowsla_server/features/auth/presentation/auth_view_tabs.dart';

var authController = AuthController();

class AuthController {
  var currentTab = BehaviorSubject<Enum>.seeded(AuthViewTab.Users);
}
