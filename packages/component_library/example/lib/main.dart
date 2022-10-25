import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component_library/component_library.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Storybook(stories: [
        Story(
            name: 'Card Box',
            description: 'Used as a base for other UI elements',
            builder: (context) {
              return const CardBox(
                height: 400,
                width: 250,
              );
            }),
        Story(
            name: 'Custom Text',
            description: 'Text configured with sizes for different purposes',
            builder: (context) {
              return Center(
                child: ListView(
                  children: [
                    CustomText(
                      context.knobs
                          .text(label: 'Title', initial: 'This is a title'),
                      type: TextType.title,
                    ),
                    CustomText(
                      context.knobs.text(
                          label: 'Normal', initial: 'This is a normal text'),
                      type: TextType.normal,
                    ),
                    CustomText(
                      context.knobs.text(
                          label: 'Button', initial: 'This is a button text'),
                      type: TextType.button,
                    ),
                  ],
                ),
              );
            }),
        Story(
            name: 'Icon Button',
            description:
                'Specialized icon button which has the posibility of displaying text under it',
            builder: (context) => CustomIconButton(
                  icon: context.knobs.options(
                      label: 'Favorite',
                      initial: Icons.favorite,
                      options: const [
                        Option(label: 'Add', value: Icons.add_box_sharp),
                        Option(label: "Battery", value: Icons.battery_4_bar)
                      ]),
                  text: context.knobs.text(label: 'Text', initial: 'Favorite'),
                  onTap: () {},
                )),
        Story(
            name: 'Long Button',
            description: 'General button',
            builder: (context) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: LongButton(
                    text: context.knobs
                        .text(label: 'Text', initial: 'Long button here'),
                    onTap: () {},
                  ),
                ))
      ]),
    ),
  ));
}
