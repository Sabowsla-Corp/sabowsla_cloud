import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabowsla_cloud/core/constants/colors.dart';
import 'package:sabowsla_cloud/core/constants/type_def.dart';
import 'package:sabowsla_cloud/core/extensions/context_extension.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_box.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_button.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_button_icon.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_chip.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_text_field.dart';
import 'package:sabowsla_cloud/core/router.dart';
import 'package:sabowsla_cloud/core/styles.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_content_builder.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_layout_template.dart';

class CreateProjectView extends StatefulWidget {
  const CreateProjectView({super.key});

  static Future open(AutoDisposeNotifierProviderRef ref) {
    var router = ref.read(navigationService.goRouterProvider);
    return router.push(CreateProjectView.routeName);
  }

  static const routeName = "/create-project";
  @override
  State<CreateProjectView> createState() => _CreateProjectViewState();
}

class _CreateProjectViewState extends State<CreateProjectView> {
  @override
  Widget build(BuildContext context) {
    return DashboardLayoutTemplate(
      title: 'Crea un nuevo projecto',
      titleStyle: styles18.white70,
      dividerColor: Colors.white10,
      iconWidget: CustomButton.closeRouterPage,
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: context.width * 0.8,
          ),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Comencemos con el nombre del proyecto",
                    style: styles18.white54,
                  ),
                  CustomBox.xLarge(),
                  CustomTextField(
                    controller: _controller,
                    labelText: "Nombre del proyecto",
                    onChanged: (v) {},
                    textAlign: TextAlign.start,
                    fillColor: Colors.black,
                    contentPadding: const EdgeInsets.all(15),
                    style: styles24.white,
                  ),
                  CustomBox.xLarge(),
                  CustomChip(
                    label: generatedProjectId ?? 'my-awesome-project',
                  ),
                  CustomBox.xxLarge(),
                  CustomTextField(
                    controller: projectPathController,
                    trailing: CustomButtonIconPickFile(
                      onTap: pickProjectPath,
                    ),
                    labelText: "Ubicación del proyecto",
                    onChanged: (v) {},
                    textAlign: TextAlign.start,
                    fillColor: Colors.black,
                    contentPadding: const EdgeInsets.all(15),
                    style: styles24.white,
                  ),
                  CustomBox.xLarge(),
                  CustomButton(
                    borderRadius: 10,
                    padding: const EI.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    buttonText: "Crear proyecto",
                    onTap: () {
                      setState(() {
                        generatedProjectId = _controller.text;
                      });
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  late final TextEditingController _controller = TextEditingController();

  String? generatedProjectId;
  String? projectPath;
  late final projectPathController = TextEditingController();
  void pickProjectPath() async {
    String? path = await FilePicker.platform.getDirectoryPath();
    setState(() {
      projectPath = path;
      projectPathController.text = path ?? '';
    });
  }
}
