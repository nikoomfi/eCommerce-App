import 'package:ecommerce_app/models/category.dart';
import 'package:equatable/equatable.dart';

class Wishlist extends Equatable {
  final List<Product> products;

  const Wishlist({this.products = const <Product>[]});
  @override
  // TODO: implement props
  List<Object?> get props => [products];
}
