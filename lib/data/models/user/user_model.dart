class UserModel {
  final String image;
  final String fullName;
  final String userId;
  final String createdAt;
  final String email;
  final String phone;
  final String password;

  UserModel({
    required this.image,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.userId,
    required this.password,
  });

  UserModel copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? image,
    String? gender,
    String? createdAt,
    String? userId,
    String? password,
  }) =>
      UserModel(
        image: image ?? this.image,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        createdAt: createdAt ?? this.createdAt,
        userId: userId ?? this.userId,
        password: password ?? this.password,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        image: json['image'] as String? ?? '',
        fullName: json['full_name'] as String? ?? '',
        email: json['email_address'] as String? ?? '',
        phone: json['phone'] as String? ?? '',
        createdAt: json['created_at'] as String? ?? '',
        userId: json['user_id'] as String? ?? '',
        password: json['password'] as String? ?? '',
      );

  @override
  String toString() => '''
    image: $image,
    fullName: $fullName,
    userId: $userId,
    createdAt: $createdAt,
    emailAddress: $email,
    phone: $phone,
    password: $password
  ''';

  Map<String, dynamic> toJson() => {
        'image': image,
        'full_name': fullName,
        'user_id': userId,
        'created_at': createdAt,
        'email_address': email,
        'phone': phone,
        'password': password,
      };
}
