class ToggleFavoritesModel {
  late bool status;
  String? message;

  ToggleFavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
