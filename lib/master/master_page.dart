import 'package:centralcareweb/master/tabs/employees_tab.dart';
import 'package:centralcareweb/master/tabs/register_tab/register_tab.dart';
import 'package:centralcareweb/master/tabs/settings_tab.dart';
import 'package:flutter/material.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  int _selectedIndex = 0;

  Widget witchPage (int index){
    if(index == 0){
      return RegisterTab();
    }else if(index == 1){
      return const EmployeesTab();
    }else{
      return const SettingsTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.person_add_alt),
                selectedIcon: Icon(Icons.person_add_alt_1),
                label: Text('Cadastrar'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Cadastrados'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_applications_outlined),
                selectedIcon: Icon(Icons.settings_applications),
                label: Text('Configurações'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Center(
              child:
              witchPage (_selectedIndex)
            ),
          )
        ],
      ),
    );
  }
}
