import 'package:Debug/src/providers/app.dart';
import 'package:flutter/material.dart';
import 'package:Debug/src/widgets/clip.dart';
import 'package:provider/provider.dart';

class ProspectScreen extends StatefulWidget {
  ProspectScreen({Key key}) : super(key: key);

  @override
  _ProspectScreenState createState() => _ProspectScreenState();
}

class _ProspectScreenState extends State<ProspectScreen> {
  List<String> items = List<String>();
  TextEditingController controller = new TextEditingController();
  String filter;

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

  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Prospectos"),
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
                  child: ListView.builder(
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