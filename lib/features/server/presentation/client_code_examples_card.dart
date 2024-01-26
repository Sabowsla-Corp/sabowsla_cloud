import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/extensions/context_extension.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_button.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_card.dart';
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
  }

  void init() {
    selected = codeExamples.first;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomCard(
        height: context.relative(300),
        header: const Row(
          children: [
            Text('Client Code Example:'),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCodeSelector(),
            Expanded(
              flex: 6,
              child: buildCodeExampleSelected(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCodeSelector() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: codeExamples.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final item = codeExamples[index];
            bool active = selected == item;
            return CustomButton(
              width: 100,
              height: 35,
              buttonColor: active ? Colors.deepPurple : Colors.white30,
              buttonText: item.functionName,
              onTap: () {
                selected = item;
                setState(() {});
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildCodeExampleSelected() {
    if (selected != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "## ${selected!.functionDescription}",
            style: styles12.grey,
          ),
          const SizedBox(height: 4),
          Text(selected!.functionCode),
        ],
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
