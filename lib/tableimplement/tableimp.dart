import 'package:flutter/material.dart';

class Product {
  String productName;
  double price;
  int quantity;

  Product(
    this.productName,
    this.price,
    this.quantity,
  );
}

class Tableimp extends StatefulWidget {
  const Tableimp({super.key});

  @override
  State<Tableimp> createState() => _TableimpState();
}

class _TableimpState extends State<Tableimp> {
  List<Product> products = [
    Product('Laptop', 1200.00, 5),
    Product('Smartphone', 800.00, 10),
    Product('Tablet', 500.00, 8),
    Product('Headphones', 100.00, 15),
    Product('Charger', 20.00, 25),
  ];

  bool isAscending = true;
  int? sortColumnIndex;

  // Generic sort function
  void sort<T>(Comparable<T> Function(Product p) getField, int columnIndex) {
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = !isAscending;
      products.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);
        return isAscending
            ? Comparable.compare(aValue, bValue)
            : Comparable.compare(bValue, aValue);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableimp'),
      ),
      body: DataTable(
        sortAscending: isAscending,
        sortColumnIndex: sortColumnIndex,
        columns: [
          DataColumn(
              label: Text('Product Name'),
              onSort: (columnIndex, _) {
                sort((Product p) => p.productName, columnIndex);
              }),
          DataColumn(
              label: Text('Price'),
              numeric: true,
              onSort: (columnIndex, _) {
                sort((Product p) => p.price, columnIndex);
              }),
          DataColumn(
            label: Text('Quantity'),
            numeric: true,
            onSort: (columnIndex, _) {
              sort((Product p) => p.quantity, columnIndex);
            },
          ),
        ],
        rows: products
            .map(
              (product) => DataRow(
                cells: [
                  DataCell(Text(product.productName)),
                  DataCell(Text(product.price.toString())),
                  DataCell(Text(product.quantity.toString())),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
