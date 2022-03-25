class Deposit {
  final int id;
  final double amount;
  final String currency, date, month, sender, remarks;

  const Deposit({required this.id,required this.amount,required this.currency,required this.date, required this.month, required this.sender, required this.remarks});
}

class DepositList {
  static List<Deposit> list () {
    const data = <Deposit> [
      Deposit(
          id: 1,
          amount: 150,
          currency: 'USD',
          date: '07',
          month: 'Jan',
          sender: 'Jackson',
          remarks: 'Deposit Money'
      ),
      Deposit(
          id: 2,
          amount: 50,
          currency: 'BTC',
          date: '14',
          month: 'Dec',
          sender: 'Jackson',
          remarks: 'Deposit Money'
      ),
      Deposit(
          id: 3,
          amount: 50,
          currency: 'GBP',
          date: '25',
          month: 'Nov',
          sender: 'Jackson',
          remarks: 'Deposit Money'
      ),
      Deposit(
          id: 4,
          amount: 400,
          currency: 'LTC',
          date: '20',
          month: 'Nov',
          sender: 'Jackson',
          remarks: 'Deposit Money'
      ),
      Deposit(
          id: 5,
          amount: 750,
          currency: 'EURO',
          date: '06',
          month: 'Oct',
          sender: 'Jackson',
          remarks: 'Deposit Money'
      ),
      Deposit(
          id: 6,
          amount: 450,
          currency: 'USD',
          date: '04',
          month: 'AUg',
          sender: 'Jackson',
          remarks: 'Deposit Money'
      ),
      Deposit(
          id: 7,
          amount: 29.99,
          currency: 'DOGE',
          date: '30',
          month: 'Sep',
          sender: 'Jackson',
          remarks: 'Deposit Money'
      ),
      Deposit(
          id: 8,
          amount: 1425,
          currency: 'GBP',
          date: '03',
          month: 'Jun',
          sender: 'Jackson',
          remarks: 'Deposit Money'
      ),
      Deposit(
          id: 9,
          amount: 900,
          currency: 'USD',
          date: '11',
          month: 'May',
          sender: 'Jackson',
          remarks: 'Deposit Money'
      ),
    ];
    return data;
  }
}