
import 'package:airbnbistic/utils.dart';
import 'package:flutter/material.dart';

get todayTab => ChipsToday();

class ChipsToday extends StatefulWidget {
  ChipsToday({super.key});

  final List<String> textsOfChips = [
    "Fazendo checkout (1)",
    "Chegando em breve (1)",
    "Programados (1)",
    "Análise pendente (1)",
    "Hóspedes no momento (1)"];

  @override
  State<ChipsToday> createState() => _ChipsTodayState();
}

class _ChipsTodayState extends State<ChipsToday> {

  List<bool> statesOfChips = [true, false, false, false, false];
  
  @override
  Widget build(BuildContext context) => Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          insidePadding(
              Text(
                "É um prazer ter você aqui de novo, Ricardo",
                style: Theme.of(context).textTheme.headlineMedium,),
              bottomPadding: 64
          ),
          insidePadding(
              Text(
                  "Suas reservas",
                  style: Theme.of(context).textTheme.titleLarge)
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 24.0),
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (index) => buildChoice(index)),
            ),
          ),
          insidePadding(
              Container(
                margin: const EdgeInsets.only(bottom: 48.0),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black26,
                      style: BorderStyle.solid,
                      width: 0.5
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 48.0),
                            child: Text(
                              "Checkout amanhã",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Michael",
                                        style: Theme.of(context).textTheme.titleLarge),
                                    Text(
                                        "25 - 26 de jan.",
                                        style: Theme.of(context).textTheme.titleLarge),
                                  ],
                                ),
                              ),
                              const CircleAvatar(
                                backgroundImage: AssetImage("images/download.jpeg"),
                                radius: 24,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black26,
                      height: 1,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: (){},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "Enviar mensagem",
                                    style: Theme.of(context).textTheme.labelLarge),
                              ),
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black26,
                            width: 1,
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: (){},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "Ligar",
                                    style: Theme.of(context).textTheme.labelLarge),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
          ),
          insidePadding(
              Text(
                  "Todas as reservas",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    decoration: TextDecoration.underline,
                  )
              )
          ),
        ],
      )
  );

  Widget buildChoice(int index) => Container(
    margin: const EdgeInsets.only(left: 10),
    child: ActionChip(
      label: Text(
        widget.textsOfChips[index],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          width: statesOfChips[index] ? 2.0 : 0.5,
        ),
      ),
      onPressed: () {
        setState(() {
          statesOfChips[index] = !statesOfChips[index];
        });
      },
    ),
  );
}
