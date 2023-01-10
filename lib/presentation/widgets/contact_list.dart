import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ListContactsWidget extends StatefulWidget {
  final Function onSelect;

  const ListContactsWidget({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<ListContactsWidget> createState() => _ListContactsWidgetState();
}

class _ListContactsWidgetState extends State<ListContactsWidget> {
  List<Contact> contacts = [];
  @override
  void initState() {
    _loadData();

    super.initState();
  }

  _loadData() async {
    if (await Permission.contacts.request().isGranted) {
      contacts = await ContactsService.getContacts();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Select contact',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: contacts.map((contact) => _item(contact)).toList(),
          )
        ],
      ),
    );
  }

  Widget _item(Contact contact) {
    return Column(
      children: [
        ListTile(
          title: Text(
            contact.displayName!,
          ),
          subtitle: Text(contact.displayName!),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {
            widget.onSelect(contact);
            Navigator.pop(context);
          },
        ),
        const Divider()
      ],
    );
  }
}
