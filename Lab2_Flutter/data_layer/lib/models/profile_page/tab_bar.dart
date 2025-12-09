import 'package:domain/Entities/profile_page/tab_bar_entity.dart';

class TabBar extends TabBarEntity {

  TabBar({
    String? info,
    String? history,
    String? review,
  }):super(
    info: info,
    history: history,
    review: review,
  );

  factory TabBar.fromJson(Map<String, dynamic> json) {
     return TabBar(
      info: json['Info'] as String? ?? ''
      ,
      history: json['History'] as String? ?? ''
      ,
      review: json['Review'] as String? ?? ''
      ,
    );
  }

  factory TabBar.fromEntity(TabBarEntity entity) {
    return TabBar(
      info: entity.info,
      history: entity.history,
      review: entity.review,
    );
  }

  @override
  String toString() {
    return 'TabBar(info: $info, history: $history, review: $review)'; 
    }
}