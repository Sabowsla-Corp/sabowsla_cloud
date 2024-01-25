import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/extensions/context_extension.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_card.dart';
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
        header: Row(
          children: [
            const Text('Client Code Example:'),
            Expanded(
              child: ListView.builder(
                itemBuilder: (c, i) {
                  var example = codeExamples[i];
                  return TextButton(
                    onPressed: () {
                      selected = example;
                      setState(() {});
                    },
                    child: Text(example.functionName),
                  );
                },
                itemCount: codeExamples.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
        child: buildCodeExampleSelected(),
      ),
    );
  }

  Widget buildCodeExampleSelected() {
    if (selected != null) {
      return Column(
        children: [
          Text(selected!.functionName),
          const SizedBox(height: 4),
          Text(selected!.functionDescription),
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
      functionDescription: '''import 'dart:developer''',
      functionName: '''import 'dart:developer''',
      runFunction: () {},
    ),
  ];
}
