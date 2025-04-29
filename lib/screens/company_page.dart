import 'package:flutter/material.dart';
import 'package:untitled9/ui_elements/sirius_package.dart';
import 'package:untitled9/ui_elements/sirius_scaffold.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiriusScaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: AssetImage('assets/categories/gym.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Մարզասրահ'),
              SizedBox(
                height: 10,
              ),
              Text(
                'GOLD’S GYM',
                style: TextStyle(color: Colors.black, fontSize: 25,fontWeight:FontWeight.w600 ),
              ),
              Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFF1F3FF),
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                  child: SiriusPackage()

              ),
              SizedBox(
                height: 20,
              ),


              Text(
                'Գոլդս Ջիմ Արմենիան բարձրակարգ մարզասրահ է, որտեղ Ձեր առողջությունը և բարեկեցությունը ամենից կարևոր են։ Գոլդս Ջիմն ունի ավելի քան հինգ տասնամյակի պատմություն և մշտապես եղել է ու կա ոլորտի առաջատարը ապահովելով եզակի փորձառություն իր ակումբի անդամների համար և ձեւավորելով առողջ ապրելակերպի ջատագովների համայնք։ Գոլդս Ջիմը նախընտրում են թե՛ պրոֆեսիոնալ եւ թե՛ սիրողական մարզիկները։ Այն համարվում է նախընտրելի մարզասրահ ֆիթնեսի եւ գեղեցկության մրցույթների, ժամանցային ոլորտի "nմասնագետների, ինչպես նաեւ հասարակ քաղաքացիների համար, ովքեր հոգ են տանում իրենց առողջության եւ կյանքի որակի մասին։',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '4.8',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFDFDFF7), // светло-фиолетовый фон
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.location_on,
                          color: Color(0xFF6C63AC), // фиолетовая иконка
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ԳՏՆՎԵԼՈՒ ՎԱՅՐԸ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2B2B2B),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Gold’s Gym Yerevan & Nearby Branches',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF2B2B2B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFDFDFF7),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.phone,
                          color: Color(0xFF6C63AC),
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ՀԵՌԱԽՈՍԱՀԱՄԱՐ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2B2B2B),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '+374 55 775 577',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF2B2B2B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFDFDFF7),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.watch_later_outlined,
                          color: Color(0xFF6C63AC),
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ԲԱՑ Է',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2B2B2B),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Երկուշաբթի - Կիրակի',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2B2B2B),
                              ),
                            ),
                            Text('6:00 - 11:00'),

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ])),
      ),
      index: 2,
    );
  }
}

