import 'package:flutter/material.dart';

class RadioType extends StatefulWidget {
  const RadioType({super.key});

  @override
  State<RadioType> createState() => _RadioTypeState();
}

class _RadioTypeState extends State<RadioType> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("Pão"),
          leading: Radio(
            value: "Pão",
            groupValue: "Pão",
            onChanged: (value) {
              setState(() {
                // currentOption = value.toString();
              });
            },
          ),
        ),
          
      ],
    );
  }
}