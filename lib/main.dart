import 'package:airbnbistic/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        chipTheme: ChipThemeData(
          disabledColor: Colors.white,
          selectedColor: Colors.white,
          secondarySelectedColor: Colors.black,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(
              width: 0.5,
            ),
          ),
        ),
        textTheme: TextTheme(
          headlineMedium: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.black),
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.white,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  final List<String> textsOfChips = [
    "Fazendo checkout (1)",
    "Chegando em breve (1)",
    "Programados (1)",
    "Análise pendente (1)",
    "Hóspedes no momento (1)"
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  List<bool> statesOfChips = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_outlined))
          ],
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(
                Icons.today,
              ),
              label: 'Hoje',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: 'Calendário',
            ),
            NavigationDestination(
              icon: Icon(Icons.home_work_outlined),
              label: 'Anúncios',
            ),
            NavigationDestination(
              icon: Icon(Icons.messenger_outline),
              label: 'Mensagens',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
          ],
        ),
        body: [
          todayTab,
          calendarTab,
          advertisingTab,
          messagesTab,
          menuTab,
        ][currentPageIndex]);
  }

  get todayTab => Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          insidePadding(
              Text(
                "É um prazer ter você aqui de novo, Ricardo",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              bottomPadding: 64),
          insidePadding(Text("Suas reservas",
              style: Theme.of(context).textTheme.titleLarge)),
          Container(
            margin: const EdgeInsets.only(bottom: 24.0),
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (index) => buildChoice(index)),
            ),
          ),
          insidePadding(Container(
            margin: const EdgeInsets.only(bottom: 48.0),
            width: double.maxFinite,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 48.0),
                        child: Text("Checkout amanhã"),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Michael"),
                                Text("25 - 26 de jan."),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage("images/download.jpeg"),
                            radius: 24,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Enviar mensagem"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Ligar"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
          insidePadding(Text("Todas as reservas",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    decoration: TextDecoration.underline,
                  ))),
        ],
      ));

  get calendarTab => const Center(child: Text("Calendário"));
  get advertisingTab => const Center(child: Text("Anúncio"));
  get messagesTab => const Center(child: Text("Mensagens"));
  get menuTab => const Center(child: Text("Menu"));

  Widget buildChoice(int index) => Container(
        margin: const EdgeInsets.only(left: 10),
        child: ActionChip(
          label: Text(
            widget.textsOfChips[index],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
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
