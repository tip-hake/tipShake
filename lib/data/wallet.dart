class Wallet {
  final int id;
  final double balance;
  final String currency;
  final String svgPath;

  const Wallet({required this.id,required this.balance,required this.currency,required this.svgPath});
}

class WalletList {
  static List<Wallet> list () {
    const data = <Wallet> [
      Wallet(
          id: 1,
          balance: 1425,
          currency: 'USD',
          svgPath: 'assets/svg/usd.svg'
      ),
      Wallet(
          id: 2,
          balance: 500,
          currency: 'EURO',
          svgPath: 'assets/svg/euro.svg'
      ),
      Wallet(
          id: 3,
          balance: 10,
          currency: 'BTC',
          svgPath: 'assets/svg/btc.svg'
      ),
      Wallet(
          id: 4,
          balance: 45,
          currency: 'DOGE',
          svgPath: 'assets/svg/doge.svg'
      ),
      Wallet(
          id: 5,
          balance: 450,
          currency: 'GBP',
          svgPath: 'assets/svg/gbp.svg'
      ),
      Wallet(
          id: 6,
          balance: 99,
          currency: 'LTC',
          svgPath: 'assets/svg/ltc.svg'
      ),
    ];
    return data;
  }
}