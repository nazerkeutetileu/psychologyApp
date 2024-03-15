import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../routing/app_routes.dart';

class ListOfTestsPage extends StatefulWidget {
  const ListOfTestsPage({Key? key}) : super(key: key);

  @override
  State<ListOfTestsPage> createState() => _ListOfTestsPageState();
}

class _ListOfTestsPageState extends State<ListOfTestsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _photolinkController = TextEditingController();

  List<Map<String, dynamic>> _items = [];
  final _shoppingBox = Hive.box('shopping_box');

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _refreshItems() {
    final data = _shoppingBox.keys.map((key) {
      final item = _shoppingBox.get(key);
      return {
        "key": key,
        "name": item["name"],
        "quantity": item['quantity'],
        "photolink": item['photolink'],
      };
    }).toList();

    setState(() {
      _items = data.reversed.toList();
    });
  }

  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _shoppingBox.add(newItem);
    _refreshItems();
  }

  Future<void> _deleteItemWithAnimation(int itemKey) async {
    await _shoppingBox.delete(itemKey);
    _refreshItems();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('An item has been deleted')),
    );
  }

  void _showForm(BuildContext ctx, int? itemKey) async {
    showModalBottomSheet(
      context: ctx,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
          top: 15,
          left: 15,
          right: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Which test?'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(hintText: 'Number of questions'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _photolinkController,
              decoration: const InputDecoration(hintText: 'Photolink'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                _createItem({
                  "name": _nameController.text,
                  "quantity": _quantityController.text,
                  "photolink": _photolinkController.text,
                });

                _nameController.text = '';
                _quantityController.text = '';
                _photolinkController.text = '';
                Navigator.of(context).pop();
              },
              child: const Text('Create New'),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF7CBCA0),
                onPrimary: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Тесты',
            style: TextStyle(
              fontSize: 23,
              color: Color(0xFF7CBCA0),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: _buildGridView(context),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showForm(context, null),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildGridView(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final currentItem = _items[index];
        return Container(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                color: Colors.white,
                elevation: 2,
                margin: const EdgeInsets.all(1),
                child: Row(
                  children: [
                    SizedBox(
                      height: 180,
                      width: 130,
                      child: Image.network(currentItem['photolink']),
                    ),
                    _textBuildCustom(index, context),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () =>
                          _deleteItemWithAnimation(currentItem['key']),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _textBuildCustom(index, context) {
    final currentItem = _items[index];
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            currentItem['name'],
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Color(0xFF7CBCA0),
            ),
          ),
          Text(
            currentItem['quantity'],
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.instructionPage);
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF7CBCA0),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text('Сдать тест'),
          ),
        ],
      ),
    );
  }
}
