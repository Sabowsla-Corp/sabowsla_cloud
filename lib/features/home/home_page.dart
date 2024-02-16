import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_cloud/core/extensions/context_extension.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_box.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_button_icon.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_card.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_divider.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_text_field.dart';
import 'package:sabowsla_cloud/core/styles.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_layout_template.dart';
import 'package:sabowsla_cloud/features/home/atoms/create_project_card.dart';
import 'package:sabowsla_cloud/features/home/home_page_controller.dart';
import 'package:sabowsla_cloud/gen/assets.gen.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(homePageControllerProvider);
    return DashboardLayoutTemplate(
      title: "Sabowsla Cloud",
      titleStyle: styles18.white,
      icon: FontAwesomeIcons.cloud,
      dividerColor: Colors.transparent,
      trailing: Container(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
            CustomButtonIcon.transparent(
              icon: FontAwesomeIcons.solidBell,
              onTap: () {},
              iconSize: 18,
            ),
            const SizedBox(width: 5),
            const CurrentUserAvatar(),
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: context.width * 0.8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Projectos recientes",
                  style: styles18.whiteBold,
                ),
                CustomBox.medium(),
                GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  children: const [
                    CreateProjectCard(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CurrentUserAvatar extends ConsumerWidget {
  const CurrentUserAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AvatarOutliner(
      padding: const EdgeInsets.all(4),
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Assets.userIcons.male.image(
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}

class AvatarOutliner extends StatelessWidget {
  const AvatarOutliner({
    required this.child,
    this.padding = const EdgeInsets.all(0),
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    //Instagram like avatar outliner with color and inner padding
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      splashColor: Colors.red,
      highlightColor: Colors.red,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
              colors: [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
              ],
            ),
          ),
          child: Container(
            padding: padding,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
