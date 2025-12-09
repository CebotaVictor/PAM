
import 'package:domain/Entities/main_page/action_card_entity.dart';

class ActionCardModel extends ActionCardEntity {
  
  const ActionCardModel({
    required String title,
    required String imageUrl,
  }) : super(title: title, imageUrl: imageUrl);

  factory ActionCardModel.fromJson(Map<String, dynamic> json) {
    return ActionCardModel(
      // Handles nulls safely at the data boundary
      title: json['title'] as String? ?? "Unknown Action",
      imageUrl: json['image'] as String? ?? "",
    );
  }

  @override
  String toString() {
    return 'ActionCardModel(title: $title, imageUrl: $imageUrl)';
  }
}