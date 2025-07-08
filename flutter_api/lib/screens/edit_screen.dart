import 'package:flutter/material.dart';
import 'package:flutter_api/model/product_data_model.dart';
import 'package:flutter_api/utils/api/api_endpoints.dart';
import 'package:flutter_api/utils/api/api_manager.dart';
import 'package:flutter_api/utils/widgets/text_field.dart';

class EditScreen extends StatefulWidget {
  final ProductDataModel product;
  const EditScreen({super.key, required this.product});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.product.name;
    priceController.text = widget.product.price;
    descController.text = widget.product.desc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EDIT PRODUCTS')),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextField(
                  controller: nameController,
                  label: "Product Name",
                  hint: "Enter product name",
                  icon: Icons.insert_emoticon,
                ),
                const SizedBox(height: 20),
                buildTextField(
                  controller: priceController,
                  label: "Price",
                  hint: "Enter product price",
                  icon: Icons.currency_rupee,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                buildTextField(
                  controller: descController,
                  label: "Description",
                  hint: "Product Details",
                  icon: Icons.info,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () async {
                    await ApiManager.update(
                      ApiEndpoints.updateProduct(widget.product.id),
                      {
                        "pname": nameController.text,
                        "pprice": priceController.text,
                        "pdesc": descController.text,
                      },
                    );
                  },
                  child: const Text("Update Product"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
