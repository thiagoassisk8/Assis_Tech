import 'package:assis_tech/screens/Authcomponents/constants.dart';

class User {
  String? token;
  String? id;
  String? email;
  String? name;
  String? role;
  String? created_at;
  String? company_id;
  String? error;

  User(
      {this.token,
      this.id,
      this.email,
      this.name,
      this.role,
      this.created_at,
      this.company_id,
      this.error});

  factory User.map(Map<String, dynamic> data) {
    print(data);

    return new User(
        token: data["access_token"],
        id: data["id"].toString(),
        email: data["email"],
        name: data["name"],
        role: data["role"],
        created_at: data["created_at"],
        company_id: data["company_id"],
        error: data["error"]);
  }
}
