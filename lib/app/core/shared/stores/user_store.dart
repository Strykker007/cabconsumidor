// import 'package:cabconsumidor/app/core/services/http_service.dart';
// import 'package:cabconsumidor/app/core/services/preferences_service.dart';
// import 'package:cabconsumidor/app/modules/auth/auth_repository.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_triple/flutter_triple.dart';
// import 'package:omni_track/app/core/models/user_model.dart';
// import 'package:omni_track/app/core/services/http_service.dart';
// import 'package:omni_track/app/core/services/preferences_service.dart';
// import 'package:omni_track/app/modules/auth/auth_repository.dart';

// class UserStore extends Store<UserModel> {
//   UserStore() : super(UserModel());

//   final PreferencesService service = PreferencesService();
//   final HttpService httpService = Modular.get();
//   final AuthRepository authRepository = Modular.get();

//   void updateUser(UserModel user) {
//     update(user, force: true);
//   }

//   bool checkUserNull() {
//     if (state.refresh == null && state.token == null && state.user == null) {
//       return true;
//     } else
//       return false;
//   }

//   Future<UserModel?> verifyToken(String userId) async {
//     final UserModel? user = await authRepository.verifyToken(userId);
//     return user;
//   }

//   Future<void> getUserData() async {
//     await service.getUserId().then(
//       (userId) async {
//         if (userId == null) return;
//         service.getUserPreferences(userId).then(
//           (userPreferences) async {
//             await verifyToken(userId).then(
//               (user) {
//                 httpService.setHeaders(
//                   {
//                     'Authorization': 'JWT ${user!.token}',
//                   },
//                 );
//                 updateUser(user);
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }
