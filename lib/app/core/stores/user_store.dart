import 'package:cabconsumidor/app/core/models/user_preferences_model.dart';
import 'package:flutter_triple/flutter_triple.dart';

class UserStore extends Store<UserPreferencesModel> {
  UserStore() : super(UserPreferencesModel());
}
