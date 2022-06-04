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
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery
                .of(context)
                .padding
                .top + 10,
              horizontal: 50
            ),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: MyTextWidget(
                            textAlign: TextAlign.center,
                            text: message,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ])
          );
        });
  }
}