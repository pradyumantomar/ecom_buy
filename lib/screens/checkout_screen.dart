import 'package:ecombuy/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  CardFieldInputDetails? _card;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Checkout',
          style: textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Insert your card details',
                style:
                    textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16.0,
              ),
              CardField(
                onCardChanged: (card) {
                  setState(() {
                    _card = card;
                  });
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(child: Text('Total: Rs${cart.totalPrice}')),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: FilledButton(
                onPressed: loading ? null : () => handlePayment(),
                child: const Text('Pay Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  handlePayment() async {
    if (_card?.complete != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in your card details'),
        ),
      );
      return;
    }

    setState(() {
      loading = true;
    });

    try {
      await processPayment();
    } catch (err) {
      throw Exception(err.toString());
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  processPayment() async {
    final PaymentMethod paymentMethod =
        await Stripe.instance.createPaymentMethod(
      params: const PaymentMethodParams.card(
        paymentMethodData: PaymentMethodData(),
      ),
    );
  }
}
