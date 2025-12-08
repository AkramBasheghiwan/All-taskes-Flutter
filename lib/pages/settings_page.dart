import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          title: const Text('الوضع الليلي'),
          secondary: const Icon(Icons.dark_mode),
          value: false,
          onChanged: (bool value) {},
        ),
        SwitchListTile(
          title: const Text('الاشعارات'),
          secondary: const Icon(Icons.notifications),
          value: true,
          onChanged: (bool value) {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('اللغة'),
          subtitle: const Text('العربية'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.lock),
          title: const Text('الخصوصية والأمان'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text('المساعدة والدعم'),
          onTap: () {},
        ),
      ],
    );
  }
}
