import 'package:example/settings.dart';
import 'package:example/text.dart';
import 'package:flutter/widgets.dart';
import 'package:funk/funk.dart';


class MasterScreen extends StatefulWidget {
  MasterScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  int _selectedIndex = 0;
  bool _approve = false;

  @override
  Widget build(BuildContext context) {
    return Screen(
      navigationBar: NavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          NavigationBarItem(label: 'text'),
          NavigationBarItem(label: 'list'),
          NavigationBarItem(label: 'button'),
          NavigationBarItem(label: 'input'),
          NavigationBarItem(label: 'select'),
          NavigationBarItem(label: 'image'),
          NavigationBarItem(label: 'weather'),
        ],
      ),
      content: Builder(builder: ( context) { 
          if (_selectedIndex == 0)
            return TextSubScreen();
          else if (_selectedIndex == 1)
            return ListView.builder(
              itemBuilder: (context, index) { 
                return ListTile(
                  title: 'Title $index', 
                  subTitle: 'Subtitle $index',
                  onTap: () => Navigator.of(context).pushNamed('/detail')
                );
              },
            );
          else if (_selectedIndex == 2)
            return Content(child: Button(label: 'button', onPressed: () { print('onPressed'); },));
          else if (_selectedIndex == 3)
            return Content(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextInput(label: 'first name',),
                    TextInput(label: 'last name',),
                    TextInput(label: 'address',),
                    TextInput(label: 'postal code',),
                    TextInput(label: 'city',),
                    TextInput(label: 'country',),
                    TextInput(label: 'language',),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8.0, top: 8.0),
                          child: Text('want to receive our newsletter?', style: FunkTheme.of(context).theme.subTitle,)
                        ),                      
                        Select(
                          label: 'yes', 
                          onChanged: (bool value) { 
                            setState(() {
                              _approve = !_approve;
                            });  
                          }, 
                          value: _approve,
                        ),
                        Divider(),
                      ]
                    )
                  ],
                ),
              ),
            );
          else if (_selectedIndex == 4)
            return SettingsSubScreen();
          else if (_selectedIndex == 5)
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ImageContainer(child: Image.network('https://picsum.photos/id/1075/1920/1080')),
                  Row(
                    children: [
                      Expanded(child: ImageContainer(child: Image.network('https://picsum.photos/id/1031/1920/1080'))),
                      Expanded(child: ImageContainer(child: Image.network('https://picsum.photos/id/1068/1920/1080'))),
                    ],
                  ),
                  ImageContainer(child: ImageContainer(child: Image.network('https://picsum.photos/id/1078/1920/1080'))),
                  Row(
                    children: [
                      Expanded(child: ImageContainer(child: Image.network('https://picsum.photos/id/1048/1920/1080'))),
                      Expanded(child: ImageContainer(child: Image.network('https://picsum.photos/id/1058/1920/1080'))),
                    ],
                  ),                  
                ],
              ),
            );
          else if (_selectedIndex == 6)   
            return Content(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('today', style: FunkTheme.of(context).theme.heading5,),
                  Text('sunny', style: FunkTheme.of(context).theme.heading1.copyWith(color: Color(0xFFFF4D03F)),),
                  Text('23 degrees', style: FunkTheme.of(context).theme.heading3,),
                  Container(height: 80,),
                  Text('tomorrow', style: FunkTheme.of(context).theme.heading6,),
                  Text('cloudy', style: FunkTheme.of(context).theme.heading4.copyWith(color: Colors.grey),),
                  Text('18 degrees', style: FunkTheme.of(context).theme.heading5,),
                ],
              )
            );
          else 
            return Content(child: Text('$_selectedIndex'));
        },
      ),
      actionBar: Builder(builder: (context) {
        if (_selectedIndex == 3) {
          return ActionBar(
            actions: [          
              Button(label: 'submit', onPressed: () { })
            ]
          );
        }
        return Container(height: 0);
      },)
    );
  }
}