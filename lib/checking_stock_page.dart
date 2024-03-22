import 'package:flutter/material.dart';

import 'about_medicine.dart';
import 'add_medicine.dart';

class Medicine {
  final String name;
  final double price;
  final int availableStock;
  final String demand;
  final String imagePath;

  Medicine({
    required this.name,
    required this.price,
    required this.availableStock,
    required this.demand,
    required this.imagePath,
  });
}

class CheckingStockPage extends StatefulWidget {
  @override
  _CheckingStockPageState createState() => _CheckingStockPageState();
}

class _CheckingStockPageState extends State<CheckingStockPage> {
  final List<Medicine> medicines = [
    Medicine(name: 'Dolo 650', price: 10.00, availableStock: 100, demand: 'High', imagePath: 'assets/medicine_image.jpg'),
    Medicine(name: 'Citrazine', price: 30.00, availableStock: 50, demand: 'Medium', imagePath: 'assets/citrazine.jpg'),
    Medicine(name: 'Quintizine', price: 20.00, availableStock: 80, demand: 'High', imagePath: 'assets/quintizine.jpg'),
    Medicine(name: 'Zyliktitus', price: 50.00, availableStock: 70, demand: 'Low', imagePath: 'assets/zyliktitus2.jpg'),
    Medicine(name: 'Dextromethorphan', price: 60.00, availableStock: 10, demand: 'Low', imagePath: 'assets/dextromethorphan.jpg'),
    Medicine(name: 'Mucinex', price: 60.00, availableStock: 20, demand: 'High', imagePath: 'assets/mucinex.jpg'),
  ];

  late List<Medicine> filteredMedicines;

  @override
  void initState() {
    super.initState();
    filteredMedicines = medicines;
  }

  void filterMedicines(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredMedicines = medicines.where((medicine) => medicine.name.toLowerCase().contains(query.toLowerCase())).toList();
      } else {
        filteredMedicines = medicines;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checking Stock'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => filterMedicines(value),
              decoration: InputDecoration(
                labelText: 'Search for Medicine',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMedicines.length,
              itemBuilder: (context, index) {
                final medicine = filteredMedicines[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutMedicinePage()),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(medicine.imagePath),
                      ),
                      title: Text(medicine.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price: \$${medicine.price.toStringAsFixed(2)}'),
                          Text('Available Stock: ${medicine.availableStock}'),
                          Text('Demand: ${medicine.demand}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMedicinePage()),
              );
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
