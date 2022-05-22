import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ura_cash_back/screens/sign_up_page.dart';
import '../widgets/my_elevated_button.dart';
import '../widgets/my_text_form_field.dart';
import '../widgets/my_text_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _numberController = TextEditingController();

  final _passwordController = TextEditingController();

  final phoneNumberFormatter = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  late bool active = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/logo.svg',
              ),
              const SizedBox(height: 50),
              MyTextFormField(
                controller: _numberController,
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
              const SizedBox(
                height: 20,
              ),
              MyTextFormField(
                controller: _passwordController,
                radius: 10,
                hingText: 'password',
                obscureText: active,
                maxLines: 1,
                preffixText: "",
                suffixIcon: IconButton(
                  icon: Icon(
                    active ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      active = !active;
                    });
                  },
                ),
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'Parol kiriting...';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> SignUp()), (newRoute)=>false);
                      },
                      child: MyTextWidget(
                          text: "Ro'yhatdan o'tish",
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
                      text: "Kirish",
                      textColor: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {

                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

}
