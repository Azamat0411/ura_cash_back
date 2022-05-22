import 'package:flutter/material.dart';
import 'package:ura_cash_back/model/company_response.dart';
import 'package:ura_cash_back/widgets/my_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyInfoPage extends StatelessWidget {
  final Items company;

  const CompanyInfoPage({Key? key, required this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey),
                    child: ClipOval(
                      child: company.logo != null
                          ? Image.network(company.logo!.urls!.s200x200!)
                          : const SizedBox(),
                    ),
                  ),
                ),
              ),
              customContainer(company),
              const SizedBox(
                height: 20,
              ),
              MyTextWidget(text: 'Biz haqimizda', textColor: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
              const SizedBox(
                height: 10,
              ),
              MyTextWidget(text: company.description!, textColor: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
              const SizedBox(
                height: 10,
              ),
              company.locations!=null?MyTextWidget(text: "Biz bilan bog'lanish", textColor: Colors.black, fontWeight: FontWeight.w500, fontSize: 16):const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              company.locations!=null?InkWell(
                  onTap: () async {
                    await launch('tel:+'+company.locations![0].phoneNumber!);
                  },
                  child: MyTextWidget(text: '+'+company.locations![0].phoneNumber!, textColor: Colors.indigo, fontWeight: FontWeight.w400, fontSize: 16)):const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              company.instagramLink!=null||company.facebookLink!=null?MyTextWidget(text: "Havolalar", textColor: Colors.black, fontWeight: FontWeight.w500, fontSize: 16):const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              company.instagramLink!=null?InkWell(
                onTap: () async {
                  await launch(company.instagramLink!);
                },
                  child: MyTextWidget(text: company.instagramLink!, textColor: Colors.indigo, fontWeight: FontWeight.w400, fontSize: 16)):const SizedBox(),
              company.facebookLink!=null?InkWell(
                  onTap: () async {
                    await launch(company.facebookLink!);
                  },
                  child: MyTextWidget(text: company.facebookLink!, textColor: Colors.indigo, fontWeight: FontWeight.w400, fontSize: 16)):const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

customContainer(company){
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset:
            const Offset(0, 3), // changes position of shadow
          ),
        ]),
    child: Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextWidget(
              text: company.name!,
              textColor: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16),
          Row(
            children: [
              star(1, company.rating),
              star(2, company.rating),
              star(3, company.rating),
              star(4, company.rating),
              star(5, company.rating),
              MyTextWidget(
                  text: "(${company.rating!})",
                  textColor: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ],
          ),
          const Divider(color: Colors.grey, thickness: 0.5),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextWidget(
                          text: 'Mening cashback',
                          textColor: Colors.indigo,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                      RichText(
                        text: TextSpan(
                          text: '${company.balance}',
                          style: const TextStyle(
                              color: Colors.indigo,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          children: const [
                            TextSpan(
                              text: ' sum',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Expanded(
                    flex: 1,
                    child: VerticalDivider(
                        color: Colors.grey, thickness: .5)),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextWidget(
                          text: 'CashBack',
                          textColor: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                      RichText(
                        text: TextSpan(
                          text: '${company.cashbackPercent}',
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          children: const [
                            TextSpan(
                              text: ' %',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

star(index, rating) {
  return Icon(
    index <= rating ? Icons.star : Icons.star_border,
    color: Colors.yellow,
  );
}
