import 'package:flutter/material.dart';
import 'package:obiad/logic/random_provider.dart';
import 'package:provider/provider.dart';

class AddFood extends StatefulWidget {
  AddFood({Key? key}) : super(key: key);

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.teal[100],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  // itemCount: context.read<RandomProvider>().dania!.length,
                  // itemBuilder: (context, index) {
                  // return
                  children: Provider.of<RandomProvider>(context, listen: true)
                      .dania!
                      .map((e) => Text(e['name']))
                      .toList(),

                  // }
                ),
              ),
            ),
            // Text(Provider.of<RandomProvider>(
            //   context,
            //   listen: true,
            // ).dania!.length.toString()),
            const SizedBox(height: 200.0),
            Container(
              height: 25.0,
              width: 300.0,
              color: Colors.teal[100],
              child: TextFormField(
                controller: controller,
              ),
            ),
            ElevatedButton(
              child: const Text('Dodaj'),
              onPressed: () {
                Map<String, String> newMap = {};
                newMap['name'] = controller.text;
                Provider.of<RandomProvider>(context, listen: false)
                    .dania!
                    .add(newMap);
                print(Provider.of<RandomProvider>(context, listen: false)
                    .dania!
                    .length);
                controller.clear();
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
