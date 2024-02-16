import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:system_design_app/feature/home/home_router.gr.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  List<String> stationList = [
    '岩手県立大学',
    '岩手県立大学入口',
    '野沢',
    '滝沢駅前',
    '滝沢東小学校前',
    '巣子駅入口',
    '第三富士見団地口',
    '岩手牧場前',
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final departureController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  //const Icon(Icons.search),
                  const Padding(padding: EdgeInsets.only(right: 8)),
                  Expanded(
                    child: TextField(
                      controller: departureController,
                      decoration: const InputDecoration.collapsed(
                        hintText: '出発地',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Row(
                children: <Widget>[
                  //const Icon(Icons.search),
                  Padding(padding: EdgeInsets.only(right: 8)),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: '到着地',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text('履歴',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            Expanded(
              child: ListView.builder(
                itemCount: stationList.length - 1, // 最後の要素はペアがないため除外
                itemBuilder: (context, index) {
                  return ListTile(
                    title:
                        Text('${stationList[index]}～${stationList[index + 1]}'),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(const DetailRoute());
                },
                child: const Text('Go to Detail Screen'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _messageItem(String title) {
    return Container(
      decoration: new BoxDecoration(
          border: new Border(
              bottom: const BorderSide(width: 1.0, color: Colors.grey))),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 18.0),
        ),
      ),
    );
  }
}
