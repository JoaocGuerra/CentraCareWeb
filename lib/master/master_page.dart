import 'package:centralcareweb/master/tabs/employess_tab/edit_employees/edit_employees.dart';
import 'package:centralcareweb/master/tabs/employess_tab/employees_tab.dart';
import 'package:centralcareweb/master/tabs/register_tab/register_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../store/auth/auth_store.dart';
import '../store/show_pages/show_store.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  final AuthStore authStore =  GetIt.I<AuthStore>();
  final ShowStore showStore =  GetIt.I<ShowStore>();
  int _selectedIndex = 0;

  Widget witchPage (int index){
    if(index == 0){
      return RegisterTab();
    }else if(index == 1){
      return Observer(builder: (_){
        return showStore.showInEmployeesRegister == 1 ? EmployeesTab() :
               showStore.showInEmployeesRegister == 2 ? EditEmployees() : Center();
      });
    }else{
      authStore.userSignOut();
      return const CircularProgressIndicator();
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
              // NavigationRailDestination(
              //   icon: Icon(Icons.settings_applications_outlined),
              //   selectedIcon: Icon(Icons.settings_applications),
              //   label: Text('Configurações'),
              // ),
              NavigationRailDestination(
                icon: Icon(Icons.exit_to_app_outlined,color: Colors.red,),
                selectedIcon: Icon(Icons.exit_to_app,color: Colors.red),
                label: Text('Sair'),
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
