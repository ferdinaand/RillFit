import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riilfit/src/modules/dashboard/gym/gym_membership_plans/controllers/gym-membership_plans_controller.dart';
import 'package:riilfit/src/presentation/global_widgets/appbar.ui.dart';
import 'package:riilfit/src/presentation/resources/colors.res.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OpenWebview extends StatefulWidget {
  OpenWebview({
    super.key,
  });

  @override
  State<OpenWebview> createState() => _OpenWebviewState();
}

final gymPlansController = Get.put(GymPlansController());

class _OpenWebviewState extends State<OpenWebview> {
  static String paymentHtmlForm = '''
<!DOCTYPE html>
<html>
<head>
    <title>Payment Form</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-size: 40px; /* Adjust the font size as needed */
        }
        form {
            text-align: center;
            max-width: 400px;
        }
          button[type="submit"] {
            width: 200px; /* Adjust the width as needed */
            height: 50px; /* Adjust the height as needed */
            font-size: 40px; /* Adjust the font size as needed */
        }
    </style>
</head>
<body>
    <form method="POST" action="https://checkout.flutterwave.com/v3/hosted/pay">
        <div>
            Your order is ₦3,400
        </div>
        <input type="hidden" name="public_key" value="FLWPUBK_TEST-dd5ad6338e5b0ba65dcf0ae9481d0792-X" />
        <input type="hidden" name="customer[email]" value="jessepinkman@walterwhite.org" />
        <input type="hidden" name="customer[name]" value="${gymPlansController.fullname.value}" />
        <input type="hidden" name="tx_ref" value="bitethtx-019203" />
        <input type="hidden" name="amount" value="3400" />
        <input type="hidden" name="currency" value="NGN" />
        <input type="hidden" name="meta[token]" value="54" />
        <input type="hidden" name="redirect_url" value="https://riilfit-api.vercel.app/debit-cards/new/?userId= " />
        <input type="hidden" name="payment_options" value="card" />
        <br>
        <button type="submit" id="start-payment-button">Pay Now</button>
    </form>
</body>
</html>
''';

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadHtmlString(
      paymentHtmlForm,
      baseUrl:
          'https://checkout.flutterwave.com/v3/hosted/pay', // Replace with your base URL
    );
  // ..setUserAgent('Chrome/117.0.0.0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbarUi(
        title: '',
        // actions: [
        //   GestureDetector(
        //       onTap: webView.clearCache(true),
        //       child: Icon(Icons.abc))
        // ],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
