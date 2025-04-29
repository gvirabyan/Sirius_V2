import 'package:flutter/material.dart';
import 'package:untitled9/ui_elements/sirius_scaffold.dart';
import 'package:untitled9/ui_models/service_card_model.dart';
import '../ui_elements/filter_dialog.dart';

class ServicesPage extends StatelessWidget {
  final int category_index;

  ServicesPage({super.key, required this.category_index});

  // Метод для возвращения заголовка страницы в зависимости от индекса категории
  String pageTitleByIndex(int categoryIndex) {
    switch (categoryIndex) {
      case 0:
        return "ԳԵՂԵՑԿՈՒԹՅՈՒՆ ԵՎ ՍՊԱ";
      case 1:
        return "ԷՍԹԵՏԻԿ ԲԺՇԿՈՒԹՅՈՒՆ";
      case 2:
        return "ՄԱԶԱՍՐԱՀ ԵՎ ՖԻԹՆԵՍ";
      case 3:
        return "ԼՈՂԱՎԱԶԱՆՆԵՐ";
      case 4:
        return "ԱՌՈՂՋՈՒԹՅՈՒՆ ԵՎ ԲԺՇԿՈՒԹՅՈՒՆ";
      case 5:
        return "ՅՈԳԱ ԵՎ ԱՌՈՂՋ ԱՊՐԵԼԱԿԵՐՊ";
      default:
        return "Խափանում";
    }
  }

  ServiceCardModel getServiceForCategory(int categoryIndex) {
    switch (categoryIndex) {
      case 0: // Beauty and Spa
        return ServiceCardModel(
          title: 'Sirius',
          subtitle: 'Դիմահարդարում',
          price: '10000',
          location: 'Երևան,Ռուբինյանց 2/1',
          rating: 5,
          imageUrl: 'assets/categories/beauty.png',
          isLimited: true,
        );
      case 1: // Aesthetic Medicine
        return ServiceCardModel(
          title: 'Apollo',
          subtitle: 'Բոտոքս Թերապիա',
          price: '12000',
          location: 'Երևան,Նալբանդյան 4/5',
          rating: 5,
          imageUrl: 'assets/categories/aesthetic.png',
          isLimited: true,
        );
      case 2: // Fitness
        return ServiceCardModel(
          title: 'Zeus',
          subtitle: 'Ֆիթնես սենյակ',
          price: '15000',
          location: 'Երևան,Աբովյան 10/2',
          rating: 4,
          imageUrl: 'assets/categories/gym.png',
          isLimited: false,
        );
      case 3: // Massage and Spa
        return ServiceCardModel(
          title: 'Luna',
          subtitle: 'Մերսում',
          price: '8000',
          location: 'Երևան,Տերյան 12/3',
          rating: 4,
          imageUrl: 'assets/categories/pools.png',
          isLimited: false,
        );
      case 4: // Health and Medicine
        return ServiceCardModel(
          title: 'HealthPlus',
          subtitle: 'Մասնագիտական խորհրդատվություն',
          price: '5000',
          location: 'Երևան,Բարոյան 18',
          rating: 5,
          imageUrl: 'assets/categories/health.png',
          isLimited: true,
        );
      case 5: // Yoga and Healthy Living
        return ServiceCardModel(
          title: 'YogaZone',
          subtitle: 'Յոգա դասեր',
          price: '7000',
          location: 'Երևան,Մաշտոց 1/2',
          rating: 4,
          imageUrl: 'assets/categories/yoga.png',
          isLimited: false,
        );
      default:
        return ServiceCardModel(
          title: 'Unknown',
          subtitle: 'No service available',
          price: 'N/A',
          location: 'N/A',
          rating: 0,
          imageUrl: 'assets/categories/unknown.png',
          isLimited: false,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Получаем только один сервис в зависимости от выбранной категории
    ServiceCardModel service = getServiceForCategory(category_index);

    return SiriusScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                pageTitleByIndex(category_index),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
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
              SizedBox(height: 15),
              // Отображаем один сервис для текущей категории
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ServiceCardModel(
                    title: service.title,
                    subtitle: service.subtitle,
                    price: service.price,
                    location: service.location,
                    rating: service.rating,
                    imageUrl: service.imageUrl,
                    isLimited: service.isLimited,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      index: 1,
    );
  }
}
