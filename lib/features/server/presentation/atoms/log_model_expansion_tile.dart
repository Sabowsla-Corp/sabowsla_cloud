import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sabowsla_cloud/core/presentation/atoms/custom_button.dart';
import 'package:sabowsla_cloud/core/styles.dart';
import 'package:sabowsla_cloud/features/log/models/log_model.dart';

class LogModelExpansionTile extends StatefulWidget {
  const LogModelExpansionTile({required this.log, super.key});
  final LogModel log;

  @override
  State<LogModelExpansionTile> createState() => _LogModelExpansionTileState();
}

class _LogModelExpansionTileState extends State<LogModelExpansionTile> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Column(
        children: [
          Row(
            children: [
              CustomButton(
                onTap: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                tooltip: expanded ? "Collapse" : "Expand",
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 200),
                  turns: expanded ? 0.25 : 0,
                  child: const Icon(
                    FontAwesomeIcons.chevronRight,
                    color: Colors.white,
                    size: 8,
                  ),
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
                child: Text(
                  widget.log.log,
                  style: styles12.white70,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 5),
              //COPY
              CustomButton(
                onTap: () async {
                  try {
                    await Clipboard.setData(
                      ClipboardData(text: widget.log.log),
                    );
                    showToast('Copied to clipboard ${widget.log.log}');
                  } catch (e) {
                    print(e);
                  }
                },
                tooltip: "Copy Log",
                child: const Icon(
                  FontAwesomeIcons.copy,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ],
          ),
          expanded
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      Flexible(
                        child: Text(
                          widget.log.log,
                          style: styles12.white70,
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  String prettyDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}:${date.second}';
  }
}
