import 'package:example_1/calendar.dart';
import 'package:example_1/event_example.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
//import 'package:table_calendar/table_calendar.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
  //initializeDateFormatting('ko_KR', null).then((_) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade600),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //home: TableCalendarMain(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Widget mid(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(0, 5),
            )
          ]),
      width: double.infinity,
      height: 130,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CilpRRect 를 통해 이미지에 곡선 border 생성
          //이미지
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://cdn2.thecatapi.com/images/6bt.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),

          //이미지와 프로필 정보 사이 간격
          SizedBox(width: 12),

          //프로필 정보
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //학교학년 및 설정아이콘
              Row(
                //학교 및 학년
                children: [
                  Text(
                    '위례 푸른초 3학년',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    //softWrap: false,
                    //overflow: TextOverflow.ellipsis,
                  ),
                  //Spacer(),
                  //설정 아이콘
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 1),

              //이름 레벨
              Row(
                children: [
                  //이름
                  Text(
                    '김시윤',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 4),
                  //레벨
                  Text(
                    'LV1',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1),

              //레벨 이미지
              Text(
                '레벨 이미지',
                style: TextStyle(fontSize: 12, color: Colors.blue),
              ),
              SizedBox(height: 1),

              //용돈 금액
              Text(
                '용돈 24,000원',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget mid2(BuildContext context) {
    return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Expanded(
          flex: 1,
          child: IconButton(
            icon: Column(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                ),
                Text("일정")
              ],
            ),
            onPressed: () {},
          )),
      Expanded(
          flex: 1,
          child: IconButton(
            icon: Column(children: [
              Icon(
                Icons.schedule_outlined,
              ),
              Text("할일")
            ]),
            onPressed: () {},
          )),
      Expanded(
          flex: 1,
          child: IconButton(
            icon: Column(children: [
              Icon(
                Icons.photo_size_select_actual_rounded,
              ),
              Text("작품")
            ]),
            onPressed: () {},
          )),
      Expanded(
          flex: 1,
          child: IconButton(
            icon: Column(children: [
              Icon(
                Icons.payment_outlined,
              ),
              Text("용돈")
            ]),
            onPressed: () {},
          )),
    ]));
  }

  // Widget mid3(BuildContext context){
  //   return
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          '시윤이의 방',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle_outlined, color: Colors.black),
          )
        ],
      ),
      // TRY THIS: Try changing the color here to a specific color (to
      // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
      // change color while the other colors stay the same.
      //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      backgroundColor: Colors.white,
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      //title: Text(widget.title),

      body: Column(children: [
        mid(context),
        SizedBox(height: 10),
        mid2(context),
        //TableCalendarMain(),
        Expanded(child: TableEventsExample()),
      ]),
    ); //
  }
}
