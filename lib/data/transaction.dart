class Transaction {
  final int id;
  final double amount;
  final String currency, date, month, sender, remarks;

  const Transaction({required this.id,required this.amount,required this.currency,required this.date, required this.month, required this.sender, required this.remarks});
}

class TransactionList {
  static List<Transaction> list () {
    const data = <Transaction> [
      Transaction(
          id: 1,
          amount: -412,
          currency: 'XRP',
          date: '12',
          month: 'Jun',
          sender: 'Jenny',
          remarks: 'Tip Money'
      ),
      Transaction(
          id: 2,
          amount: 600,
          currency: 'XRP',
          date: '30',
          month: 'Jan',
          sender: 'Zoana',
          remarks: 'Tip Money'
      ),
      Transaction(
          id: 3,
          amount: -240,
          currency: 'XRP',
          date: '14',
          month: 'Feb',
          sender: 'Michel',
          remarks: 'Withdraw Money'
      ),
      Transaction(
          id: 4,
          amount: 150,
          currency: 'XRP',
          date: '11',
          month: 'Dec',
          sender: 'Russel',
          remarks: 'Request Tip'
      ),
      Transaction(
          id: 5,
          amount: 750,
          currency: 'EURO',
          date: '06',
          month: 'Oct',
          sender: 'Jackson',
          remarks: 'Rewarded Gift'
      ),
      Transaction(
          id: 6,
          amount: 450,
          currency: 'USD',
          date: '04',
          month: 'AUg',
          sender: 'Jackson',
          remarks: 'Tip Money'
      ),
      Transaction(
          id: 7,
          amount: -29.99,
          currency: 'XRP',
          date: '30',
          month: 'Sep',
          sender: 'Jackson',
          remarks: 'Yearly Charge'
      ),
      Transaction(
          id: 8,
          amount: -1425,
          currency: 'GBP',
          date: '03',
          month: 'Jun',
          sender: 'Jackson',
          remarks: 'Bill Paid'
      ),
      Transaction(
          id: 9,
          amount: 900,
          currency: 'USD',
          date: '11',
          month: 'May',
          sender: 'Jackson',
          remarks: 'For personal use'
      ),
    ];
    return data;
  }
}
