import 'package:Debug/src/providers/app.dart';
import 'package:easy_contact_picker/easy_contact_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:Debug/src/widgets/clip.dart';
import '../../src/widgets/custom_field.dart';

class NuevoProstecto extends StatefulWidget {
  NuevoProstecto({Key key}) : super(key: key);

  @override
  _NuevoProstectoState createState() => _NuevoProstectoState();
}

class _NuevoProstectoState extends State<NuevoProstecto> with AutomaticKeepAliveClientMixin{
  String _type = "Referido";
  List<Contact> _list = new List();
  final EasyContactPicker _contactPicker = new EasyContactPicker();

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
          title: Text("Nuevo Prospecto"),
          actions: [
            IconButton(
              icon: Icon(Icons.save), 
              onPressed: (){}
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
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
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Tipo", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      DropdownButtonFormField(
                        items: ["Referido","Mercado Natural","Centro de Influencia"].map((String category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Row(
                              children: <Widget>[
                                Text(category)
                              ]
                            )
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _type = newValue;
                          });
                          if (_type=="Mercado Natural") {
                            _openAddressBook();
                          }
                        },
                        value: _type,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          filled: true,
                          fillColor: app.theme.scaffoldBackgroundColor,
                        )
                      ),
                    ],
                  )
                ),
                Expanded(
                  child: _type == "Mercado Natural" ? ListView.builder(
                    itemBuilder: (context, index){
                      return _getItemWithIndex(_list[index]);
                    },
                    itemCount: _list.length,
                  ) : SingleChildScrollView(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomField(
                          dense: true,
                          filled: true,
                          label: "Nombre",
                          borderRadius: 5,
                          fillColor: app.theme.scaffoldBackgroundColor,
                          actionNode: TextInputAction.next,
                        ),
                        SizedBox(height: 10),
                        CustomField(
                          dense: true,
                          filled: true,
                          label: "Fecha de nacimiento",
                          borderRadius: 5,
                          fillColor: app.theme.scaffoldBackgroundColor,
                          actionNode: TextInputAction.next,
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        
                        Text("Ocupación", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        DropdownButtonFormField(
                          items: ["Empleado"].map((String category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Row(
                                children: <Widget>[
                                  Text(category)
                                ]
                              )
                            );
                          }).toList(),
                          onChanged: (newValue) {},
                          value: "Empleado",
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)
                            ),
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            filled: true,
                            fillColor: app.theme.scaffoldBackgroundColor
                          )
                        ),
                        SizedBox(height: 20),
                        Text("Preparación Académica", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        DropdownButtonFormField(
                          items: ["Primaria","Secundaria","Preparatoria","Universidad"].map((String category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Row(
                                children: <Widget>[
                                  Text(category)
                                ]
                              )
                            );
                          }).toList(),
                          onChanged: (newValue) {},
                          value: "Primaria",
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)
                            ),
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            filled: true,
                            fillColor: app.theme.scaffoldBackgroundColor,
                          )
                        ),
                        SizedBox(height: 30),
                        CustomField(
                          dense: true,
                          filled: true,
                          label: "Telefono",
                          borderRadius: 5,
                          fillColor: app.theme.scaffoldBackgroundColor,
                          actionNode: TextInputAction.next,
                        ),
                        SizedBox(height: 10),
                        CustomField(
                          dense: true,
                          filled: true,
                          label: "Correo",
                          borderRadius: 5,
                          fillColor: app.theme.scaffoldBackgroundColor,
                          actionNode: TextInputAction.next,
                        ),
                        SizedBox(height: 10),
                        CustomField(
                          dense: true,
                          filled: true,
                          label: "¿Quien refiere?",
                          borderRadius: 5,
                          fillColor: app.theme.scaffoldBackgroundColor,
                          actionNode: TextInputAction.next,
                        ),
                        Text("Rango salarial", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        DropdownButtonFormField(
                          items: ["Menos de 3000","Mas de 3000 menos de 7000","Mas de 7000 menos de 10000"].map((String category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Row(
                                children: <Widget>[
                                  Text(category)
                                ]
                              )
                            );
                          }).toList(),
                          onChanged: (newValue) {},
                          value: "Menos de 3000",
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)
                            ),
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            filled: true,
                            fillColor: app.theme.scaffoldBackgroundColor,
                          )
                        ),
                        SizedBox(height: 20),
                        Text("Estado Civil", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        DropdownButtonFormField(
                          items: ["Soltero","Casado","Divorciado","Diudo"].map((String category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Row(
                                children: <Widget>[
                                  Text(category)
                                ]
                              )
                            );
                          }).toList(),
                          onChanged: (newValue) {},
                          value: "Soltero",
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)
                            ),
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            filled: true,
                            fillColor: app.theme.scaffoldBackgroundColor,
                          )
                        ),
                        SizedBox(height: 20),
                        Text("Dependientes", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 22),
                              width: 100,
                              child: DropdownButtonFormField(
                                items: ["Hijo","Esposa"].map((String category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Row(
                                      children: <Widget>[
                                        Text(category)
                                      ]
                                    )
                                  );
                                }).toList(),
                                onChanged: (newValue) {},
                                value: "Hijo",
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(10, 13, 10, 13),
                                  filled: true,
                                  fillColor: app.theme.scaffoldBackgroundColor,
                                )
                              ),
                            ),
                            //SizedBox(width: 15),
                            Container(
                              width: 100,
                              child: CustomField(
                                dense: true,
                                filled: true,
                                label: "Edad",
                                borderRadius: 5,
                                fillColor: app.theme.scaffoldBackgroundColor,
                                actionNode: TextInputAction.next,
                              ),
                            ),
                            //SizedBox(width: 15),
                            InkWell(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.only(bottom: 22),
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.blue,
                                ),
                                child: Center(child: Text("AGREGAR", style: TextStyle(color: Colors.white))),
                              ),
                            )
                          ]
                        )
                      ]
                    )
                  )
                )
              ]
            )
            
            /*SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tipo", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  DropdownButtonFormField(
                    items: ["Referido","Mercado Natural","Centro de Influencia"].map((String category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Row(
                          children: <Widget>[
                            Text(category)
                          ]
                        )
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _type = newValue;
                      });
                      print(_type);
                    },
                    value: _type,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      filled: true,
                      fillColor: app.theme.scaffoldBackgroundColor,
                    )
                  ),
                  SizedBox(height: 30),

                  _type == "Mercado Natural" ? Expanded(
                    child: ListView.builder(
                    itemBuilder: (context, index){
                      return _getItemWithIndex(_list[index]);
                    },
                    itemCount: _list.length,
                  )) : 
                  Column(
                    children: <Widget>[
                      CustomField(
                        dense: true,
                        filled: true,
                        label: "Nombre",
                        borderRadius: 5,
                        fillColor: app.theme.scaffoldBackgroundColor,
                        actionNode: TextInputAction.next,
                      ),
                      SizedBox(height: 10),
                      CustomField(
                        dense: true,
                        filled: true,
                        label: "Fecha de nacimiento",
                        borderRadius: 5,
                        fillColor: app.theme.scaffoldBackgroundColor,
                        actionNode: TextInputAction.next,
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      
                      Text("Ocupación", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      DropdownButtonFormField(
                        items: ["Empleado"].map((String category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Row(
                              children: <Widget>[
                                Text(category)
                              ]
                            )
                          );
                        }).toList(),
                        onChanged: (newValue) {},
                        value: "Empleado",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          filled: true,
                          fillColor: app.theme.scaffoldBackgroundColor
                        )
                      ),
                      SizedBox(height: 20),
                      Text("Preparación Académica", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      DropdownButtonFormField(
                        items: ["Primaria","Secundaria","Preparatoria","Universidad"].map((String category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Row(
                              children: <Widget>[
                                Text(category)
                              ]
                            )
                          );
                        }).toList(),
                        onChanged: (newValue) {},
                        value: "Primaria",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          filled: true,
                          fillColor: app.theme.scaffoldBackgroundColor,
                        )
                      ),
                      SizedBox(height: 30),
                      CustomField(
                        dense: true,
                        filled: true,
                        label: "Telefono",
                        borderRadius: 5,
                        fillColor: app.theme.scaffoldBackgroundColor,
                        actionNode: TextInputAction.next,
                      ),
                      SizedBox(height: 10),
                      CustomField(
                        dense: true,
                        filled: true,
                        label: "Correo",
                        borderRadius: 5,
                        fillColor: app.theme.scaffoldBackgroundColor,
                        actionNode: TextInputAction.next,
                      ),
                      SizedBox(height: 10),
                      CustomField(
                        dense: true,
                        filled: true,
                        label: "¿Quien refiere?",
                        borderRadius: 5,
                        fillColor: app.theme.scaffoldBackgroundColor,
                        actionNode: TextInputAction.next,
                      ),
                      Text("Rango salarial", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      DropdownButtonFormField(
                        items: ["Menos de 3000","Mas de 3000 menos de 7000","Mas de 7000 menos de 10000"].map((String category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Row(
                              children: <Widget>[
                                Text(category)
                              ]
                            )
                          );
                        }).toList(),
                        onChanged: (newValue) {},
                        value: "Menos de 3000",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          filled: true,
                          fillColor: app.theme.scaffoldBackgroundColor,
                        )
                      ),
                      SizedBox(height: 20),
                      Text("Estado Civil", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      DropdownButtonFormField(
                        items: ["Soltero","Casado","Divorciado","Diudo"].map((String category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Row(
                              children: <Widget>[
                                Text(category)
                              ]
                            )
                          );
                        }).toList(),
                        onChanged: (newValue) {},
                        value: "Soltero",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          filled: true,
                          fillColor: app.theme.scaffoldBackgroundColor,
                        )
                      ),
                      SizedBox(height: 20),
                      Text("Dependientes", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 22),
                            width: 100,
                            child: DropdownButtonFormField(
                              items: ["Hijo","Esposa"].map((String category) {
                                return DropdownMenuItem(
                                  value: category,
                                  child: Row(
                                    children: <Widget>[
                                      Text(category)
                                    ]
                                  )
                                );
                              }).toList(),
                              onChanged: (newValue) {},
                              value: "Hijo",
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10, 13, 10, 13),
                                filled: true,
                                fillColor: app.theme.scaffoldBackgroundColor,
                              )
                            ),
                          ),
                          //SizedBox(width: 15),
                          Container(
                            width: 100,
                            child: CustomField(
                              dense: true,
                              filled: true,
                              label: "Edad",
                              borderRadius: 5,
                              fillColor: app.theme.scaffoldBackgroundColor,
                              actionNode: TextInputAction.next,
                            ),
                          ),
                          //SizedBox(width: 15),
                          InkWell(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.only(bottom: 22),
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue,
                              ),
                              child: Center(child: Text("AGREGAR", style: TextStyle(color: Colors.white))),
                            ),
                          )
                        ]
                      )
                    ]
                  )
                ]
              )
            )*/
          ]
        )
      )
    );
  }
   @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}