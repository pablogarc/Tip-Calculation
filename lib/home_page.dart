import 'package:flutter/material.dart';
import 'package:tip_time/providers/tip_time_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                controller: context.watch<TipTimeProvider>().constController,
                decoration: InputDecoration(
                  labelText: 'Cost of service',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              children: context
                  .read<TipTimeProvider>()
                  .radioGroupValues
                  .entries
                  .map(
                    (e) => ListTile(
                      leading: Radio(
                        value: e.key,
                        groupValue:
                            context.watch<TipTimeProvider>().getSelectedRadio,
                        onChanged: (newVal) {
                          // TODO: cambiar estado de los radios
                          context
                              .read<TipTimeProvider>()
                              .setSelectedRadio(newVal);
                        },
                      ),
                      title: Text("${e.value}"),
                    ),
                  )
                  .toList(),
            ),
          ),
          SwitchListTile(
            secondary: Icon(Icons.credit_card),
            title: Text("Round up tip"),
            value: context.watch<TipTimeProvider>().isSelected,
            onChanged: (newVal) {
              context.read<TipTimeProvider>().setIsSelected(newVal);
            },
          ),
          MaterialButton(
            color: Colors.green,
            child: Text("CALCULATE"),
            onPressed: () {
              context.read<TipTimeProvider>().tipCalculation(int.parse(
                  context.read<TipTimeProvider>().constController.text));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                  "Tip amount: \$${context.read<TipTimeProvider>().getAmount}"),
            ],
          ),
        ],
      ),
    );
  }
}
