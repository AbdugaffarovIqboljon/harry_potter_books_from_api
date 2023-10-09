import 'package:flutter/material.dart';
import 'package:harry_potter_from_api/models/harry_model.dart';
import 'package:harry_potter_from_api/pages/detail_page.dart';
import 'package:lottie/lottie.dart';
import '../services/network_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Book> harryModels = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final data = await Network.methodGet(api: Network.bookApi);
    if (data != null) {
      harryModels = Network.harry(data);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something bad happened')),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Books",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: Lottie.asset("assets/lottie/loading_animation_blue.json"),
            )
          : harryModels.isNotEmpty
              ? GridView.builder(
                  itemCount: harryModels.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                  ),
                  itemBuilder: (context, index) {
                    final harryModel = harryModels[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(books: harryModel),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 3,
                        margin: const EdgeInsets.all(10),
                        color: Colors.brown.withOpacity(0.15),
                        child: GridTile(
                          header: SizedBox(
                            child: Image.network(
                              harryModel.attributes.cover,
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: const SizedBox(),
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    "No data available",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                ),
    );
  }
}
