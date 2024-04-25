// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransactionModel {
  final String date;
  final String transactionId;
  final String senderName;
  final String receiverName;
  final String paymentStatus;
  final double? profit;
  TransactionModel({
    required this.date,
    required this.transactionId,
    required this.senderName,
    required this.receiverName,
    required this.paymentStatus,
    this.profit,
  });

  TransactionModel copyWith({
    String? date,
    String? transactionId,
    String? senderName,
    String? receiverName,
    String? paymentStatus,
    double? profit,
  }) {
    return TransactionModel(
      date: date ?? this.date,
      transactionId: transactionId ?? this.transactionId,
      senderName: senderName ?? this.senderName,
      receiverName: receiverName ?? this.receiverName,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      profit: profit ?? this.profit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'transactionId': transactionId,
      'senderName': senderName,
      'receiverName': receiverName,
      'paymentStatus': paymentStatus,
      'profit': profit,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      date: map['date'] as String,
      transactionId: map['transactionId'] as String,
      senderName: map['senderName'] as String,
      receiverName: map['receiverName'] as String,
      paymentStatus: map['paymentStatus'] as String,
      profit: map['profit'] != null ? map['profit'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) => TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TransactionModel(date: $date, transactionId: $transactionId, senderName: $senderName, receiverName: $receiverName, paymentStatus: $paymentStatus, profit: $profit)';
  }

  @override
  bool operator ==(covariant TransactionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.date == date &&
      other.transactionId == transactionId &&
      other.senderName == senderName &&
      other.receiverName == receiverName &&
      other.paymentStatus == paymentStatus &&
      other.profit == profit;
  }

  @override
  int get hashCode {
    return date.hashCode ^
      transactionId.hashCode ^
      senderName.hashCode ^
      receiverName.hashCode ^
      paymentStatus.hashCode ^
      profit.hashCode;
  }
}
