import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipcodeController = TextEditingController();

    return Scaffold(
      appBar: CustomAppbar(title: 'Check out'),
      bottomNavigationBar: custom_navigatorbar(
        screen: routeName,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer Information',
              style: Theme.of(context).textTheme.headline3,
            ),
            _buildTextFormField(emailController, context, 'Email'),
            _buildTextFormField(nameController, context, 'Full Name'),
            Text(
              'Delivery Information',
              style: Theme.of(context).textTheme.headline3,
            ),
            _buildTextFormField(addressController, context, 'Address'),
            _buildTextFormField(countryController, context, 'Country'),
            _buildTextFormField(cityController, context, 'City'),
            _buildTextFormField(zipcodeController, context, 'Zip Code'),
            Text(
              'Order Summary',
              style: Theme.of(context).textTheme.headline3,
            ),
            OrderSummary(),
          ],
        ),
      ),
    );
  }

  Padding _buildTextFormField(
    TextEditingController controller,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        SizedBox(
          width: 75,
          child: Text(
            labelText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  )
                )
              ),
            )
          ),
      ]),
    );
  }
}
