import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../models/payment_type_model.dart';
import '../../repositories/payment_type/payment_type_repository.dart';
part 'payment_type_controller.g.dart';

enum PaymentTypeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class PaymentTypeController = PaymentTypeControllerBase
    with _$PaymentTypeController;

abstract class PaymentTypeControllerBase with Store {
  final PaymentTypeRepository _paymentTypeRepository;

  @readonly
  var _stuts = PaymentTypeStateStatus.initial;

  @readonly
  var _paymentTypes = <PaymentTypeModel>[];

  @readonly
  String? _errorMessage;

  PaymentTypeControllerBase(this._paymentTypeRepository);

  @action
  Future<void> loadPayments() async {
    try {
      _stuts = PaymentTypeStateStatus.loading;
      _paymentTypes = await _paymentTypeRepository.findAll(null);
      _stuts = PaymentTypeStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao carregar as formas de pagamentos', error: e, stackTrace: s);
      _errorMessage = 'Erro ao carregar as formas de pagamentos';
      _stuts = PaymentTypeStateStatus.error;
    }
  }
}
