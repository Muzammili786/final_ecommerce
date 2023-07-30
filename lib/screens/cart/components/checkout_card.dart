import 'package:open_whatsapp/open_whatsapp.dart';

import '/components/default_button.dart';
import '/services/database/user_database_helper.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';


 var mobileNum = '+923109347076';
class CheckoutCard extends StatelessWidget {
  
  final VoidCallback onCheckoutPressed;
  const CheckoutCard({
    Key key,
    @required this.onCheckoutPressed,
  }) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFDADADA).withOpacity(0.6),
            offset: Offset(0, -15),
            blurRadius: 20,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureBuilder<num>(
                  future: UserDatabaseHelper().cartTotal,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final cartTotal = snapshot.data;
                      return Text.rich(
                        TextSpan(text: "Total\n", children: [
                          TextSpan(
                            text: "\RS$cartTotal",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ]),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  // child: DefaultButton(
                  //   text: "Checkout",
                  //   press: onCheckoutPressed, 
                  // ),
                  child: MaterialButton(
                    color: Colors.green,
                    onPressed: () { 
                      FlutterOpenWhatsapp.sendSingleMessage(mobileNum, 'Hi i buy product from your store please contact us');
                     },
                    child: Text('Whatsapp', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
          ],
        ),
      ),
    );
  }
}