class SignUpResponseBody {
  SignUpResponseBody({
    this.id,
    this.displayName,
    this.accessToken,
    this.refreshToken,
  });

  SignUpResponseBody.fromJson(dynamic json) {
    id = json['_id'];
    displayName = json['displayName'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  String? id;
  String? displayName;
  String? accessToken;
  String? refreshToken;
}
