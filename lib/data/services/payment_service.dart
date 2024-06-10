import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym_admin/util/app_exception.dart';
import '../model/transaction_model.dart';
import '../model/wallet_model.dart';

class PaymentService {
  final _walletRef = FirebaseFirestore.instance.collection('wallet');
  Future<void> transfer(
      {required String serviceProviderId,
      required String paymentId,
      required TransactionModel transactionModel,
      required String contractId,
      }) async {
    try {
      await FirebaseFirestore.instance
          .collection("adminWallet")
          .doc(paymentId)
          .update(
        {"amount": 0.0, "transactionType": true},
      );
      final walletDocSnap = await FirebaseFirestore.instance
          .collection('wallet')
          .doc(serviceProviderId)
          .get();
      if (walletDocSnap.exists) {
        final wallet = WalletModel.fromMap(walletDocSnap.data()!);
        wallet.balance += transactionModel.amount;
        wallet.transactions.add(transactionModel);
        await _walletRef.doc(serviceProviderId).set(wallet.toMap());
        await FirebaseFirestore.instance.collection("contracts").doc(contractId).update({"paymentApproved":true});
        return;
      } else {
        log("not found wallet");
        throw const AppException();
      }
    } catch (e) {
      log(e.toString());
      throw const AppException();
    }
  }
}
