import 'package:flutter/material.dart';
import 'package:untitled9/models/order/order_card_model.dart';
import 'package:untitled9/ui_elements/sirius_app_bar.dart';
import 'package:untitled9/styles.dart';
import 'package:untitled9/ui_elements/sirius_info_widgets.dart';
import 'package:untitled9/ui_elements/sirius_scaffold.dart';

import '../ui_elements/filter_bar.dart';

class UserOrderHistoryPage extends StatelessWidget {
  const UserOrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiriusScaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              const Center(
                  child: Text(
                'ORDER HISTORY',
                style: AppStyles.myStyle,
              )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const Center(
                child: Text(
                    'Lorem ipsum dolor sit amet consectetur. Dolor ultricies viverra tellus adipiscing sapien integer risus diam vitae. Sed nibh aliquet pellentesque faucibus purus tincidunt mi nunc nisl. Pretium sed vehicula amet nunc eu et mus congu',
                    style: AppStyles.descripStyle,
                    textAlign: TextAlign.center),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const FilterBar(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onChanged: (value) {},
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFB0A0C5),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Center(
                  child: Text(
                    ' • The appointment can be canceled up to 24 hours in advance of the planned time',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),


              const OrderCard(),

              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const SiriusInfoWidgets(),

            ]),
          ),
        ));
  }
}
