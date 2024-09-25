import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting and parsing dates

class TransferHistoryScreen extends StatefulWidget {
  const TransferHistoryScreen({super.key});

  @override
  _TransferHistoryScreenState createState() => _TransferHistoryScreenState();
}

class _TransferHistoryScreenState extends State<TransferHistoryScreen> {
  // Sample list of transactions with dates
  final List<Map<String, dynamic>> transactions = [
    {"date": "2024-09-01", "description": "Groceries", "amount": "-Rp 200,000"},
    {"date": "2024-09-02", "description": "Salary", "amount": "+Rp 5,000,000"},
    {"date": "2024-08-03", "description": "Coffee", "amount": "-Rp 50,000"},
    {
      "date": "2024-08-04",
      "description": "Electricity Bill",
      "amount": "-Rp 500,000"
    },
    {
      "date": "2024-07-05",
      "description": "Internet Subscription",
      "amount": "-Rp 300,000"
    },
    {
      "date": "2024-07-06",
      "description": "Gym Membership",
      "amount": "-Rp 250,000"
    },
    {
      "date": "2024-09-07",
      "description": "Freelance Work",
      "amount": "+Rp 1,200,000"
    },
    {"date": "2024-08-08", "description": "Dinner", "amount": "-Rp 150,000"},
    {
      "date": "2024-07-09",
      "description": "Movie Tickets",
      "amount": "-Rp 100,000"
    },
    {
      "date": "2024-09-10",
      "description": "Online Shopping",
      "amount": "-Rp 400,000"
    },
  ];

  String selectedMonth = 'All'; // Default is to show all transactions

  // Get list of months from transactions
  List<String> getTransactionMonths() {
    List<String> months = transactions
        .map((t) {
          DateTime date = DateFormat('yyyy-MM-dd').parse(t['date']);
          return DateFormat('MMMM').format(date); // Get month as full name
        })
        .toSet()
        .toList();

    months.sort((a, b) => DateFormat('MMMM')
        .parse(a)
        .compareTo(DateFormat('MMMM').parse(b))); // Sort by month order
    months.insert(
        0, 'All'); // Insert 'All' at the beginning to allow all months
    return months;
  }

  // Filter transactions by selected month
  List<Map<String, dynamic>> getFilteredTransactions() {
    if (selectedMonth == 'All') {
      return transactions;
    }

    return transactions.where((t) {
      DateTime date = DateFormat('yyyy-MM-dd').parse(t['date']);
      return DateFormat('MMMM').format(date) == selectedMonth;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredTransactions = getFilteredTransactions();
    final availableMonths = getTransactionMonths();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transfer & Transaction History",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown to select month
            DropdownButton<String>(
              value: selectedMonth,
              onChanged: (String? newValue) {
                setState(() {
                  selectedMonth = newValue!;
                });
              },
              items:
                  availableMonths.map<DropdownMenuItem<String>>((String month) {
                return DropdownMenuItem<String>(
                  value: month,
                  child: Text(month),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Transaction List
            Expanded(
              child: ListView.builder(
                itemCount: filteredTransactions.length,
                itemBuilder: (context, index) {
                  final transaction = filteredTransactions[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        transaction['amount'].startsWith('-')
                            ? Icons.arrow_downward
                            : Icons.arrow_upward,
                        color: transaction['amount'].startsWith('-')
                            ? Colors.red
                            : Colors.green,
                      ),
                      title: Text(transaction['description']),
                      subtitle: Text(transaction['date']),
                      trailing: Text(
                        transaction['amount'],
                        style: TextStyle(
                          color: transaction['amount'].startsWith('-')
                              ? Colors.red
                              : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
