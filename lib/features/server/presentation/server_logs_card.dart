import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_card.dart';
import 'package:sabowsla_server/features/log/models/log_model.dart';
import 'package:sabowsla_server/features/server/controller/server_controller.dart';
import 'package:sabowsla_server/features/server/presentation/log_model_expansion_tile.dart';

class ServerLogsCard extends ConsumerWidget {
  const ServerLogsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<LogModel> logs = ref.watch(serverControllerProvider).logs;

    Widget itemBuilder(c, i) {
      var log = logs[i];
      return LogModelExpansionTile(log: log);
    }

    return Expanded(
      child: CustomCard(
        header: const Row(
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
        child: Column(
          children: [
            ListView.builder(
              itemBuilder: itemBuilder,
              itemCount: logs.length,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
