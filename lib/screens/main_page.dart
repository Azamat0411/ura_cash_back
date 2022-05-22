import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ura_cash_back/model/company_response.dart';
import 'package:ura_cash_back/screens/company_info_page.dart';
import 'package:ura_cash_back/screens/sign_up_page.dart';
import 'package:ura_cash_back/widgets/loader.dart';
import 'package:ura_cash_back/widgets/my_elevated_button.dart';
import 'package:ura_cash_back/widgets/my_text_widget.dart';
import '../bloc/company_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CompanyBloc()..add(LoadApiEvent()),
        child: BlocBuilder<CompanyBloc, CompanyState>(
          builder: (context, state) {
            if (state is CompanyLoadingState) {
              return const Loader();
            } else if (state is CompanyLoadedState) {
              CompanyResponse response = state.response;
              return Column(
                children: [
                  Expanded(
                      // height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: response.items!.length,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CompanyInfoPage(
                                                    company: response
                                                        .items![index])));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white
                                    ),

                                    child: Row(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: response
                                                      .items![index].logo !=
                                                  null
                                              ? BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          response
                                                              .items![index]
                                                              .logo!
                                                              .urls!
                                                              .s100x!),
                                                      fit: BoxFit.cover),
                                                )
                                              : BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        MyTextWidget(
                                            text: response.items![index].name!,
                                            textColor: Colors.indigo,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16)
                                      ],
                                    ),
                                  ),
                                ),
                              ))),
                  MyElevatedButton(
                      radius: 10,
                      height: 40,
                      primaryColor: Colors.indigo,
                      width: 100,
                      child: MyTextWidget(
                          text: "Chiqish",
                          textColor: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                      onTap: () async {
                        await GetStorage().write('token', '');
                        await GetStorage().write('hasProfile', false);
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>SignUp()), (route) => false);
                      })
                ],
              );
            }
            return const Loader();
          },
        ),
      ),
    );
  }
}
