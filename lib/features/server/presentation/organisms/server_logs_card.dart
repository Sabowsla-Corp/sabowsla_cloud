import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_cloud/core/extensions/context_extension.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_card.dart';
import 'package:sabowsla_cloud/features/log/models/log_model.dart';
import 'package:sabowsla_cloud/features/server/controller/server_controller.dart';
import 'package:sabowsla_cloud/features/server/presentation/atoms/log_model_expansion_tile.dart';

class ServerLogsCard extends ConsumerWidget {
  const ServerLogsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<LogModel> logs = ref.watch(serverControllerProvider).logs;

    List<Widget> itemBuilder() {
      List<Widget> list = [];
      for (var i = 0; i < logs.length; i++) {
        list.add(LogModelExpansionTile(log: logs[i]));
      }
      return list;
    }

    Expanded buildScrollableScrollView() {
      return Expanded(
        child: Container(
          color: Colors.grey.shade900.withOpacity(0.5),
          child: SingleChildScrollView(
            child: Column(
              children: itemBuilder(),
            ),
          ),
        ),
      );
    }

    return Expanded(
      child: Column(
        children: [
          buildListViewHeader(),
          buildScrollableScrollView(),
        ],
      ),
    );
  }

  Container buildListViewHeader() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: const Row(
        children: [
          Icon(
            FontAwesomeIcons.listUl,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(width: 10),
          Text('Server Logs'),
        ],
      ),
    );
  }
}
