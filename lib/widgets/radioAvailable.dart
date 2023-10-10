import 'package:flutter/material.dart';

class RadioAvailable extends StatefulWidget {
  const RadioAvailable({super.key});

  @override
  State<RadioAvailable> createState() => _RadioAvailableState();
}

List<String> options = [
  "Disponível",
  "Indisponível",
];

class _RadioAvailableState extends State<RadioAvailable> {
  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(options[0]),
          leading: Radio(
            value: options[0],
            groupValue: currentOption,
            onChanged: (value) {
              setState(() {
                currentOption = value.toString();
              });
            },
          ),
        ),
        ListTile(
          title: Text(options[1]),
          leading: Radio(
            value: options[1],
            groupValue: currentOption,
            onChanged: (value) {
              setState(() {
                currentOption = value.toString();
              });
            },
          ),
        ),
      ],
    );
  }
}
