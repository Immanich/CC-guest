import 'package:flutter/material.dart';

class OfficeDropdown extends StatefulWidget {
  final Function(String) onChanged;

  OfficeDropdown({required this.onChanged});

  @override
  _OfficeDropdownState createState() => _OfficeDropdownState();
}

class _OfficeDropdownState extends State<OfficeDropdown> {
  String selectedOffice = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'WHAT OFFICE?',
          ),
          items: [
            DropdownMenuItem(value: 'Accounting', child: Text('•Accounting')),
            DropdownMenuItem(value: 'Assessor', child: Text('•Assessor')),
            DropdownMenuItem(
                value: 'Bus. Permits and Licensing',
                child: Text('•Bus. Permits and Licensing')),
            DropdownMenuItem(value: 'Engineering', child: Text('•Engineering')),
            DropdownMenuItem(
                value: "Human Resource and Management",
                child: Text("•Human Resource and \nManagement")),
            DropdownMenuItem(
                value: "Mayor's Office", child: Text("•Mayor's Office")),
            DropdownMenuItem(value: 'MDRRMO', child: Text('•MDRRMO')),
            DropdownMenuItem(value: "MENRO", child: Text("•MENRO")),
            DropdownMenuItem(value: 'MESWMO', child: Text('•MESWMO')),
            DropdownMenuItem(value: 'MLGOO', child: Text('•MLGOO')),
            DropdownMenuItem(value: "MPDCO", child: Text("•MPDCO")),
            DropdownMenuItem(value: 'MSWDO', child: Text('•MSWDO')),
            DropdownMenuItem(
                value: 'Municipal Agriculture',
                child: Text('•Municipal Agriculture')),
            DropdownMenuItem(
                value: "Municipal Budget", child: Text("•Municipal Budget")),
            DropdownMenuItem(
                value: 'Municipal Civil Registrar',
                child: Text('•Municipal Civil Registrar')),
            DropdownMenuItem(
                value: 'Municipal Health Office',
                child: Text('•Municipal Health Office')),
            DropdownMenuItem(
                value: "Municipal Treasurer",
                child: Text("•Municipal Treasurer")),
            DropdownMenuItem(
                value: 'Senior Citizen Affairs',
                child: Text('•Senior Citizen Affairs')),
            DropdownMenuItem(
                value: 'Sec. to the SB', child: Text('•Sec. to the SB')),
            DropdownMenuItem(value: "STAC", child: Text("•STAC")),
            DropdownMenuItem(value: 'Toll Roads', child: Text('•Toll Roads')),
            DropdownMenuItem(
                value: 'Tubigon Community Hospital',
                child: Text('•Tubigon Community \nHospital')),
            DropdownMenuItem(value: "Waterworks", child: Text("•Waterworks")),
          ],
          onChanged: (value) {
            if (value != null) {
              widget.onChanged(
                  value); // Call the callback function with the selected office value
            }
          },
        ),
      ],
    );
  }
}
