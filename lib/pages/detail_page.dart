import 'package:flutter/material.dart';

import '../models/harry_model.dart';

class DetailPage extends StatelessWidget {
  final Book books;

  const DetailPage({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          "Description",
          style: TextStyle(
            color: Colors.purple,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  height: 200,
                  width: MediaQuery.sizeOf(context).width,
                  child: books.attributes.cover.isNotEmpty
                      ? Image.network(
                          books.attributes.cover,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.account_circle,
                          size: 200,
                          color: Colors.black54,
                        ),
                ),
                const SizedBox(height: 15),
                Text(
                  books.attributes.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  softWrap: true,
                ),
                const SizedBox(height: 25),
                Card(
                  shadowColor: Colors.grey,
                  surfaceTintColor: Colors.white,
                  elevation: 10,
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InformationWidget(
                            books: books,
                            secondText: "Author:\n${books.attributes.author}\n",
                          ),
                          InformationWidget(
                            books: books,
                            secondText:
                                "Release Date: \n${books.attributes.releaseData}\n",
                          ),
                          InformationWidget(
                            books: books,
                            secondText:
                                "Summmary: \n${books.attributes.summary}\n",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InformationWidget extends StatelessWidget {
  final String secondText;
  final Book books;

  const InformationWidget({
    super.key,
    required this.books,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      secondText.isNotEmpty ? secondText : "No Information",
      style: TextStyle(
        // fontWeight: FontWeight.bold,
        fontSize: 20,
        color: secondText.isEmpty ? Colors.grey : null,
      ),
      softWrap: true,
    );
  }
}
