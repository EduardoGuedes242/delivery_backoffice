enum MenuEnum {
  paymentType(
    '/payment-type/',
    'payment_type_ico.png',
    'payment_type_ico_selected.png',
    'Formas de Pagamento',
  ),

  products(
    '/products/',
    'product_ico.png',
    'product_ico_selected.png',
    'Administrar Produtos',
  ),

  orders(
    '/orders/',
    'order_ico.png',
    'order_ico_selected.png',
    'Administrar Pedidos',
  );

  final String route;
  final String assetIcon;
  final String assetIconSelected;
  final String label;

  const MenuEnum(
    this.route,
    this.assetIcon,
    this.assetIconSelected,
    this.label,
  );
}
