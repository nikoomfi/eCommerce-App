import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return Column(
          children: [
            Column(
              children: [
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SubTotal',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            '\£${state.cart.subtotatalString}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Free',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            '\£${state.cart.deliveryFreeString}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      color: Colors.pink[300],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          Text(
                            '\£${state.cart.totalString}',
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
        }
        else{
           return Text('Somthing went Wrong!');
        }
        
      },
    );
  }
}
