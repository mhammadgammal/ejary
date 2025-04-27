//CREATE TABLE ${TableName.paymentTable} (
//       id INTEGER PRIMARY KEY AUTOINCREMENT,
//       start	TEXT NOT NULL,
//       end	TEXT NOT NULL,
//       amount	INTEGER NOT NULL,
//       reminder_sent	INTEGER DEFAULT 0,
//       apartment_id	INTEGER NOT NULL UNIQUE,
//       FOREIGN KEY(apartment_id) REFERENCES ${TableName.paymentTable}(id) ON DELETE CASCADE
//     );
class PaymentModel {
  final String id;
  final String apartmentId;
  final String userId;
  final double amount;
  final DateTime startDate;
  final DateTime endDate;

  PaymentModel({
    required this.id,
    required this.apartmentId,
    required this.userId,
    required this.amount,
    required this.startDate,
    required this.endDate,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'],
      apartmentId: json['apartmentId'],
      userId: json['userId'],
      amount: json['amount'],
      startDate: DateTime.parse(json['start']),
      endDate: DateTime.parse(json['end']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'apartmentId': apartmentId,
      'userId': userId,
      'amount': amount,
      'start': startDate.toIso8601String(),
      'end': endDate.toIso8601String(),
    };
  }
}
