class LoginResponseBody {
  LoginResponseBody({
      this.id, 
      this.accessToken, 
      this.refreshToken,});

  LoginResponseBody.fromJson(dynamic json) {
    id = json['_id'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }
  String? id;
  String? accessToken;
  String? refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['access_token'] = accessToken;
    map['refresh_token'] = refreshToken;
    return map;
  }

}