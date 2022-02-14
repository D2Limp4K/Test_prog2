// ignore_for_file: use_key_in_widget_constructors,prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  List<MenuRowData> firstmenuRow = [
    MenuRowData(Icons.bookmark_rounded, 'Избранное', Colors.blue),
    MenuRowData(Icons.call_rounded, 'Недавние звонки', Colors.green),
    MenuRowData(Icons.devices_rounded, 'Устройства', Colors.orange),
    MenuRowData(Icons.folder_rounded, 'Папки с чатами', Colors.lightBlue)
  ];
  List<MenuRowData> secondmenuRow = [
    MenuRowData(Icons.notification_add, 'Уведомления и звуки', Colors.red),
    MenuRowData(Icons.lock_rounded, 'Конфиденциальность', Colors.grey),
    MenuRowData(
        Icons.stacked_bar_chart_rounded, 'Данные и память', Colors.green),
    MenuRowData(Icons.invert_colors_outlined, 'Оформление', Colors.lightBlue),
    MenuRowData(Icons.language_rounded, 'Язык', Colors.purple)
  ];
  UserProfile();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      /*appBar: AppBar(
        title: const Text('Пользователь'),
        centerTitle: true,
        backgroundColor: Colors.white10,
      ),*/
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const _UserInfo(),
              const SizedBox(height: 20),
              _MenuWidget(menuRow: firstmenuRow),
              const SizedBox(height: 20),
              _MenuWidget(menuRow: secondmenuRow),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuRowWidget extends StatelessWidget {
  final MenuRowData data;

  const _MenuRowWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Icon(data.icon, color: Colors.white),
            decoration: BoxDecoration(
                color: data.color, borderRadius: BorderRadius.circular(7)),
          ),
          const SizedBox(width: 10),
          Expanded(
              child:
                  Text(data.text, style: const TextStyle(color: Colors.white))),
          const Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey)
        ],
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const _AvatarWidget(),
          const SizedBox(height: 10),
          const _UserNameWidget(),
          const SizedBox(height: 2),
          const _InfoUserWidget()
        ],
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;
  final MaterialColor color;
  MenuRowData(this.icon, this.text, this.color);
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const _MenuWidget({
    Key? key,
    required this.menuRow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: menuRow.map((data) => _MenuRowWidget(data: data)).toList(),
      ),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const CircleAvatar(
        backgroundImage: NetworkImage(
            'https://sun1-83.userapi.com/impf/XS9fhUylT6Hjs3Eq2V1PMHlT3uQsapGP5s2w4g/5h8E6P7EwFY.jpg?size=1023x1032&quality=96&sign=e4e6851aa82c5932cfd9e3e7fd5cdbb1&type=album'),
        radius: 40,
      ),
    );
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Kirill Dolgushin',
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w300,
        letterSpacing: 1,
      ),
    );
  }
}

class _InfoUserWidget extends StatelessWidget {
  const _InfoUserWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '+7 953 980-98-24 • @kirill_limp',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15,
      ),
    );
  }
}
