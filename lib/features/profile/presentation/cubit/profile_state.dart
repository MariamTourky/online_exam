part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  String? password;
  String? isVerified;
  String? createdAt;
  ProfileState({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.isVerified,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    username,
    firstName,
    lastName,
    email,
    phone,
    role,
    password,
    isVerified,
    createdAt,
  ];

 
}

class ProfileInitial extends ProfileState {
  ProfileInitial({
     super.id,
     super.username,
     super.firstName,
     super.lastName,
     super.email,
     super.phone,
     super.role,
     super.password,
     super.isVerified,
     super.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    username,
    firstName,
    lastName,
    email,
    phone,
    role,
    password,
    isVerified,
    createdAt,
  ];

 ProfileState copyWith({
    String? id,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? role,
    String? password,
    String? isVerified,
    String? createdAt,
  }) {
    return ProfileInitial(
      id: id ?? this.id,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      password: password ?? this.password,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
