import 'package:first_aid_app/models/content_block.dart';
import 'package:first_aid_app/screens/first_aid_page.dart';
import 'package:first_aid_app/models/first_aid_item.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

final _listItems = [
  FirstAidItem("CPR", Symbols.cardiology, [
    ImageBlock("images/resuscitation.png"),
    TextBlock("Cardiopulmonary resuscitation (CPR) is a livesaving technique used when someone's heart stops beating. Immediate CPR can double or triple the chance of survival."),
    WarningBlock("Call emergency services (111) before starting CPR."),
    NumberedListBlock([
      "Place the person on their back on a firm surface.",
      "Put the heel of one hand on the centre of the chest, and your other hand on top.",
      "Push hard and fast: at least 5cm deep, at a rate of 100-120 compressions per minute.",
      "After 30 compressions, tilt the head back, lift the chin, and give 2 rescue breaths.",
      "Continue the cycle of 30 compressions and 2 breaths until help arrives."
    ]),
    CPRTimerBlock(110, 30, 2, 3000)
  ]),
  FirstAidItem("Burns", Symbols.mode_heat, [
    ImageBlock("images/burns.png"),
    TextBlock("Burns can be caused by heat, chemicals, electricity, or radiation(including the sun). Quick treatment reduces damage and speeds healing."),
    NumberedListBlock([
      "Cool the burn under cool running water for at least 20 minutes.",
      "Remove clothing and jewellry near the burn (unless stuck to the skin).",
      "Cover the burn loosely with a clean, non-stick dressing.",
      "Seek medical attention for burns larger than a 20-cent coin, or on the face, hands, or joints."
    ]),
    WarningBlock("Do not apply ice, butter, or toothpaste to a burn."),
    HintBlock("Cling wrap makes a good temporary burn dressing. Lay it over the area loosely.")
  ]),
  FirstAidItem("Bleeding", Symbols.humidity_high, [
    ImageBlock("images/bleeding.png"),
    TextBlock("Bleeding must be controlled quickly to reduce blood loss. Most external bleeding can be managed with direct pressure."),
    WarningBlock("For severe bleeding that won't stop, call emergency services (111) immediately."),
    NumberedListBlock([
      "Apply firm, direct pressure to the wound using a clean cloth or a bandage.",
      "Keep the pressure on. Do not lift the cloth to check the wound.",
      "If blood soaks through, add more material on top without removing the first layer.",
      "If possible, elevate the injured area above the level of the heart.",
    ]),
    WarningBlock("Wear gloves if available to protect yourself from bloodborne infections."),
    HintBlock("If a limb has been severed, wrap it in a clean cloth, place it in a sealed plastic bag in ice, and bring it to the hospital.")
  ]),
  FirstAidItem("Choking", Symbols.air, [
    ImageBlock("images/choking.png"),
    TextBlock("Choking occurs when an object blocks the airway. A person who is choking may not be able to speak, cough, or breathe."),
    WarningBlock("If the person becomes unconscious, call emergency services (111) and begin CPR."),
    NumberedListBlock([
      "Encourage the person to cough forcefully if they can.",
      "If coughing doesn't work, give up to 5 sharp back blows between the shoulder blades with the heel of your hand.",
      "If back blows fail, give up to 5 chest thrusts: place a fist above the navel, grasp it with the other hand, and thrust inward and upward.",
      "Alternate between 5 back blows and 5 chest thrusts."
    ]),
    WarningBlock("For infants, use gentle back blows and chest thrusts with two fingers. Never use abdominal thrusts.")
  ]),
  FirstAidItem("Allergic Reaction", Symbols.allergy, [
    ImageBlock("images/allergy.png"),
    TextBlock("Allergic reactions range from mild (hives, itching) to life-threatening anaphylaxis, which can cause swelling of the throat, breathing difficulty, and a drop in blood pressure."),
    WarningBlock("Call emergency services (111) immediately if the person has difficulty breathing, swelling of the face and throat, or feels faint."),
    NumberedListBlock([
      "Help the person sit upright to ease breathing, or lie down with legs raised if they feel faint.",
      "If the person has a prescribed adrenaline auto-injector (EpiPen), help them use it on the outer-mid thigh.",
      "Remove the trigger if possible.",
      "For mild reactions, apply a cold compress and give an antihistamine if available.",
      "Monitor breathing closely. Be prepared to start CPR if they become unresponsive."
    ]),
    HintBlock("An EpiPen can be used through clothing. After use, note the time and tell paramedics.")
  ]),
  FirstAidItem("Overdose", Symbols.pill, [
    TextBlock("A drug overdose can be life-threatening. Signs include unconsciousness, slow or stopped breathing, blue lips or fingertips, and pinpoint/constricted pupils."),
    WarningBlock("Call emergency services (111) immediately. Tell them what substance was taken if known."),
    NumberedListBlock([
      "Check for responsiveness. Tap their shoulders and call their name loudly.",
      "If unresponsive but breathing, place them on their side (recovery position).",
      "If not breathing, begin CPR immediately.",
      "If naloxone (Narcan) is available and an opioid overdose is suspected, administer it according to the instructions.",
      "Stay with the person until emergency services arrive."
    ]),
    WarningBlock("Do not try to make the person vomit, this can cause choking or aspiration.")
  ]),
  FirstAidItem("Sprains, Strains, Bruises", Symbols.healing, [
    TextBlock("Sprains, strains, and bruises are common soft tissue injuries. Treatment focuses on reducing pain and swelling to support healing."),
    HintBlock("The helpful acronym RICE: rest, ice, compression, elevation"),
    NumberedListBlock([
      "Rest: Stop using the injured area and avoid putting weight on it.",
      "Ice: Apply a pack of ice wrapped in cloth to the injured area for 10-20 minutes at a time to reduce pain. Repeat once if the person is still in pain.",
      "Compression: Wrap the area firmly (but not too tightly) with an elastic bandage to reduce swelling. If a bandage is hurting the person, stop using it.",
      "Elevation: Raise the injured area above the level of the heart (or just some elevation) to reduce swelling."
    ]),
    WarningBlock("Seek medical attention if you cannot bear weight, the joint looks deformed, or pain and swelling worsen after 48 hours.")
  ])
];

class FirstAidMenu extends StatelessWidget {
  // a vertical menu that would have each item be a first aid action
  // like CPR, hard patting for choking
  const FirstAidMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: _listItems.map(
        (item) => ListTile(
          title: Text(item.title),
          leading: Icon(item.icon, color: Colors.redAccent),
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
    );
  }
}