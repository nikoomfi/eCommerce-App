import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/models/category.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(Wishlistloading());

  @override
  Stream<WishlistState> mapEventToState(
    WishlistEvent event,
  ) async* {
    if (event is StartWishlist) {
      yield* _mapStartWishlistToState();
    } else if (event is AddWishlistProduct) {
      yield* _mapAddWishlistToState(event, state);
    } else if (event is RemoveWishlistProduct) {
      yield* _mapRemoveWishlistToState(event, state);
    }
  }

  Stream<WishlistState> _mapStartWishlistToState() async* {
      yield Wishlistloading();
      try {
        await Future<void>.delayed(Duration(seconds: 1));
        yield const Wishlistloaded();
      } catch (_) {}
    }

  Stream<WishlistState> _mapAddWishlistToState(
    AddWishlistProduct event,
    WishlistState state,
  ) async* {
    if (state is Wishlistloaded) {
      try {
        yield Wishlistloaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..add(event.product),
          ),
        );
      } catch (_) {}
    }
  }

  Stream<WishlistState> _mapRemoveWishlistToState(
    RemoveWishlistProduct event,
    WishlistState state,
  ) async* {
    if (state is Wishlistloaded) {
      try {
        yield Wishlistloaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..remove(event.product),
          ),
        );
      } catch (_) {}
    }
  }
}
