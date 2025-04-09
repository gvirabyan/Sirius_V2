import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final String id;
  final String companyName;
  final String orderStatus;
  final String orderDate;
  final String orderPrice;
  final String specialistIcon;
  final String specialistName;

  // Конструктор для создания объекта заказа
  const OrderItem({
    super.key,
    required this.id,
    required this.companyName,
    required this.orderStatus,
    required this.orderDate,
    required this.orderPrice,
    required this.specialistIcon,
    required this.specialistName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: Image.network(specialistIcon), // Специалист иконка
        title: Text(companyName),
        subtitle: Text('Date: $orderDate\nPrice: $orderPrice\nSpecialist: $specialistName'),
        trailing: Text(orderStatus),
        isThreeLine: true,
        onTap: () {
        },
      ),
    );
  }

  static OrderItem fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      companyName: json['company_name'],
      orderStatus: json['order_status'],
      orderDate: json['order_date'],
      orderPrice: json['order_price'],
      specialistIcon: json['specialist_icon'],
      specialistName: json['specialist_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_name': companyName,
      'order_status': orderStatus,
      'order_date': orderDate,
      'order_price': orderPrice,
      'specialist_icon': specialistIcon,
      'specialist_name': specialistName,
    };
  }
}
