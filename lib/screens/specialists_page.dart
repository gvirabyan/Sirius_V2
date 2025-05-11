import 'package:flutter/material.dart';
import 'package:untitled9/ui_elements/sirius_scaffold.dart';

import '../ui_models/specialist_card_model.dart';

class SpecialistsPage extends StatelessWidget {
  const SpecialistsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SiriusScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Паддинг со всех сторон
          child: Column(
            children: [
              SpecialistCardModel(
                name: 'Ասատուր Ասատուրյան',
                description: 'Սերտիֆիկացված Ֆիթնես մարզիչ',
                location: 'Իջևան',
                onButtonPressed: () {},
                buttonText: 'ԱՄՐԱԳՐԵԼ ՀԻՄԱ',
                imageUrl: 'assets/specialists/asatur.png',
              ),
              SizedBox(height: 20,),
              SpecialistCardModel(
                name: 'Արմինե Գալստյան',
                description: 'Սերտիֆիկացված Մեյքափ արտիստ',
                location: 'Դիլիջան',
                onButtonPressed: () {},
                buttonText: 'ԱՄՐԱԳՐԵԼ ՀԻՄԱ',
                imageUrl: 'assets/specialists/armine.png',
              )
            ],
          ),
        ),
      ),
      index: 3,
    );
  }
}
