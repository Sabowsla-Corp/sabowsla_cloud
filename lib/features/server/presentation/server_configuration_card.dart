import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_button.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_card.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_divider.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_text_field.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_toggle.dart';
import 'package:sabowsla_server/core/styles.dart';
import 'package:sabowsla_server/features/server/controller/server_controller.dart';
import 'package:sabowsla_server/features/server/models/local_server_status.dart';

class ServerConfigurationCard extends ConsumerStatefulWidget {
  const ServerConfigurationCard({
    super.key,
  });

  @override
  ConsumerState<ServerConfigurationCard> createState() =>
      _ServerConfigurationCardState();
}

class _ServerConfigurationCardState
    extends ConsumerState<ServerConfigurationCard> {
  @override
  Widget build(BuildContext context) {
    bool cors = ref.watch(serverControllerProvider).cors;
    int port = ref.watch(serverControllerProvider).port;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Start a local HTTP server that behaves like a firebase API",
            ),
            const SizedBox(height: 20),
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Configuration",
                    style: styles12.grey,
                  ),
                  const CustomDivider(),
                  buildServerPortField(port, ref),
                  buildCorsToggle(cors, ref),
                  buildVerboseToggle(ref),
                  buildServerStatusButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildServerStatusButton() {
    LocalServerStatus status =
        ref.watch(serverControllerProvider).localServerStatus;
    bool loading = status == LocalServerStatus.starting;
    return SizedBox(
      height: 35,
      child: Row(
        children: [
          Text("Server Status: ${status.name}"),
          const Spacer(),
          CustomButton(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            loading: loading,
            buttonColor: status == LocalServerStatus.running
                ? Colors.deepPurpleAccent
                : null,
            onTap: () {
              ref.read(serverControllerProvider.notifier).toggleServerStatus();
            },
            child: Text(
              status == LocalServerStatus.stopped
                  ? "Start Server"
                  : "Stop Server",
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVerboseToggle(WidgetRef ref) {
    return SizedBox(
      height: 35,
      child: Row(
        children: [
          const Text("Verbose"),
          const Spacer(),
          Expanded(
            child: CustomToggle(
              value: ref.watch(serverControllerProvider).verbose,
              onChanged: (value) {
                ref.read(serverControllerProvider.notifier).setVerbose(value);
              },
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildServerPortField(int port, WidgetRef ref) {
    return SizedBox(
      height: 35,
      child: Row(
        children: [
          const Text("Server Port"),
          const Spacer(),
          Expanded(
            child: CustomTextField(
              controller: TextEditingController(text: port.toString()),
              onChanged: (value) {
                ref
                    .read(serverControllerProvider.notifier)
                    .setPort(int.parse(value));
              },
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildCorsToggle(bool cors, WidgetRef ref) {
    return SizedBox(
      height: 35,
      child: Row(
        children: [
          const Text("Cross-Origin-Resource-Sharing (CORS)"),
          const Spacer(),
          Expanded(
            child: CustomToggle(
              value: cors,
              onChanged: (value) {
                ref.read(serverControllerProvider.notifier).setCors(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
