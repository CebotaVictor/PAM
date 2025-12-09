import 'dart:convert';
import 'package:data_layer/models/main_page/action_card.dart';
import 'package:data_layer/models/main_page/specialist.dart';
import 'package:data_layer/models/main_page/specialities.dart';
import 'package:domain/Entities/main_page/action_card_entity.dart';
import 'package:domain/Entities/main_page/specialist_entity.dart';
import 'package:domain/Entities/main_page/speciality_entity.dart';
import 'package:domain/Entities/main_page/user_entity.dart';
import 'package:data_layer/models/main_page/UserModel.dart';
import 'package:http/http.dart' as http;

// Domain Imports
import 'package:domain/repositories/main_repository.dart';

class MainRepositoryImpl implements MainRepository {
  final String _baseUrl = 'https://test-api-jlbn.onrender.com/v5/feed';


  Future<Map<String, dynamic>> _fetchFeedData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load feed. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network Error: $e');
    }
  }


  Future<List<ActionCardModel>> _getAllActions() async {
    final data = await _fetchFeedData();
    // 1. Use the correct key "actions" from your API JSON
    final list = data['actions'] as List<dynamic>? ?? [];
    return list.map((e) => ActionCardModel.fromJson(e)).toList();
  }

  @override
  Future<List<ActionCardEntity>> getActionsWithThreeWidgets() async {
  
    final allActions = await _getAllActions();
    
    return allActions.take(3).toList();
  }

  @override
  Future<List<ActionCardEntity>> getActionsWithTwoWidgets() async {
    final allActions = await _getAllActions();
    
    
    return allActions.skip(3).toList();
  }

  @override
  Future<List<SpecialistListEntity>> getSpecialists() async {
    final data = await _fetchFeedData();
    final list = data['specialists'] as List<dynamic>? ?? [];
    return list.map((e) => SpecialistList.fromJson(e)).toList();
  }

  @override
  Future<List<SpecialtyEntity>> getSpecialties() async {
    final data = await _fetchFeedData();
    
    final list = data['specialities'] as List<dynamic>? ?? [];
    return list.map((e) => Specialty.fromJson(e)).toList();
  }

  @override
  Future<UserEntity?> getUserProfile() async {
    try {
      final data = await _fetchFeedData();
      if (data.containsKey('user')) {
        return Usermodel.fromJson(data['user']);
      }
      return null;
    } catch (e) {
      print("Error fetching user: $e");
      return null;
    }
  }
}