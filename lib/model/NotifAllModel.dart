class NotifAllModel {
  String status;
  String message;

  NotifAllModel({
    this.status,
    this.message,
  });

  factory NotifAllModel.fromJson(Map<String, dynamic> json) => new NotifAllModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
  };
}