import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabowsla_server/features/auth/presentation/testing_page_view/testing_module_view.dart';

class AuthTestingPageView extends StatelessWidget {
  const AuthTestingPageView({super.key});

  @override
  Widget build(BuildContext context) {
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

  Future<TestingResult?>? registerNUsers(int repeat) async {
    log("Registering users $repeat");
    return const TestingResult(
      title: "Email",
      description: "Test email sending",
      result: "Email sent",
      success: true,
    );
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
              style: TextStyle(
                fontFamily: GoogleFonts.delaGothicOne().fontFamily,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
