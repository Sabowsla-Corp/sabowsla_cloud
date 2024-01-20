import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_server/features/auth/presentation/auth_view_content_builder.dart';
import 'package:sabowsla_server/features/auth/presentation/auth_view_tabs.dart';
import 'package:sabowsla_server/features/dashboard/dashboard_layout_template.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const DashboardLayoutTemplate(
      title: 'Authentication',
      icon: FontAwesomeIcons.lock,
      trailing: AuthPageTabs(),
      child: AuthPageContentBuilder(),
    );
  }
}
