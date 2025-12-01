class TabBar{
  String? info;
  String? history;
  String? review;

  TabBar({
    required this.info,
    required this.history,
    required this.review,
  });


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

  @override
  String toString() {
    return 'TabBar(info: $info, history: $history, review: $review)'; 
    }
}