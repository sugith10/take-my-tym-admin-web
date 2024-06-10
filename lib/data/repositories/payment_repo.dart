import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym_admin/data/model/transaction_model.dart';

import '../services/payment_service.dart';

class PaymentRepo {
  Future<void> pay({
    required String serviceProviderId,
    required String paymentId,
    required double amount,
          required String contractId,
  }) async {
    log("on approval");
    final TransactionModel model = TransactionModel(
      timestamp: Timestamp.now(),
      amount: amount,
      transactionType: true,
    );
    try {
      PaymentService().transfer(
        serviceProviderId: serviceProviderId,
        paymentId: paymentId,
        transactionModel: model,
        contractId: contractId,
      );
      log("completed");
    } catch (e) {
      log(e.toString());
    }
  }
}
