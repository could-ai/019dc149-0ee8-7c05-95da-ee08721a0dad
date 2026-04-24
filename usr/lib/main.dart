import 'package:flutter/material.dart';

void main() {
  runApp(const AnybisNemesisApp());
}

class AnybisNemesisApp extends StatelessWidget {
  const AnybisNemesisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anybis AL Nemesis',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.redAccent,
          brightness: Brightness.dark,
        ),
        fontFamily: 'Roboto',
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    NemesisTrackerView(),
    LogsView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ANYBIS AL NEMESIS', style: TextStyle(letterSpacing: 2.0, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.radar),
            label: 'Tracker',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt),
            label: 'Logs',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class NemesisTrackerView extends StatelessWidget {
  const NemesisTrackerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            size: 100,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 24),
          Text(
            'SYSTEM SECURE',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4.0,
                ),
          ),
          const SizedBox(height: 16),
          const Text(
            'No immediate threats detected.',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class LogsView extends StatelessWidget {
  const LogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.terminal, color: Colors.greenAccent),
          title: Text('System Event 0x00${index}A'),
          subtitle: Text('Status: Nominal - ${DateTime.now().subtract(Duration(hours: index)).toIso8601String().substring(0, 19)}'),
        );
      },
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          title: const Text('Active Scanning'),
          subtitle: const Text('Continuously monitor for anomalies'),
          value: true,
          onChanged: (bool value) {},
        ),
        SwitchListTile(
          title: const Text('Threat Alerts'),
          subtitle: const Text('Push notifications for critical alerts'),
          value: true,
          onChanged: (bool value) {},
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text('Security Protocols'),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
      ],
    );
  }
}
