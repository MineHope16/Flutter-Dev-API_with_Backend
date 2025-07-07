import 'package:flutter/material.dart';
import 'package:flutter_api/model/product_data_model.dart';
import 'package:flutter_api/utils/api/api_endpoints.dart';
import 'package:flutter_api/utils/api/api_manager.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({super.key});

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PRODUCT DETAILS")),
      body: FutureBuilder(
        future: ApiManager.get(ApiEndpoints.getProduct()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<ProductDataModel>? pdata = snapshot.data;

            return ListView.builder(
              itemCount: pdata!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.storage),
                  title: Text(pdata[index].name),
                  subtitle: Text(pdata[index].desc),
                  trailing: Text("\$${pdata[index].price}"),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
