import 'package:flutter/material.dart';
import 'package:flutter_library/screens/alert/alert_screen.dart';
import 'package:flutter_library/screens/background/background_screen.dart';
import 'package:flutter_library/screens/canvas/canvas_screen.dart';
import 'package:flutter_library/screens/dialog/dialog_screen.dart';
import 'package:flutter_library/screens/drawer/drawer_screen.dart';
import 'package:flutter_library/screens/font/font_screen.dart';
import 'package:flutter_library/screens/form/form_screen.dart';
import 'package:flutter_library/screens/media/media_screen.dart';
import 'package:flutter_library/screens/mvp/mvp_screen.dart';
import 'package:flutter_library/screens/mvp2/mvp2_screen.dart';
import 'package:flutter_library/screens/navigation/navigation_screen.dart';
import 'package:flutter_library/screens/orientation/orientation_screen.dart';
import 'package:flutter_library/screens/scoped_model/scoped_model_screen.dart';
import 'package:flutter_library/screens/scroll/scroll_screen.dart';
import 'package:flutter_library/screens/sheet/sheet_screen.dart';
import 'package:flutter_library/screens/tabs/tabs_screen.dart';
import 'package:flutter_library/screens/toast/toast_screen.dart';
import 'home_item.dart';

class HomeScreen extends StatelessWidget {
  final List<HomeItem> items = [
    HomeItem('Scoped Model', (context) => ScopedModelScreen()),
    HomeItem('Canvas', (context) => CanvasScreen()),
    HomeItem('MVP', (context) => MvpScreen('MVP')),
    HomeItem('MVP2', (context) => Mvp2Screen('MVP2')),
    HomeItem('Dialog', (context) => DialogScreen()),
    HomeItem('Toast', (context) => ToastScreen()),
    HomeItem('Navigation', (context) => NavigationScreen()),
    HomeItem('Drawer', (context) => DrawerScreen()),
    HomeItem('Tabs', (context) => TabsScreen()),
    HomeItem('Alert', (context) => AlertScreen()),
    HomeItem('Sheet', (context) => SheetScreen()),
    HomeItem('Font', (context) => FontScreen()),
    HomeItem('Background', (context) => BackgroundScreen()),
    HomeItem('Scroll', (context) => ScrollScreen()),
    HomeItem('Media', (context) => MediaScreen()),
    HomeItem('Orientation', (context) => OrientationScreen()),
    HomeItem('Form', (context) => FormScreen()),
  ];

  void _onItemSelected(BuildContext context, HomeItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: item.builder),
    );
  }

  Widget _buildHomeItem(BuildContext context, int index) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          items[index].name,
          style: TextStyle(color: Colors.black),
        ),
      ),
      onTap: () => _onItemSelected(context, items[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: _buildHomeItem,
        itemCount: items.length,
      ),
    );
  }
}
