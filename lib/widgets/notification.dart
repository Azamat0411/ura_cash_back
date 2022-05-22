import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'my_text_widget.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  flash(context, message, color){
    showFlash(
        context: context,
        duration: const Duration(seconds: 3),
        builder: (_, controller) {
          return Flash(
            backgroundColor: color,
            controller: controller,
            position: FlashPosition.top,
            behavior: FlashBehavior.floating,
            borderRadius: BorderRadius.circular(10),
            margin: EdgeInsets.symmetric(vertical: MediaQuery
                .of(context)
                .padding
                .top + 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextWidget(text: message, textColor: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
                )
              ],
            )
          );
        });
  }
}