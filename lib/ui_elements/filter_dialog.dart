import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  // Состояния чекбоксов
  Map<String, bool> checkboxStates = {
    'Գեղեցկություն և Սպա': true,
    'Մարզասրահ և ֆիտնես': true,
    'Առողջություն և բժշկություն': false,
    'Ատամնաբուժական կլինիկաներ': false,
    'Լողավազաններ': false,
    'Վարկանիշի': false,
    'Հանրաճանաչության': false,
    'Հեռավորության': true,
    'Վերջին այցելությունների': false,
  };

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ֆիլտր',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Տարածաշրջան ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                items: [
                  'Երևան',
                  'Իջևան',
                  'Դիլիջան',
                ].map((location) {
                  return DropdownMenuItem(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              _buildCheckbox('Գեղեցկություն և Սպա'),
              _buildCheckbox('Մարզասրահ և ֆիտնես'),
              _buildCheckbox('Առողջություն և բժշկություն'),
              _buildCheckbox('Ատամնաբուժական կլինիկաներ'),
              _buildCheckbox('Լողավազաններ'),
              const SizedBox(height: 20),
              _buildSectionTitle('Դասակարգել ըստ՝'),
              const Divider(height: 30),
              _buildCheckbox('Վարկանիշի'),
              _buildCheckbox('Հանրաճանաչության'),
              const Divider(height: 30),
              _buildCheckbox('Հեռավորության'),
              _buildCheckbox('Վերջին այցելությունների'),
              ElevatedButton(onPressed: () {    Navigator.pop(context);
              }, child: Text('Ցուցադրել'))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildCheckbox(String title) {
    return InkWell(
      onTap: () {
        setState(() {
          checkboxStates[title] = !(checkboxStates[title] ?? false);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: checkboxStates[title] == true ? Colors.deepPurple : Colors.grey,
                  width: 2,
                ),
                color: checkboxStates[title] == true ? Colors.deepPurple : Colors.transparent,
              ),
              child: checkboxStates[title] == true
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
