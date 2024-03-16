import 'package:balancers/custom/custom_card.dart';
import 'package:flutter/material.dart';
import '../../../custom/navigation_appbar.dart';
import '../../../custom/custom_divider.dart';
import '../../../utils/colors_const.dart';
import '../../../utils/platform_padding.dart';
import '../../../utils/textstyles_const.dart';
import 'cards_Cat.dart';
import 'netbanking_cat.dart';
import 'upi_cat.dart';
import 'wallet_cat.dart';

class PaymentScreen extends StatefulWidget {
  final String title;

  const PaymentScreen(this.title, {Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Map<String, List<String>> categories = {
    'creditCard': [],
    'netBanking': [],
    'upi': [],
    'wallets': ['Paytm', 'Mobikwik', 'Amazon Pay'],
  };
  Map<String, TextEditingController> controllers = {
    'creditCard': TextEditingController(),
    'cardHolderName':
        TextEditingController(), // New controller for cardholder name
    'expiryDate': TextEditingController(), // New controller for expiry date
    'cvv': TextEditingController(), // New controller for CVV
    'netBanking': TextEditingController(),
    'upi': TextEditingController(),
    'wallets': TextEditingController(),
  };

  final double listTileValue = 0;
  bool isAddCreditDetials = false;
  @override
  Widget build(BuildContext context) {
    final padding = getPlatformPadding(context);
    return Scaffold(
      appBar: NavigationAppBar(title: widget.title),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CardsCategory(
                  title: 'Card',
                  labelTitle: 'Add credit or debit card',
                  categoryItems: categories['creditCard']!,
                  controllers: controllers,
                  categories: categories),
              UPICategory(
                title: 'UPI',
                labelTitle: 'Add new UPI ID',
                categoryItems: categories['upi']!,
                controllers: controllers,
                categories: categories,
              ),
              WalletCategory(
                categoryItems: categories['wallets']!,
                category: categories,
                title: 'Wallets',
              ),
              NetBankingPaymentScreen(
                categoryItems: categories['netBanking']!,
                title: 'Netbanking',
                controllers: controllers,
                categories: categories,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///COMMONLY USING COMPENET
class PaymentComponents {
  double listTileValue = 8;

//build trailing icons
  static Widget buildItemTrailingWidget({
    required BuildContext context,
    required VoidCallback removeItemCallback,
    required String category,
    required String item,
  }) {
    Widget trailingWidget;

    switch (category) {
      case 'creditCard':
        trailingWidget = IconButton(
          onPressed: removeItemCallback,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
        );
        break;
      case 'upi':
      case 'netBanking':
        trailingWidget = TextButton(
          onPressed: removeItemCallback,
          child: Text(
            'Remove',
            style: TextStylesUtil.H2TextStyle.copyWith(
                color: ColorsUtil.primaryButnColor),
          ),
        );
        break;
      case 'wallets':
        trailingWidget = InkWell(
          onTap: () {
            // Add logic for linking
          },
          child: Text(
            'Link',
            style: TextStylesUtil.H2TextStyle.copyWith(
                color: ColorsUtil.primaryButnColor, fontSize: 15),
          ),
        );
        break;
      default:
        trailingWidget = SizedBox(); // Default to an empty widget
    }

    return trailingWidget;
  }

  //Categorey Images
  static String getCatImg(String category) {
    switch (category) {
      case 'creditCard':
        return 'assets/Visa.png';
      case 'upi':
        return 'assets/upi.png';
      case 'netBanking':
        return 'assets/Onlinebanking.png';
      case 'wallets':
        return 'assets/paymnt.png';
      default:
        return '';
    }
  }

  //build list item
  static Widget buildItem({
    required BuildContext context,
    required String item,
    required String category,
    required Function removeItemCallback,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          leading: CustomCard(
            padding: EdgeInsets.all(5),
            borderClr: Color(0xffC7C7C7),
            height: 32,
            width: 32,
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Center(
              child: Image.asset(
                getCatImg(category),
              ),
            ),
          ),
          title: Text(
            item,
            style: TextStylesUtil.H2TextStyle.copyWith(
              color: ColorsUtil.primaryblack,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: PaymentComponents.buildItemTrailingWidget(
            context: context,
            removeItemCallback: () {
              removeItemCallback();
            },
            category: category,
            item: item,
          ),
        ),
        const MyCustomDivider(
            endIndent: 20, indent: 20, dividerColor: Color(0xffCCCCCC)),
      ],
    );
  }
}
