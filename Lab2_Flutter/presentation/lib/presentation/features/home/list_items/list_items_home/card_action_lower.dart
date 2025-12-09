
import 'package:domain/Entities/main_page/action_card_entity.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/list_item.dart';

class CardActionLower extends ListItem {
  final List<ActionCardEntity> actions;
  
  CardActionLower({required this.actions});
}