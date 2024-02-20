import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_cloud/core/styles.dart';
import 'package:sabowsla_cloud/features/auth/controller/auth_page_controller.dart';
import 'package:sabowsla_cloud/features/auth/models/register_result_model.dart';
import 'package:sabowsla_cloud/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_cloud/features/auth/presentation/testing_page_view/testing_module_view.dart';

class AuthTestingPageView extends ConsumerWidget {
  const AuthTestingPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<TestingResult?>? registerNUsers(int repeat) async {
      log("Registering users $repeat");
      DateTime start = DateTime.now();
      var results = <RegisterResult>[];
      for (var i = 0; i < repeat; i++) {
        var user = UserCredential.randomUser();
        var result = await ref
            .read(authPageControllerProvider.notifier)
            .createUser(user);
        results.add(result);
      }
      DateTime end = DateTime.now();

      log("Finished registering users $repeat   in ${end.difference(start)}");
      return null;
    }

    Widget buildTestingSuite() {
      List<TestingModule> modules = [
        TestingModule(
          title: "Register Users",
          description: "Creates users in the database",
          computation: registerNUsers,
        ),
      ];
      return GridView.builder(
        shrinkWrap: true,
        itemCount: modules.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          childAspectRatio: 2,
        ),
        itemBuilder: (c, s) => TestingModuleView(module: modules[s]),
      );
    }

    Column buildHeader() {
      return Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 10),
              const Icon(FontAwesomeIcons.caretDown),
              const SizedBox(width: 10),
              Text(
                "Authentication Testing",
                style: styles24.white.applyBold,
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      );
    }

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.black38,
      ),
      child: Column(
        children: [
          buildHeader(),
          buildTestingSuite(),
        ],
      ),
    );
  }
}
