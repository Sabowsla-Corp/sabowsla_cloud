import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabowsla_cloud/features/home/home_page_state.dart';

part 'home_page_controller.g.dart';

@riverpod
class HomePageController extends _$HomePageController {
  @override
  HomePageState build() => HomePageState();
}
