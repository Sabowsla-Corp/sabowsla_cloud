import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_cloud/core/constants/type_def.dart';
import 'package:sabowsla_cloud/core/extensions/context_extension.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_box.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_button_icon.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_card.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_divider.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_text_field.dart';
import 'package:sabowsla_cloud/core/styles.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_layout_template.dart';
import 'package:sabowsla_cloud/features/home/home_page_controller.dart';

class CreateProjectCard extends ConsumerWidget {
  const CreateProjectCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomCard(
      maxWidth: context.relative(500),
      padding: EI.zero,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            ref.read(homePageControllerProvider.notifier).createProject();
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                child: const Icon(
                  FontAwesomeIcons.plus,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  size: 50,
                ),
              ),
              Text(
                "Agregar proyecto",
                style: styles14.white,
              ),
              CustomBox.xLarge(),
              const CustomDivider(),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    const Icon(
                      //Bruujula
                      FontAwesomeIcons.compass,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    CustomBox.medium(),
                    Text(
                      "Nuevo",
                      style: styles14.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
