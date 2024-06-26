part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

class Wishlistloading extends WishlistState {}

class Wishlistloaded extends WishlistState {
  final Wishlist wishlist;

  const Wishlistloaded({this.wishlist = const Wishlist()});
  @override
  List<Object> get props => [wishlist];

}

class WishlistError extends WishlistState {}
