import 'package:einkaufsliste/constants.dart';
import 'package:einkaufsliste/models/item_data.dart';
import 'package:einkaufsliste/screens/add_item_screen.dart';
import 'package:einkaufsliste/widgets/grocery_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  Widget buildBottomSheet(BuildContext context) => Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GroceryListAddItemButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GroceryListLogo(),
                SizedBox(
                  height: 10.0,
                ),
                GroceryListTitle(),
                GroceryListSubtitle(),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TasksList(),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GroceryListAddItemButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kAccentColor,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskScreen(),
          ),
          isScrollControlled: true,
        );
      },
      child: Icon(Icons.add),
    );
  }
}

class GroceryListLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(
        Icons.local_grocery_store,
        size: 30.0,
        color: kAccentColor,
      ),
      radius: 30.0,
    );
  }
}

class GroceryListTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Einkauf',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 50.0,
      ),
    );
  }
}

class GroceryListSubtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Besorge diese ${Provider.of<TaskData>(context).taskCount} Dinge',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    );
  }
}
