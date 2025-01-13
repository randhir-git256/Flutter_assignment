// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_assignment/user_data.dart';
//
// class DataSheet extends StatefulWidget {
//   const DataSheet({super.key});
//
//   @override
//   State<DataSheet> createState() => _DataSheetState();
// }
//
// class _DataSheetState extends State<DataSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text('Table')
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//
//           ),
//
//         ),
//
//       ),
//
//     );
//   }
// }
//


import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'user_data.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  void _navigateToDashboard() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DashboardPage(),
      ),
    ).then((_) {
      // Rebuild the table when returning from the dashboard
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details Table'),
        backgroundColor: Colors.blue,
      ),
      body: user.isNotEmpty
          ? ListView.builder(
        itemCount: user.length,
        itemBuilder: (context, index) {
          final userDetail = user[index];
          return ListTile(
            title: Text(userDetail.name),
            subtitle: Text('Age: ${userDetail.age}'),
          );
        },
      )
          : const Center(
        child: Text(
          'No users to display. Add users from the Dashboard!',
          style: TextStyle(fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToDashboard,
        child: const Icon(Icons.add),
      ),
    );
  }
}

