import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sabowsla_cloud/core/constants/type_def.dart';
import 'package:sabowsla_cloud/core/extensions/context_extension.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_box.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_button.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_button_icon.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_chip.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_linear_loading_progress_shimmer.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_text_field.dart';
import 'package:sabowsla_cloud/core/router.dart';
import 'package:sabowsla_cloud/core/styles.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_layout_template.dart';
import 'package:sabowsla_cloud/features/projects/projects_page_controller.dart';

class CreateProjectView extends ConsumerStatefulWidget {
  const CreateProjectView({super.key});

  static const routeName = "/create-project";
  @override
  ConsumerState<CreateProjectView> createState() => _CreateProjectViewState();
}

class _CreateProjectViewState extends ConsumerState<CreateProjectView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: DashboardLayoutTemplate(
        title: 'Crea un nuevo projecto',
        titleStyle: styles18.white70,
        dividerColor: Colors.white10,
        iconWidget: CustomButton.closeRouterPage,
        loader: loading ? const CustomLinearLoadingProgressShimmer() : null,
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
                      onChanged: (v) {
                        projectPathController.text =
                            '${projectPath ?? ''}/$generatedProjectId';
                        setState(() {});
                      },
                      textAlign: TextAlign.start,
                      fillColor: Colors.black,
                      contentPadding: const EdgeInsets.all(15),
                      style: styles24.white,
                    ),
                    CustomBox.xLarge(),
                    CustomChip(
                      label: generatedProjectId.isEmpty
                          ? 'my-awesome-project'
                          : generatedProjectId,
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
                      style: styles18.white,
                    ),
                    CustomBox.xLarge(),
                    CustomButton(
                      borderRadius: 10,
                      padding: const EI.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      buttonText: "Crear proyecto",
                      onTap: createProject,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  bool loading = false;

  bool validateSettings() {
    if (_controller.text.isEmpty) {
      navigationService.showToast(
        "El nombre del proyecto no puede estar vacío",
      );
      return false;
    }
    if (projectPathController.text.isEmpty) {
      navigationService.showToast(
        "La ubicación del proyecto no puede estar vacía",
      );
      return false;
    }
    return true;
  }

  void createProject() async {
    setState(() {
      loading = true;
    });
    bool validSettings = validateSettings();
    if (validSettings) {
      var controller = ref.read(projectsPageControllerProvider.notifier);
      await controller.createNewProjectFromSettings(
        name: _controller.text,
        basePath: projectPathController.text,
        uid: generatedProjectId,
      );
    }
    setState(() {
      loading = false;
    });
  }

  String get generatedProjectId =>
      _controller.text.replaceAll(" ", "-").toLowerCase();

  late final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    setDefaultFolder();
  }

  void setDefaultFolder() async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      var path = dir.path;

      setState(() {
        projectPath = path;
        projectPathController.text = '$path/${'my-awesome-project'}';
      });
    } catch (e) {
      print(e);
    }
  }

  String? projectPath;
  late final projectPathController = TextEditingController();
  void pickProjectPath() async {
    String? path = await FilePicker.platform.getDirectoryPath();
    setState(() {
      projectPath = path ?? '';
      projectPathController.text = '${path ?? ''}/$generatedProjectId ';
    });
  }
}

//TODO default select directory for browser