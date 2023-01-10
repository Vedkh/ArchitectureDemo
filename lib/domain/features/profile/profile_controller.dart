import 'package:archdemo/data/entities/common/user.dart';
import 'package:archdemo/domain/entities/user_profile.dart';


class ProfileController {
  const ProfileController();

  UserProfile buildProfile({required User user, required int counter}){
    return UserProfile(user: user, counter: counter);
  }

  void save({required UserProfile profile}){
    // Do nothing, because it's a demo.
    // in the real application, put some business logic here
  }
}