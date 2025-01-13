// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_assignment/user_data.dart';
//
// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});
//
//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage> {
//   late TextEditingController _nameController;
//   late TextEditingController _ageController;
//   bool _isButtonEnabled = false;
//
//   @override
//   void initState() {
//     _nameController = TextEditingController();
//     _ageController = TextEditingController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _ageController.dispose();
//     super.dispose();
//   }
//
//   void _updateButtonState() {
//     setState(() {
//       _isButtonEnabled =
//           _nameController.text.isNotEmpty && _ageController.text.isNotEmpty;
//     });
//   }
//
//   void _submitData() {
//     final String name = _nameController.text;
//     final String ageString = _ageController.text;
//
//     if (name.isEmpty || ageString.isEmpty) {
//       return;
//     }
//
//     final int? age = int.tryParse(ageString);
//     if (age == null) {
//       return;
//     }
//
//     // Add new user to the list
//     addUserDetails(name, age);
//
//     _nameController.clear();
//     _ageController.clear();
//
//     setState(() {}); // Update UI after adding a user
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('User $name added successfully!')),
//     );
//   }
//
//   void _deleteUser(int index) {
//     setState(() {
//       user.removeAt(index);
//     });
//   }
//
//   int _calculateTotalAge() {
//     return user.fold(0, (sum, user) => sum + user.age);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text('UserDetails'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text.rich(
//                 TextSpan(
//                   text: 'Name ',
//                   style: TextStyle(color: Colors.black, fontSize: 20),
//                   children: [
//                     TextSpan(
//                       text: '*',
//                       style: TextStyle(color: Colors.red, fontSize: 20),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 8.0),
//               TextField(
//                 controller: _nameController,
//                 onChanged: (value) {
//                   _updateButtonState();
//                 },
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter your name',
//                 ),
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
//                 ],
//                 style: const TextStyle(height: 1.5),
//               ),
//               const SizedBox(height: 16.0),
//               const Text.rich(
//                 TextSpan(
//                   text: 'Age ',
//                   style: TextStyle(color: Colors.black, fontSize: 20),
//                   children: [
//                     TextSpan(
//                       text: '*',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 8.0),
//               TextField(
//                 controller: _ageController,
//                 onChanged: (value) {
//                   _updateButtonState();
//                 },
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter your age',
//                 ),
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                 ],
//                 style: const TextStyle(height: 1.5),
//               ),
//               const SizedBox(height: 16.0),
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: _isButtonEnabled ? _submitData : null,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor:
//                         _isButtonEnabled ? Colors.blue : Colors.grey,
//                   ),
//                   child: const Text('Submit'),
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               _userListTable(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _userListTable() {
//     return Column(
//       children: [
//         if (user.isNotEmpty) ...[
//           Table(
//             border: TableBorder.all(),
//             columnWidths: const {
//               0: FlexColumnWidth(2),
//               1: FlexColumnWidth(1),
//               2: FlexColumnWidth(1),
//             },
//             children: [
//               // Header Row
//               const TableRow(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text(
//                       'Name',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text(
//                       'Age',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text(
//                       'Action',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               // User Rows
//               ...user.asMap().entries.map(
//                 (entry) {
//                   final index = entry.key;
//                   final user = entry.value;
//                   return TableRow(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(user.name),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text('${user.age}'),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: SizedBox(
//                           width: 80,
//                           height: 50,
//                           child: InkWell(
//                             onTap: () => _deleteUser(index),
//                             // When tapped, delete the user
//                             borderRadius: BorderRadius.circular(8.0),
//                             splashColor: Colors.blue.withOpacity(0.3),
//                             // Splash color effect
//                             child: Ink(
//                               decoration: BoxDecoration(
//                                 color: Colors.white60,
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               child: const Icon(
//                                 Icons.delete,
//                                 size: 30,
//                                 color:
//                                     Colors.red, // Icon color (red for delete)
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       // Padding(
//                       //   padding: const EdgeInsets.all(8.0),
//                       //   child: SizedBox(
//                       //     width: 30,
//                       //     height: 30,
//                       //     child: ElevatedButton(
//                       //       style: ElevatedButton.styleFrom(
//                       //         backgroundColor: Colors.white60,
//                       //         shape: RoundedRectangleBorder(
//                       //           borderRadius: BorderRadius.circular(4.0),
//                       //         ),
//                       //       ),
//                       //       onPressed: () => _deleteUser(index),
//                       //       child: const Icon(Icons.delete, size: 30),
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   );
//                 },
//               ),
//               // Total Age Row
//               TableRow(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text(
//                       'Total Age',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       '${_calculateTotalAge()}',
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 18),
//                     ),
//                   ),
//                   const SizedBox.shrink(),
//                 ],
//               ),
//             ],
//           ),
//         ] else
//           const Text(
//             'No users added yet.',
//             style: TextStyle(fontSize: 18),
//           ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'user_data.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  void _submitData() {
    final name = _nameController.text;
    final age = int.tryParse(_ageController.text);

    if (name.isEmpty || age == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid input. Please try again.')),
      );
      return;
    }

    addUserDetails(name, age);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User $name added successfully!')),
    );

    _nameController.clear();
    _ageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User Details'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Name'),
            TextField(controller: _nameController),
            const SizedBox(height: 16.0),
            const Text('Age'),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Show Table'),
            ),
          ],
        ),
      ),
    );
  }
}
