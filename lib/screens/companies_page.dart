import 'package:flutter/material.dart';
import 'package:untitled9/ui_elements/filter_dialog.dart';
import 'package:untitled9/ui_elements/sirius_app_bar.dart';
import 'package:untitled9/ui_elements/sirius_info_widgets.dart';
import 'package:untitled9/ui_elements/sirius_scaffold.dart';

import '../ui_models/companies_card_model.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SiriusScaffold(
        body: const BeautyCenterCard(), index: 2,
      ),
    );
  }
}

class BeautyCenterCard extends StatelessWidget {
  const BeautyCenterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Բացահայտիր գեղեցկության, առողջության և ֆիթնեսի լավագույն կենտրոնները',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  height: 1.4,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Գտիր ամենաբարձր գնահատական ունեցող ընկերությունները քո տարածքում և ամրագրիր առցանց՝ պարզ ու արագ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  height: 1.4,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Կազմակերպություն,գեղեցկության սրահ․․․',
                          hintStyle: TextStyle(fontSize: 10),
                          suffixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    IconButton(
                      onPressed: () {
                        showDialog(
                            context: context, builder: (_) => FilterDialog());
                      },
                      icon: const Icon(Icons.filter_list_sharp),
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
              CompaniesCard(
                company: CompaniesCardModel(
                  title: 'GOLD’S GYM',
                  subtitle: 'Մարզասրահ',
                  location: 'Երևան, Հայաստան (200 մետր հեռու)',
                  rating: 5.0,
                  imageUrl: 'assets/golds_gym.png',
                  features: [
                    Icons.directions_car_filled,
                    Icons.wifi,
                    Icons.calendar_month
                  ],
                ),
              ),
              CompaniesCard(
                company: CompaniesCardModel(
                  title: 'EDEN BY SIROON MINAS',
                  subtitle: 'Գեղեցկության սրահ',
                  location: 'Երևան, Հայաստան (200 մետր հեռու)',
                  rating: 5.0,
                  imageUrl: 'assets/categories/beauty.png',
                  features: [
                    Icons.directions_car_filled,
                    Icons.wifi,
                    Icons.calendar_month
                  ],
                ),
              ),

              SiriusInfoWidgets()
            ],
          ),
        ),
      ),
    );
  }
}
