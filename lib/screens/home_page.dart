import 'package:first_aid_app/models/content_block.dart';
import 'package:flutter/material.dart';
import 'package:first_aid_app/screens/first_aid_page.dart';
import 'package:first_aid_app/models/first_aid_item.dart';
import 'package:first_aid_app/widgets/app_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FirstAidMenu()
      )
    );
  }
}

class FirstAidMenu extends StatelessWidget {
  // a vertical menu that would have each item be a first aid action
  // like CPR, hard patting for choking
  const FirstAidMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final listItems = [
      FirstAidItem("CPR", [
        ImageBlock("images/resuscitation.png"),
        TextBlock("Restore breathing and circulation by alternating chest compressions with rescue breaths.")]),
      FirstAidItem("Burns", [
        ImageBlock("images/burns.png"),
        TextBlock("Cool the burn under running water for 20 minutes and cover loosely with a clean dressing.")]),
      FirstAidItem("Bleeding", [
        ImageBlock("images/bleeding.png"),
        TextBlock("Control blood loss by applying firm, steady pressure directly to the wound.")]),
      FirstAidItem("Choking", [
        ImageBlock("images/choking.png"),
        TextBlock("Dislodge a blocked airway using back blows and abdominal thrusts (Heimlich manoeuvre).")]),
      FirstAidItem("Allergic Reaction", [

      ]),
      FirstAidItem("Overdose", [

      ]),
      FirstAidItem("Sprains, Strains, Bruises", [

      ])
      
    ];

    return Scaffold(
      body: ListView(
        children: listItems.map(
          (item) => ListTile(
            title: Text(item.title),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FirstAidPage(
                    item.title, item.blocks
                  )
                )
              );
            }
          )
        ).toList(),
        ),
    );
  }
}