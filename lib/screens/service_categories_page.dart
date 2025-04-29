import 'package:flutter/material.dart';
import 'package:untitled9/ui_elements/sirius_info_widgets.dart';
import 'package:untitled9/ui_elements/sirius_scaffold.dart';
import 'package:untitled9/ui_models/Service_categories_card_model.dart';

class ServiceCategoriesPage extends StatelessWidget {
  const ServiceCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SiriusScaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // выравнивание по горизонтали
                  children: const [
                    Text(
                      'Բացահայտիր լավագույն ծառայությունները',
                      style: TextStyle(fontSize: 25),
                      textAlign:
                          TextAlign.center, // выравнивание содержимого текста
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Գեղեցկությունից մինչև ֆիթնես և բժշկական ծառայություններ՝ բացահայտեք բազմազան ծառայություններ, որոնք հարմարեցված են ձեր անհատական կարիքներին։',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ServicesCategoriesCardModel(
                  imagePath: 'assets/services/beauty.png',
                  title: "Գեղեցկություն և Սպա",
                  description:
                      "Հանգստացիր, վերալիցքավորվիր և վայելիր բարձրակարգ սպասարկումը Տեսնել բոլոր ծառայությունները",
                  index: 0,
                ),
                SizedBox(height: 20),
                ServicesCategoriesCardModel(
                    imagePath: 'assets/services/health.jpg',
                    title: "Էսթետիկ բժշկություն",
                    description: "Նվիրիր քո գեղեցկությանը մասնագիտական խնամք",
                    index: 1),
                SizedBox(height: 20),
                ServicesCategoriesCardModel(
                    imagePath: 'assets/services/gym.png',
                    title: "Մարզասրահ և ֆիթնես",
                    description:
                        "Հասիր քո ֆիթնես նպատակներին՝ մասնագետ մարզիչների օգնությամբ",
                    index: 2),
                SizedBox(height: 20),
                ServicesCategoriesCardModel(
                    imagePath: 'assets/categories/pools.png',
                    title: "Լողավազաններ",
                    description:
                        "Լողավազանները իդեալական վայր են հանգստանալու, մարզվելու և մարմնի ու մտքի վերականգնման համար։",
                    index: 3),
                SizedBox(height: 20),
                ServicesCategoriesCardModel(
                    imagePath: 'assets/services/dentistry.png',
                    title: "Առողջություն և բժշկություն",
                    description:
                        "Առողջապահության ամբողջական ծառայություններ քեզ համար",
                    index: 4),
                SizedBox(height: 20),
                ServicesCategoriesCardModel(
                    imagePath: 'assets/services/yoga.png',
                    title: "Յոգա ևվ առողջ ապրելակերպ",
                    description:
                        "Հոգու և մարմնի ներդաշնակություն՝ համալիր մեթոդներով",
                    index: 5),
                SizedBox(height: 20),
                SiriusInfoWidgets()
              ],
            ),
          )),
      index: 1,
    );
  }
}
