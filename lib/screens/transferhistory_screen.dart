import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting and parsing dates

class TransferHistoryScreen extends StatefulWidget {
  const TransferHistoryScreen({super.key});

  @override
  TransferHistoryScreenState createState() => TransferHistoryScreenState();
}

class TransferHistoryScreenState extends State<TransferHistoryScreen> {
  final TextEditingController _searchController = TextEditingController();

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
  String searchTerm = ''; // Search term for filtering

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

  // Filter transactions by selected month and search term
  List<Map<String, dynamic>> getFilteredTransactions() {
    List<Map<String, dynamic>> filteredTransactions = transactions;

    // Filter by month
    if (selectedMonth != 'All') {
      filteredTransactions = filteredTransactions.where((t) {
        DateTime date = DateFormat('yyyy-MM-dd').parse(t['date']);
        return DateFormat('MMMM').format(date) == selectedMonth;
      }).toList();
    }

    // Filter by search term
    if (searchTerm.isNotEmpty) {
      filteredTransactions = filteredTransactions.where((t) {
        return t['description']
            .toLowerCase()
            .contains(searchTerm.toLowerCase());
      }).toList();
    }

    return filteredTransactions;
  }

  // Calculate total income and expenses
  Map<String, String> getSummary() {
    double totalIncome = 0;
    double totalExpense = 0;

    for (var transaction in transactions) {
      String amount =
          transaction['amount'].replaceAll('Rp ', '').replaceAll(',', '');
      if (transaction['amount'].startsWith('-')) {
        totalExpense += double.parse(amount);
      } else {
        totalIncome += double.parse(amount);
      }
    }

    return {
      "income": "+Rp ${NumberFormat('#,###').format(totalIncome)}",
      "expense": "-Rp ${NumberFormat('#,###').format(totalExpense)}",
    };
  }

  @override
  Widget build(BuildContext context) {
    final filteredTransactions = getFilteredTransactions();
    final availableMonths = getTransactionMonths();
    final summary = getSummary();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transaction History",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF7EBDA6),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Container(
                color: Colors.white.withOpacity(0.5),
              ),
              Padding(
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
                      items: availableMonths
                          .map<DropdownMenuItem<String>>((String month) {
                        return DropdownMenuItem<String>(
                          value: month,
                          child: Text(month),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    // Search bar
                    TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        labelText: "Search by description",
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchTerm = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    // Summary
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Total Income",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              summary['income']!,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              "Total Expense",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              summary['expense']!,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Transaction List
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredTransactions.length,
                        itemBuilder: (context, index) {
                          final transaction = filteredTransactions[index];
                          return Card(
                            color: Colors.teal.shade50,
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
                              subtitle: Text(DateFormat('d MMMM yyyy').format(
                                  DateFormat('yyyy-MM-dd')
                                      .parse(transaction['date']))),
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
            ],
          ),
        ),
      ),
    );
  }
}
