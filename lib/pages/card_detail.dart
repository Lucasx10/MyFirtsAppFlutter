import 'package:flutter/material.dart';
import 'package:myfirstappflutter/model/card_detail.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;
  const CardDetailPage({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
                Row(
                  children: [
                    Image.network(
                      cardDetail.url,
                      height: 100,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: Text(
                    cardDetail.title,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    cardDetail.text,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Ler Mais",
                        style: TextStyle(),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
