import 'package:archdemo/data/entities/common/user.dart';


class UserProfile{
  final User user;
  final int counter;

  UserProfile({required this.user, required this.counter});

  UserProfile copyWith({User? user, int? counter}){
    return UserProfile(
      user: user ?? this.user,
      counter: counter ?? this.counter,
    );
  }
}