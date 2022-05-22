class VerifyResponse{

  VerifyResponse({
    this.token,
  });

  String? token;

  factory VerifyResponse.fromJson(Map<String, dynamic> json)=>VerifyResponse(
    token: json["token"],
  );

  Map<String, dynamic> toJson()=>{
    "token": token
  };
}