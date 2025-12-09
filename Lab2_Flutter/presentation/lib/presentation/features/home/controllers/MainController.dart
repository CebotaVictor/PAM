import 'package:domain/usecases/main/get_home_action_use_case.dart';
import 'package:get/get.dart';

// --- Domain Use Cases ---
import 'package:domain/usecases/main/get_specialties_use_case.dart';
import 'package:domain/usecases/main/get_specialists_use_case.dart';
import 'package:domain/usecases/main/get_user_profile_use_case.dart'; // Ensure this exists

// --- Domain Entities ---
import 'package:domain/Entities/main_page/user_entity.dart';
import 'package:domain/Entities/main_page/action_card_entity.dart';
import 'package:domain/Entities/main_page/speciality_entity.dart';
import 'package:domain/Entities/main_page/specialist_entity.dart';

// --- Presentation List Items ---
import 'package:presentation/presentation/features/home/list_items/list_items_home/list_item.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/search_bar_list_item.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/card_action_upper.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/card_action_lower.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/speciality_list_items.dart';
import 'package:presentation/presentation/features/home/list_items/list_items_home/speciality_section_item_list.dart';

class MainController extends GetxController {
  // 1. Dependencies (Use Cases)
  final GetHomeActionsUseCase _getHomeActions;
  final GetSpecialtiesUseCase _getSpecialties;
  final GetSpecialistsUseCase _getSpecialists;
  final GetUserProfileUseCase _getUserProfile; // Added for AppBar

  // 2. Constructor Injection
  MainController(
    this._getHomeActions,
    this._getSpecialties,
    this._getSpecialists,
    this._getUserProfile,
  );

  // 3. State Variables
  // Holds the user profile for the AppBar
  final Rx<UserEntity?> currentUser = Rx<UserEntity?>(null);
  
  // Holds the heterogeneous list of items for the Body
  final RxList<ListItem> items = RxList();
  
  // Loading state
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadHomeData();
  }

  void loadHomeData() async {
    try {
      isLoading.value = true;

      // 4. Fetch All Data via Use Cases
      // We run them in parallel for better performance
      final results = await Future.wait([
        _getUserProfile.call(),             
        _getHomeActions.getUpperActions(),  
        _getHomeActions.getLowerActions(),  
        _getSpecialties.call(),             
        _getSpecialists.call(),             
      ]);

      
      final UserEntity? userResult = results[0] as UserEntity?;
      final List<ActionCardEntity> upperActions = results[1] as List<ActionCardEntity>;
      final List<ActionCardEntity> lowerActions = results[2] as List<ActionCardEntity>;
      final List<SpecialtyEntity> specialties = results[3] as List<SpecialtyEntity>;
      final List<SpecialistListEntity> specialists = results[4] as List<SpecialistListEntity>;

      
      print("upper actions $upperActions \n, lower actions =  $lowerActions \n , specialties =  $specialties \n, spacialists =  $specialists\n");


      currentUser.value = userResult;

      
      items.clear();

    
      items.add(SearchBarListItem());

        items.add(CardActionUpper(actions: upperActions));
        items.add(CardActionLower(actions: lowerActions));
        items.add(SpecialityListItems(specialties: specialties));
        items.add(SpecialistSectionListItem(specialists: specialists));
      
    } catch (e) {
      // In a real app, handle error states or show a snackbar
      print("Error loading home data: $e");
    } finally {
      isLoading.value = false;
    }
  }
}