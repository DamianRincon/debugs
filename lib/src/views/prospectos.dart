import 'package:Debug/src/providers/app.dart';
import 'package:flutter/material.dart';
import 'package:Debug/src/widgets/clip.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:easy_contact_picker/easy_contact_picker.dart';

class ProspectScreen extends StatefulWidget {
  ProspectScreen({Key key}) : super(key: key);

  @override
  _ProspectScreenState createState() => _ProspectScreenState();
}

class _ProspectScreenState extends State<ProspectScreen> with AutomaticKeepAliveClientMixin{
  List<String> items = List<String>();
  TextEditingController controller = new TextEditingController();
  String filter;
  bool c = false;
  List<Contact> _list = new List();
  final EasyContactPicker _contactPicker = new EasyContactPicker();

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  
  @override
  initState() {
    items.add("Juan Hernandes");
    items.add("Mariana Cardenas");
    items.add("Rodolfo Cancino");
    items.add("Hilda Maria Gomez");
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _openAddressBook() async{
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);
    if (permission == PermissionStatus.granted){
      _getContactData();
    }

  }

  _getContactData() async{
    List<Contact> list = await _contactPicker.selectContacts();
    setState(() {
      _list = list;
    });
  }

   Widget _getItemWithIndex(Contact contact){
    return ListTile(
      title: Text(contact.fullName),
      subtitle: Text(contact.phoneNumber),
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Center(child: Text(contact.fullName[0], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Prospectos"),
          actions: [
            IconButton(
              icon: Icon(Icons.contact_phone), 
              onPressed: () async {
               _openAddressBook();
               setState(() {
                 c = true;
               });
              }
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: ()=> Navigator.pushNamed(context, '/new_prospect'),
          label: Text("Nuevo"),
          icon: Icon(Icons.add)
        ),
        body: Stack(
          children: [
            Positioned(
              right: -150,
              child: ClipCustom()
            ),
            Positioned(
              bottom: -250,
              left: -50,
              child: ClipCustom()
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: "Buscar prospectos",
                      filled: true,
                      fillColor: app.theme.backgroundColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 1.5
                        )
                      )
                    ),
                    controller: controller,
                  )
                ),
                Expanded(
                  child: c ? ListView.builder(
        itemBuilder: (context, index){
          return _getItemWithIndex(_list[index]);
        },
        itemCount: _list.length,
      ): ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return filter == null || filter == "" ? 
                      ListTile(
                        leading: CircleAvatar(
                          child: Center(child: Text(items[index][0])),
                        ),
                        title: Text(items[index]),
                      ) : items[index].toLowerCase().contains(filter.toLowerCase()) ? 
                      ListTile(
                        leading: CircleAvatar(
                          child: Center(child: Text(items[index][0])),
                        ),
                        title: Text(items[index]),
                      ) : new Container();
                    },
                  )
                )
              ]
            )
          ]
        )
      )
    );
  }
}