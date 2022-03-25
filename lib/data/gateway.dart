class Gateway {
  final int id;
  final String name;
  final String currency;
  final String svgPath;

  const Gateway({required this.id,required this.name,required this.currency,required this.svgPath});
}

class GatewayList {
  static List<Gateway> list () {
    const data = <Gateway> [
      Gateway(
          id: 1,
          name: 'PayPal',
          currency: 'USD',
          svgPath: 'assets/svg/gateway/paypal.svg'
      ),
      Gateway(
          id: 2,
          name: 'Stripe',
          currency: 'EURO',
          svgPath: 'assets/svg/gateway/stripe.svg'
      ),
      Gateway(
          id: 3,
          name: 'BitCoin',
          currency: 'BTC',
          svgPath: 'assets/svg/gateway/bitcoin.svg'
      ),
      Gateway(
          id: 4,
          name: 'Payoneer',
          currency: 'USD',
          svgPath: 'assets/svg/gateway/payoneer.svg'
      ),
      Gateway(
          id: 5,
          name: 'VoguePay',
          currency: 'USD',
          svgPath: 'assets/svg/gateway/voguepay.svg'
      ),
      Gateway(
          id: 6,
          name: 'Skrill',
          currency: 'USD',
          svgPath: 'assets/svg/gateway/skrill.svg'
      ),
      Gateway(
          id: 7,
          name: 'LiteCoin',
          currency: 'LTC',
          svgPath: 'assets/svg/gateway/litecoin.svg'
      ),
      Gateway(
          id: 8,
          name: 'Blockchain',
          currency: 'USD',
          svgPath: 'assets/svg/gateway/blockchain.svg'
      ),
      Gateway(
          id: 9,
          name: 'Stripe',
          currency: 'GBP',
          svgPath: 'assets/svg/gateway/stripe.svg'
      ),
      Gateway(
          id: 10,
          name: 'PayPal',
          currency: 'GBP',
          svgPath: 'assets/svg/gateway/paypal.svg'
      ),
      Gateway(
          id: 11,
          name: 'Apple Pay',
          currency: 'USD',
          svgPath: 'assets/svg/gateway/apple_pay.svg'
      ),
    ];
    return data;
  }
}