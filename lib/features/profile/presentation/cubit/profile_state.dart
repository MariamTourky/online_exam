part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
 final String? id;
 final String? username;
 final String? firstName;
 final String? lastName;
 final String? email;
 final String? phone;
 final String? role;
 final String? password;
 final String? isVerified;
 final String? createdAt;
 final Exception? error;
 final String? message;
 final String? token;

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
    this.error,
    this.message,
    this.token,
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
    error,
    message,
    token,
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
    Exception? error,
    String? message,
    String? token,
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
      error: error ?? this.error,
      message: message ?? this.message,
      token: token ?? this.token,
    );
  }
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
    super.error,
    super.message,
    super.token,
  });
}
