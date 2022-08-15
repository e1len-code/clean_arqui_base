import 'package:flutter/material.dart';

enum TypeMessage { danger, success, warning, info }

class SnackWidget extends SnackBar {
  static showMessage(BuildContext context, String titleText, String text,
          {bool isError = false, TypeMessage typeMessage = TypeMessage.info}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackWidget(
          ContentCustom(
            titleText: titleText,
            text: text,
            typeMessage: typeMessage,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );

  final Widget content;
  final Duration duration;
  final String label;
  final Color? backgroundColor;
  final SnackBarBehavior behavior;
  final double elevation;

  const SnackWidget(this.content,
      {Key? key,
      this.duration = const Duration(seconds: 3),
      this.label = 'label',
      this.backgroundColor,
      this.behavior = SnackBarBehavior.floating,
      this.elevation = 0})
      : super(
            key: key,
            content: content,
            duration: duration,
            backgroundColor: backgroundColor,
            behavior: behavior,
            elevation: elevation);
}

class ContentCustom extends StatefulWidget {
  final String text;
  final String titleText;
  final TypeMessage typeMessage;
  const ContentCustom({
    Key? key,
    this.titleText = '',
    required this.text,
    required this.typeMessage,
  }) : super(key: key);

  @override
  State<ContentCustom> createState() => _ContentCustomState();
}

class _ContentCustomState extends State<ContentCustom> {
  Color getColor(TypeMessage typeMessage) {
    switch (typeMessage) {
      case TypeMessage.danger:
        return Theme.of(context).errorColor.withOpacity(0.5);
      case TypeMessage.warning:
        return Colors.yellow.shade300;
      case TypeMessage.success:
        return Colors.green.shade300;
      default:
        return Theme.of(context).scaffoldBackgroundColor.withOpacity(0.25);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 90,
      decoration: BoxDecoration(
          color: getColor(widget.typeMessage),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          const SizedBox(width: 32),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.titleText,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
