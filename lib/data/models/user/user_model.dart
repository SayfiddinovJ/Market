class UserModel {
  final String fullName;
  final String userId;
  final String createdAt;
  final String email;
  final String password;
  final String role;
  final String company;

  UserModel({
    required this.fullName,
    required this.email,
    required this.createdAt,
    required this.userId,
    required this.password,
    required this.role,
    required this.company,
  });

  UserModel copyWith({
    String? fullName,
    String? email,
    String? createdAt,
    String? userId,
    String? password,
    String? role,
    String? company,
  }) =>
      UserModel(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
        role: role ?? this.role,
        company: company ?? this.company,
        password: password ?? this.password,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fullName: json['full_name'] as String? ?? '',
        email: json['email_address'] as String? ?? '',
        createdAt: json['created_at'] as String? ?? '',
        userId: json['user_id'] as String? ?? '',
        password: json['password'] as String? ?? '',
        role: json['role'] as String? ?? '',
        company: json['company'] as String? ?? '',
      );

  @override
  String toString() => '''
    fullName: $fullName,
    userId: $userId,
    createdAt: $createdAt,
    emailAddress: $email,
    role: $role,
    company: $company,
    password: $password
  ''';

  Map<String, dynamic> toJson() => {
        'full_name': fullName,
        'user_id': userId,
        'created_at': createdAt,
        'email_address': email,
        'password': password,
        'role': role,
        'company': company,
      };
}
