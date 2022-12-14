import 'package:clean_arqui_base/core/widgets/custom_paint_bubbles.dart';
import 'package:clean_arqui_base/core/widgets/custom_paint_cloud.dart';
import 'package:flutter/material.dart';

enum TypeMessage { danger, success, warning, info }

class SnackWidget extends SnackBar {
  static showMessage(BuildContext context, String titleText, String text,
          {bool isError = false, TypeMessage typeMessage = TypeMessage.info}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackWidget(
          CustomContent(
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

class CustomContent extends StatefulWidget {
  final String text;
  final String titleText;
  final TypeMessage typeMessage;
  const CustomContent({
    Key? key,
    this.titleText = '',
    required this.text,
    required this.typeMessage,
  }) : super(key: key);

  @override
  State<CustomContent> createState() => _CustomContentState();
}

class _CustomContentState extends State<CustomContent> {
  Color getColor(TypeMessage typeMessage) {
    switch (typeMessage) {
      case TypeMessage.danger:
        return Colors.red.shade400;
      case TypeMessage.warning:
        return Colors.yellow.shade400;
      case TypeMessage.success:
        return Colors.green.shade400;
      default:
        return Theme.of(context).scaffoldBackgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
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
                    const Spacer(),
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
        ),
        Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(20)),
              child: Stack(
                children: [CustomPaintBubbles()],
              ),
            )),
        Positioned(
          top: -20,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaintCloud(color: getColor(widget.typeMessage)),
              const Positioned(
                  top: 10,
                  child: Icon(
                    Icons.close_outlined,
                    size: 16,
                    color: Colors.white,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
