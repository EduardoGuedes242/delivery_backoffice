import 'package:flutter/material.dart';
import '../../../core/ui/widgets/base_header.dart';

class PaymentTypeHeader extends StatelessWidget {
  const PaymentTypeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseHeader(
      title: 'Administrar formas de pagamento',
      buttonLabel: 'ADICIONAR',
      buttonPressed: () {},
      filterWidget: DropdownButton<bool>(
        value: null,
        onChanged: (value) {},
        items: const [
          DropdownMenuItem(value: null, child: Text('Todos')),
          DropdownMenuItem(value: true, child: Text('Ativos')),
          DropdownMenuItem(value: false, child: Text('Inativos')),
        ],
      ),
    );
  }
}
