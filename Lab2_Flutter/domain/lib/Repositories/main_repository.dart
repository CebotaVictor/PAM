import 'package:domain/Entities/main_page/action_card_entity.dart';
import 'package:domain/Entities/main_page/specialist_entity.dart';
import 'package:domain/Entities/main_page/speciality_entity.dart';
import 'package:domain/Entities/main_page/user_entity.dart';

abstract class MainRepository {
  Future<List<ActionCardEntity>> getActionsWithTwoWidgets();
  Future<List<ActionCardEntity>> getActionsWithThreeWidgets();
  Future<List<SpecialistListEntity>> getSpecialists();
  Future<List<SpecialtyEntity>> getSpecialties(); 
  Future<UserEntity?> getUserProfile();
}


