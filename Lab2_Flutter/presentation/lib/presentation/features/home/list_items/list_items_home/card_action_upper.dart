
import 'package:domain/Entities/main_page/action_card_entity.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/list_item.dart';

class CardActionUpper extends ListItem {
  // Now holds the data for the widget
  final List<ActionCardEntity> actions;
  
  CardActionUpper({required this.actions});
}