import 'package:flutter/material.dart';
import 'package:sabowsla_cloud/core/app_streams.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_linear_loading_progress_shimmer.dart';

class DashboardLoadingIndicator extends StatelessWidget {
  const DashboardLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: appStreams.loadingIndicator,
      builder: (c, s) {
        bool show = s.data ?? false;
        if (show) {
          return const CustomLinearLoadingProgressShimmer();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
