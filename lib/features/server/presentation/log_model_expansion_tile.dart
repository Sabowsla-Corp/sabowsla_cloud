import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabowsla_server/core/presentation/atoms/custom_button.dart';
import 'package:sabowsla_server/core/styles.dart';
import 'package:sabowsla_server/features/log/models/log_model.dart';

class LogModelExpansionTile extends StatefulWidget {
  const LogModelExpansionTile({required this.log, super.key});
  final LogModel log;

  @override
  State<LogModelExpansionTile> createState() => _LogModelExpansionTileState();
}

class _LogModelExpansionTileState extends State<LogModelExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Column(
        children: [
          Row(
            children: [
              const CustomButton(
                child: Icon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                  size: 8,
                ),
              ),
              const SizedBox(width: 5),
              CustomButton(
                tooltip: "Filter by this date",
                child: Text(prettyDate(widget.log.date), style: styles12.white),
              ),
              const SizedBox(width: 5),
              CustomButton(
                tooltip: "Filter by Source",
                child: Text(
                  widget.log.source,
                  style: styles12.white70,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Tooltip(
                  message: "Copy Log",
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      widget.log.log,
                      style: styles12.white70,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String prettyDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}:${date.second}';
  }
}
