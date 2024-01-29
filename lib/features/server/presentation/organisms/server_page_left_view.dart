import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/core/extensions/context_extension.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_menu_bar.dart';
import 'package:sabowsla_cloud/features/server/presentation/organisms/server_logs_card.dart';
import 'package:sabowsla_cloud/features/server/presentation/server_web_view.dart';

class ServerPageLeftView extends StatefulWidget {
  const ServerPageLeftView({super.key});

  @override
  State<ServerPageLeftView> createState() => _ServerPageLeftViewState();
}

class _ServerPageLeftViewState extends State<ServerPageLeftView> {
  ActiveTab activeLeftTab = ActiveTab.logs;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: context.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomMenuBar(
              values: ActiveTab.values,
              onChanged: (value) {
                activeLeftTab = value;
                setState(() {});
              },
              value: activeLeftTab,
              textBuilder: (value) {
                return ActiveTab.values[value].name;
              },
            ),
            const SizedBox(height: 10),
            buildView(),
          ],
        ),
      ),
    );
  }

  Widget buildView() {
    switch (activeLeftTab) {
      case ActiveTab.logs:
        return const ServerLogsCard();
      case ActiveTab.server:
        return const ServerWebView();
    }
  }
}

enum ActiveTab { logs, server }
