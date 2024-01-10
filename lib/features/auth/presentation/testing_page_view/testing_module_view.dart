import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_button_icon.dart';

class TestingModuleView extends StatefulWidget {
  const TestingModuleView({this.module, super.key});
  final TestingModule? module;

  @override
  State<TestingModuleView> createState() => _TestingModuleViewState();
}

class _TestingModuleViewState extends State<TestingModuleView> {
  bool loading = false;
  bool starting = false;
  int multiplier = 1;
  TestingResult? result;

  void onStartTest() async {
    starting = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 1));
    starting = false;
    loading = true;
    setState(() {});
    await widget.module?.computation?.call(multiplier);
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.module?.title ?? ""),
            Text(widget.module?.description ?? ""),
            const Spacer(),
            Row(
              children: [
                const Text("Repeat: "),
                Expanded(
                  child: Slider(
                    value: multiplier.toDouble(),
                    onChanged: (v) {
                      multiplier = v.toInt();
                      setState(() {});
                    },
                    min: 1,
                    max: 10000,
                    divisions: 9,
                  ),
                ),
                Text(multiplier.toString()),
              ],
            ),
            const SizedBox(height: 5),
            CustomButtonIcon(
              onTap: loading ? null : onStartTest,
              buttonText: starting ? "Starting" : "Start Test",
              icon: Icons.play_arrow,
              loading: loading,
            ),
            if (result != null)
              Column(
                children: [
                  Text(result?.title ?? ""),
                  Text(result?.description ?? ""),
                  Text(result?.result ?? ""),
                  Text(result?.success.toString() ?? ""),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class TestingResult {
  const TestingResult({
    required this.title,
    required this.description,
    required this.result,
    required this.success,
  });
  final String title;
  final String description;
  final String result;
  final bool success;
}

class TestingModule {
  const TestingModule({
    required this.title,
    required this.description,
    required this.computation,
  });
  final String title;
  final String description;
  final Future<TestingResult?>? Function(int repeat)? computation;
}
