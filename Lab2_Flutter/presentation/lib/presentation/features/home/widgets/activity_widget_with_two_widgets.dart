import 'package:flutter/material.dart';
import 'package:domain/Entities/main_page/action_card_entity.dart';
import 'action_card.dart';

class CardActionUpperWidget extends StatelessWidget {
  final List<ActionCardEntity> actions;

  const CardActionUpperWidget({
    super.key, 
    required this.actions
  });

  final double cardWidth = 120.0;
  final double cardHeight = 120.0;
  final double spacing = 10.0;

  @override
  Widget build(BuildContext context) {
    if (actions.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 12.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: actions.map((action) {
            return Padding(
              padding: EdgeInsets.only(right: spacing),
              child: ActionCardWidget(
                title: action.title,
                imageUrl: action.imageUrl,
                width: cardWidth,
                height: cardHeight,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}