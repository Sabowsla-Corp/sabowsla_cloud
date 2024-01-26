import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/extensions/context_extension.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_card.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_menu_bar.dart';
import 'package:sabowsla_server/core/styles.dart';
import 'package:sabowsla_server/features/server/models/client_code_example_model.dart';

class ClientCodeExamplesCard extends StatefulWidget {
  const ClientCodeExamplesCard({super.key});

  @override
  State<ClientCodeExamplesCard> createState() => _ClientCodeExamplesCardState();
}

class _ClientCodeExamplesCardState extends State<ClientCodeExamplesCard> {
  ClientCodeExampleModel? selected;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    selected = codeExamples.first;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: context.relative(300),
      header: const Row(
        children: [
          Text('Client Code Example:'),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          buildCodeSelector(),
          buildCodeExampleSelected(),
        ],
      ),
    );
  }

  Widget buildCodeSelector() {
    return SizedBox(
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CustomMenuBar(
            values: codeExamples.map((e) => e.functionName).toList(),
            onChanged: (value) {
              selected = codeExamples
                  .firstWhere((element) => element.functionName == value);
              setState(() {});
            },
            value: selected?.functionName,
          ),
        ],
      ),
    );
  }

  Widget buildCodeExampleSelected() {
    if (selected != null) {
      return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "## ${selected!.functionDescription}",
              style: styles12.grey,
            ),
            const SizedBox(height: 4),
            Text(
              selected!.functionCode,
              style: styles12.white,
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  List<ClientCodeExampleModel> codeExamples = [
    ClientCodeExampleModel(
      functionCode: '''import 'dart:developer''',
      functionDescription: 'Logins the user with its email and password',
      functionName: 'Login',
      runFunction: () {},
    ),
  ];
}
