import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:ura_cash_back/bloc/sign_up_bloc.dart';
import 'package:ura_cash_back/bloc/stream_consumer.dart';
import 'package:ura_cash_back/screens/login_page.dart';
import 'package:ura_cash_back/screens/verify_page.dart';
import 'package:ura_cash_back/widgets/my_elevated_button.dart';
import 'package:ura_cash_back/widgets/my_text_form_field.dart';
import 'package:ura_cash_back/widgets/my_text_widget.dart';
import 'package:ura_cash_back/widgets/notification.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpBloc? _bloc;

  final _connectivity = Connectivity();

  final _controller = TextEditingController();

  final phoneNumberFormatter = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final _formKey = GlobalKey<FormState>();

  String number = '';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc!.addEvent(AuthInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    _bloc = Provider.of<SignUpBloc>(context);
    return Scaffold(
      body: StreamConsumer<AuthState>(
        initialData: _bloc!.initialState,
        stream: _bloc!.state,
        listener: (_, state) async {
          if (state is LoginLoadedState) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => VerifyPage(phoneNumber: '998$number')));
          } else if (state is LoginException) {}
        },
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/logo.svg',
                ),
                const SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: MyTextFormField(
                    controller: _controller,
                    radius: 10,
                    hingText: '(91) 191-66-00',
                    obscureText: false,
                    preffixText: "+998",
                    textInputType: TextInputType.number,
                    inputFormatter: [phoneNumberFormatter],
                    onChanged: (v){
                      if(v.replaceAll('(', '').replaceAll(') ', '').replaceAll('-', '').length == 9){
                        hideKeyboard();
                      }
                    },
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Telefon raqam kiriting...';
                      } else if (v.length < 14) {
                        return 'Telefon raqam xato';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {

                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage()));
                        },
                        child: MyTextWidget(
                            text: "Kirish",
                            textColor: Colors.indigo,
                            fontWeight: FontWeight.w400,
                            fontSize: 15))
                  ],
                ),
                MyElevatedButton(
                    radius: 10,
                    height: 40,
                    primaryColor: Colors.indigo,
                    width: 200,
                    child: MyTextWidget(
                        text: "Ro'yhatdan o'tish",
                        textColor: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                    onTap: () async {
                      final status = await _connectivity.checkConnectivity();
                      if(status == ConnectivityResult.none){
                        const Notifications().flash(context, "Internet aloqasi yo'q", Colors.black54);
                      }else{
                        if (_formKey.currentState!.validate()) {
                          number = _controller.text;
                          number = number.replaceAll('(', '');
                          number = number.replaceAll(')', ' ');
                          number = number.replaceAll(' ', '');
                          number = number.replaceAll('-', '');
                          await _bloc!
                              .addEvent(LoginEvent(phoneNumber: '998$number'));
                        }
                      }
                    })
              ],
            ),
          );
        },
      ),
    );
  }

  hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

}
