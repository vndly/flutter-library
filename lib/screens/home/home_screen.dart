import 'package:flutter/material.dart';
import 'package:flutter_library/environments.dart';
import 'package:flutter_library/locator.dart';
import 'package:flutter_library/screens/home/home_item.dart';
import 'package:flutter_library/screens/misc/dates/dates_screen.dart';
import 'package:flutter_library/screens/misc/encoding/encoding_screen.dart';
import 'package:flutter_library/screens/misc/enums/enums_screen.dart';
import 'package:flutter_library/screens/misc/event/event_screen.dart';
import 'package:flutter_library/screens/misc/http/http_screen.dart';
import 'package:flutter_library/screens/misc/intents/intents_screen.dart';
import 'package:flutter_library/screens/misc/json/json_screen.dart';
import 'package:flutter_library/screens/misc/lifecycle/lifecycle_screen.dart';
import 'package:flutter_library/screens/misc/localization/localization_screen.dart';
import 'package:flutter_library/screens/misc/media/media_screen.dart';
import 'package:flutter_library/screens/misc/navigation/navigation_screen.dart';
import 'package:flutter_library/screens/misc/orientation/orientation_screen.dart';
import 'package:flutter_library/screens/misc/shared_preferences/shared_preferences_screen.dart';
import 'package:flutter_library/screens/misc/version/version_screen.dart';
import 'package:flutter_library/screens/state/bloc/bloc_screen.dart';
import 'package:flutter_library/screens/state/change_notifier/change_notifier_screen.dart';
import 'package:flutter_library/screens/state/mvp/mvp_screen.dart';
import 'package:flutter_library/screens/state/mvp2/mvp2_screen.dart';
import 'package:flutter_library/screens/state/scoped_model/scoped_model_screen.dart';
import 'package:flutter_library/screens/ui/alert/alert_screen.dart';
import 'package:flutter_library/screens/ui/background/background_screen.dart';
import 'package:flutter_library/screens/ui/bottom_bar/bottom_bar_screen.dart';
import 'package:flutter_library/screens/ui/canvas/canvas_screen.dart';
import 'package:flutter_library/screens/ui/dialog/dialog_screen.dart';
import 'package:flutter_library/screens/ui/drawer/drawer_screen.dart';
import 'package:flutter_library/screens/ui/dropdown/dropdown_screen.dart';
import 'package:flutter_library/screens/ui/font/font_screen.dart';
import 'package:flutter_library/screens/ui/form/form_screen.dart';
import 'package:flutter_library/screens/ui/icon/icon_screen.dart';
import 'package:flutter_library/screens/ui/image/image_screen.dart';
import 'package:flutter_library/screens/ui/lottie/lottie_screen.dart';
import 'package:flutter_library/screens/ui/page_view/page_view_screen.dart';
import 'package:flutter_library/screens/ui/rich_text/rich_text_screen.dart';
import 'package:flutter_library/screens/ui/scroll/scroll_screen.dart';
import 'package:flutter_library/screens/ui/sheet/sheet_screen.dart';
import 'package:flutter_library/screens/ui/snack/snack_screen.dart';
import 'package:flutter_library/screens/ui/tabs/tabs_screen.dart';
import 'package:flutter_library/screens/ui/toast/toast_screen.dart';
import 'package:flutter_library/screens/ui/web/web_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<HomeItem> items = [
    // state
    HomeItem('State'),
    HomeItem('Change Notifier', (context) => ChangeNotifierScreen()),
    HomeItem('Scoped Model', (context) => ScopedModelScreen()),
    HomeItem('Bloc', (context) => BlocScreen()),
    HomeItem('MVP', (context) => const MvpScreen('MVP')),
    HomeItem('MVP2', (context) => const Mvp2Screen('MVP2')),

    // ui
    HomeItem('UI'),
    HomeItem('Dropdown', (context) => DropdownScreen()),
    HomeItem('Lottie', (context) => LottieScreen()),
    HomeItem('Web', (context) => WebScreen()),
    HomeItem('Toast', (context) => ToastScreen()),
    HomeItem('Snack', (context) => SnackScreen()),
    HomeItem('Rich Text', (context) => RichTextScreen()),
    HomeItem('Bottom Bar', (context) => BottomBarScreen()),
    HomeItem('Image', (context) => ImageScreen()),
    HomeItem('Page View', (context) => PageViewScreen()),
    HomeItem('Icon', (context) => IconScreen()),
    HomeItem('Canvas', (context) => CanvasScreen()),
    HomeItem('Dialog', (context) => DialogScreen()),
    HomeItem('Drawer', (context) => DrawerScreen()),
    HomeItem('Tabs', (context) => TabsScreen()),
    HomeItem('Alert', (context) => AlertScreen()),
    HomeItem('Sheet', (context) => SheetScreen()),
    HomeItem('Background', (context) => BackgroundScreen()),
    HomeItem('Form', (context) => FormScreen()),
    HomeItem('Scroll', (context) => ScrollScreen()),
    HomeItem('Font', (context) => FontScreen()),

    // misc
    HomeItem('Misc'),
    HomeItem('Lifecycle', (context) => LifecycleScreen()),
    HomeItem('Version', (context) => VersionScreen()),
    HomeItem('Encoding', (context) => EncodingScreen()),
    HomeItem('Intents', (context) => IntentsScreen()),
    HomeItem('Enums', (context) => EnumsScreen()),
    HomeItem('Json', (context) => JsonScreen()),
    HomeItem('Localization', (context) => LocalizationScreen()),
    HomeItem('Dates', (context) => DatesScreen()),
    HomeItem('Shared Preferences', (context) => SharedPreferencesScreen()),
    HomeItem('HTTP', (context) => HttpScreen()),
    HomeItem('Event', (context) => EventScreen()),
    HomeItem('Media', (context) => MediaScreen()),
    HomeItem('Navigation', (context) => NavigationScreen()),
    HomeItem('Orientation', (context) => OrientationScreen()),
  ];

  void _onItemSelected(BuildContext context, HomeItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: item.builder),
    );
  }

  Widget _buildHomeItem(BuildContext context, int index) {
    final item = items[index];

    if (item.isHeader) {
      return Container(
        color: Colors.grey,
        padding: const EdgeInsets.all(16),
        child: Text(
          item.name,
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      return InkWell(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            item.name,
            style: TextStyle(color: Colors.black),
          ),
        ),
        onTap: () => _onItemSelected(context, item),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final environment = getIt<Environment>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Library : ${environment.name}'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: _buildHomeItem,
        itemCount: items.length,
      ),
    );
  }
}
