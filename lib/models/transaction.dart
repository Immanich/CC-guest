class Transaction {
  final int id;
  final String type_of_transaction;

  Transaction({
    required this.id,
    required this.type_of_transaction,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      type_of_transaction: json['type_of_transaction'].toString(),
    );
  }
}
