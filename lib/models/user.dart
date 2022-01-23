class User {
  final String? token;
  final String? id;
  final String? email;
  final String? name;
  final String? role;
  final String? created_at;
  final String? company_id;

  User(
      {this.token,
      this.id,
      this.email,
      this.name,
      this.role,
      this.created_at,
      this.company_id});

  factory User.map(Map<String, dynamic> data) {
    print(data);

    return new User(
        token: data["access_token"],
        id: data["chave"],
        email: data["email"],
        name: data["name"],
        role: data["role"],
        created_at: data["created_at"],
        company_id: data["company_id"]);
  }
}