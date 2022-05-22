import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ura_cash_back/bloc/stream_consumer.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:ura_cash_back/bloc/verify_bloc.dart';
import 'package:ura_cash_back/network/main_repository.dart';
import 'package:ura_cash_back/widgets/my_elevated_button.dart';
import 'package:ura_cash_back/widgets/my_text_form_field.dart';
import 'package:ura_cash_back/widgets/my_text_widget.dart';
import '../widgets/notification.dart';
import 'main_page.dart';

class VerifyPage extends StatefulWidget {
  String phoneNumber;

  VerifyPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  VerifyBloc? _bloc;
  final _formKey = GlobalKey<FormState>();
  final _connectivity = Connectivity();

  final formatter = MaskTextInputFormatter(
    mask: '#-#-#-#',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final _controller = TextEditingController();

  int minute = 1;

  int second = 59;

  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (minute != 0 || second != 0) {
          second--;
          if (second == 0 && minute != 0) {
            Timer(const Duration(seconds: 1), () {
              setState(() {
                minute--;
                second = 59;
              });
            });
          }
        } else {
          if (minute == 0 && second == 0) {
            timer!.cancel();
          }
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
    _bloc!.addEvent(VerifyInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    _bloc = Provider.of<VerifyBloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Tasdiqlash',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: StreamConsumer<VerifyState>(
        initialData: _bloc!.initialState,
        stream: _bloc!.state,
        listener: (_, state) async {
          if (state is VerifyLoadedState) {
            if (state.result.token!.isNotEmpty) {
              GetStorage().write('token', state.result.token!);
              GetStorage().write('hasProfile', true);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MainPage()),
                  (route) => false);
            }
          } else if (state is VerifyException) {}
        },
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  child: MyTextWidget(
                      text:
                          "Sizga raqam orqali SMS yuborildi +${widget.phoneNumber}, Kodni kiriting",
                      textAlign: TextAlign.center,
                      textColor: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: MyTextFormField(
                    controller: _controller,
                    radius: 10,
                    obscureText: false,
                    preffixText: '',
                    hingText: '',
                    inputFormatter: [formatter],
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    onChanged: (v) async {
                      if (v.replaceAll('-', '').length == 4) {
                        final status = await _connectivity.checkConnectivity();
                        if (status == ConnectivityResult.none) {
                          const Notifications().flash(
                              context, "Internet aloqasi yo'q", Colors.black54);
                        } else {
                          _bloc!.addEvent(VerifyLoadEvent(
                              phoneNumber: widget.phoneNumber,
                              code: v.replaceAll('-', '')));
                        }
                      }
                    },
                    validator: (v) => v!.isEmpty ? "Kod kiritilmadi" : null,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                minute != 0 || second != 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyTextWidget(
                              text: "Yangi kodni so'rash mumkin",
                              textColor: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                          Text(
                            "${minute == 0 && second == 0 ? "" : "${minute > 9 ? minute : "0$minute"}:${second > 9 ? second : "0$second"}"} ",
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          MyTextWidget(
                              text: "Men SMS olganim yo'q",
                              textColor: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              MainRepository().login(widget.phoneNumber);
                              minute = 1;
                              second = 59;
                              startTimer();
                            },
                            child: MyTextWidget(
                                text: 'QAYTA YUBORISH',
                                textColor: Colors.indigo,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 20,
                ),
                MyElevatedButton(
                    radius: 10,
                    height: 40,
                    primaryColor: Colors.indigo,
                    width: 200,
                    child: MyTextWidget(
                        text: "Tasdiqlash",
                        textColor: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                    onTap: () {
                      _formKey.currentState!.validate();
                    })
              ],
            ),
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
