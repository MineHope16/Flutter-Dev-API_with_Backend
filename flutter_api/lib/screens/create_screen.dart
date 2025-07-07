import 'package:flutter/material.dart';
import 'package:flutter_api/utils/api/api_endpoints.dart';
import 'package:flutter_api/utils/api/api_manager.dart';
import 'package:flutter_api/utils/widgets/text_field.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    priceController.dispose();
    descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CREATE PRODUCTS")),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
                  onPressed: () {
                    final body = {
                      "pname": nameController.text,
                      "pprice": priceController.text,
                      "pdesc": descController.text,
                    };
                    ApiManager.post(body, ApiEndpoints.addProduct());
                  },
                  child: const Text("Add Product"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
