// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import 'payment_type_controller.dart';
import 'widgets/payment_type_header.dart';
import 'widgets/payment_type_item.dart';

class PaymentTypePage extends StatefulWidget {
  const PaymentTypePage({super.key});

  @override
  State<PaymentTypePage> createState() => _PaymentTypePageState();
}

class _PaymentTypePageState extends State<PaymentTypePage>
    with Loader, Messages {
  final controller = Modular.get<PaymentTypeController>();

  final disposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final statusDisposer = reaction((_) => controller.stuts, (status) {
        switch (status) {
          case PaymentTypeStateStatus.initial:
            break;

          case PaymentTypeStateStatus.loading:
            showLoader();
            break;

          case PaymentTypeStateStatus.loaded:
            hideLoader();
            break;

          case PaymentTypeStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ??
                'Erro Ao buscar formas de pagamento');
            break;
        }
      });
      disposer.addAll([statusDisposer]);
      controller.loadPayments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.only(left: 40, top: 40, right: 40),
      child: Column(
        children: [
          PaymentTypeHeader(),
          SizedBox(height: 50),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 120,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                maxCrossAxisExtent: 680,
              ),
              itemBuilder: (context, index) {
                return PaymentTypeItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
