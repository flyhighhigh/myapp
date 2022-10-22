
const String userTable = "users";

class UserField {
  static final List<String> values = [
    account,password,id,name
  ];

  static const String account = "account";
  static const String password = "password";
  static const String id = "id";
  static const String name = "name";
}

class User {
    User({
        required this.account,
        this.password,
        required this.name,
        this.id,
    });

    String account;
    String? password;
    String name;
    int? id;

    factory User.fromJson(Map<String, dynamic> json) => User(
        account: json["account"],
        password: json["password"],
        name: json["name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        UserField.account: account,
        UserField.password: password,
        UserField.name: name,
        UserField.id: id,
    };

    User copy ({
      String? account,
      String? password,
      String? name,
      int? id
    }){
      return User(
        account: account ?? this.account,
        password: password ?? this.password,
        name: name ?? this.name,
        id: id ?? this.id
      );
    }

    bool isCaptain(){
      return account == "captain";
    }
}

