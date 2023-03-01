class Global {
  String? baseUrl;
  String? apiPath;
  String? version;

  Global({this.baseUrl, this.apiPath, this.version});

  factory Global.fromJson(Map<String, dynamic> json) {
    return Global(
      baseUrl: json['base_url'],
      apiPath: json['api_path'],
      version: json['version'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['laravel_base_url'] = baseUrl;
    data['api_path'] = apiPath;
    data['version'] = version;
    return data;
  }
}
