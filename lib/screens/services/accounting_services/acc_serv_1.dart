import 'package:citizen_charter/screens/(notdone)table.dart';
import 'package:flutter/material.dart';

class Account1 extends StatelessWidget {
  const Account1({super.key});

  @override
  Widget build(BuildContext context) {
    final double _checklistWidth = MediaQuery.of(context).size.width / 2;
    final double _clientWidth = MediaQuery.of(context).size.width / 5;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ACCOUNTING',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xffCCD8FE),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Center(
                child: Text('1. PROCESSING OF CLAIMS\n(MUNICIPAL TRANSACTIONS)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center),
              ),
              SizedBox(height: 5),
              Container(
                child: Text(
                    "To safeguard the use and disposition of the Municipal Government'sassets and to determine its liabilities from claims, pre-audit is undertaken by the Municipal Accountant to determine that all necessary supporting documents of vouchers/ claims are submitted.",
                    textAlign: TextAlign.justify),
              ),
              Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(
                      2), // Adjust column widths for two-column header
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                  5: FlexColumnWidth(1),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          color: Color.fromARGB(255, 158, 180, 255),
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              'Office or Division:',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          // color: Color(0xffCCD8FE),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'ACCOUNTING OFFICE',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          color: Color.fromARGB(255, 158, 180, 255),
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              'Classification:',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              'SIMPLE',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          color: Color.fromARGB(255, 158, 180, 255),
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              'Type of Transaction:',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              'G2G-Government to Government',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          width: _checklistWidth,
                          color: Color.fromARGB(255, 158, 180, 255),
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              'CHECKLIST OF \nREQUIREMENTS',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          color: Color.fromARGB(255, 158, 180, 255),
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              'WHERE TO SECURE',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          width: _checklistWidth,
                          child: Text(
                            '1. Disbursement vouchers, payrolls & supporting documents',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.left,
                            softWrap:
                                true, // This allows text to wrap to the next line
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          width: _checklistWidth,
                          height: 110,
                          child: Center(
                            child: Text(
                              'ACCOUNTING OFFICE',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          width: _checklistWidth,
                          child: Text(
                            '2. Pre-numbered and pre-audited DVs and payrolls',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.left,
                            softWrap:
                                true, // This allows text to wrap to the next line
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          width: _checklistWidth,
                          height: 110,
                          child: Center(
                            child: Text(
                              'ACCOUNTING OFFICE',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          width: _checklistWidth,
                          child: Text(
                            '3. Duly filed up/dated/signed supporting documents',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.left,
                            softWrap:
                                true, // This allows text to wrap to the next line
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          width: _checklistWidth,
                          height: 110,
                          child: Center(
                            child: Text(
                              'ACCOUNTING OFFICE',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          width: _checklistWidth,
                          child: Text(
                            "4. Audited DV's with duly accomplished Obligation Request (OBR) by the MBO",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.left,
                            softWrap:
                                true, // This allows text to wrap to the next line
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          width: _checklistWidth,
                          height: 110,
                          child: Center(
                            child: Text(
                              'ACCOUNTING OFFICE',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          width: _checklistWidth,
                          child: Text(
                            "5. Audited & obligated DVs, payrolls and duly filled up/signed/dated supporting documents",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.left,
                            softWrap:
                                true, // This allows text to wrap to the next line
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          width: _checklistWidth,
                          height: 110,
                          child: Center(
                            child: Text(
                              'ACCOUNTING OFFICE',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FlexColumnWidth(
                        1), // Adjust column widths for two-column header
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                    4: FlexColumnWidth(1),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          child: Container(
                            // width: _clientWidth,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'CLIENTS',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            // width: _clientWidth,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'AGENCY ACTION',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            // width: _clientWidth,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'FEES TO BE PAID',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            // width: _clientWidth,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'PROCESSING TIME',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            // width: _clientWidth,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'PERSON RESPONSIBLE',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Container(
                            // width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "A. Submit the Disbursement Voucher/ Liquidation of Cash Advance Report and the supporting documents for Pre-Audit. Wait while the documents are being evaluated and reviewed.",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.left,
                              softWrap:
                                  true, // This allows text to wrap to the next line
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            // width: _clientWidth,
                            // width: _checklistWidth,
                            //padding: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Evaluates and Reviews submitted documents.',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            // width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              softWrap:
                                  true, // This allows text to wrap to the next line
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            // width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            // width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Container(
                            // width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "1. Records/pre-numbers DVs/payrolls and prepares JEV",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            // width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            // width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              softWrap:
                                  true, // This allows text to wrap to the next line
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            // width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Simple - average of 2 minutes; Complex - Average of 4 minutes',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            // width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Melka Marabiles(for General Fund DVs);Analou Casao ( for Trust Fund & SEF Dvs )',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Container(
                            width: 100,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "2. Pre-audits claim per DVs/payroll and supporting docs",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "None",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              softWrap:
                                  true, // This allows text to wrap to the next line
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Simple - average of 5 minutes; Complex - average of 30 minutes',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Accounting Staff)',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Container(
                            width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "3. Verifies/controls Obligation of Gen. Fund & SEF and Controls/monitors Trust Fund disbursements",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "None",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              softWrap:
                                  true, // This allows text to wrap to the next line
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'General Fund/SEF - average of 2 mins; rust Fund - average of 3 minutes',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Marisol Sibanta(for General Fund DVs); Analou Casao (for Trust Fund & SEF Dvs ))',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Container(
                            width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "4. Final review and signature of the Accountant",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "None",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              softWrap:
                                  true, // This allows text to wrap to the next line
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Simple - average of 2 minutes; Complex -average of 10 minutes',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Municipal Accountant',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Container(
                            width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "B. Submit the Pre-Audited voucher to the Treasurer's Office for signing as to availability of funds and preparation of check.",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "None",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              softWrap:
                                  true, // This allows text to wrap to the next line
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '5 mins',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Maria Lourdes D. Lamanilao (Municipal Treasurer)',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Container(
                            width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "C. Secure the approval and signature of the Municipal Mayor",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "None",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              softWrap:
                                  true, // This allows text to wrap to the next line
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '5 mins',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Engr. William R. Jao (Municipal Mayor)',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Container(
                            width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "D. Return the approved/signed check together with the voucher and supporting documents to the Accounting Office for the Withholding Tax Certificate and Accountant's advice.",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "None",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              softWrap:
                                  true, // This allows text to wrap to the next line
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '5 mins',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Accounting Staff& Hennessy D. Muga (Municipal Accountant)',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Container(
                            width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "E. Sign the voucher, receive the check and accountant's advice.",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "None",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              softWrap:
                                  true, // This allows text to wrap to the next line
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '2 mins',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Treasurer’s Office Staff',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Container(
                            width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'TOTAL',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            padding: const EdgeInsets.all(5.0),
                            // width: _checklistWidth,
                            child: Text(
                              "None",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              softWrap:
                                  true, // This allows text to wrap to the next line
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '64 minutes',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            width: _clientWidth,
                            // width: _checklistWidth,
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
// TableCell(
//   child: Container(
//     padding: EdgeInsets.all(8),
//     child: Text(
//       'FEES TO BE PAID',
//       style: TextStyle(fontWeight: FontWeight.bold),
//       textAlign: TextAlign.center,
//     ),
//   ),
// ),
// TableCell(
//   child: Container(
//     padding: EdgeInsets.all(8),
//     child: Text(
//       'PROCESSING TIME',
//       style: TextStyle(fontWeight: FontWeight.bold),
//       textAlign: TextAlign.center,
//     ),
//   ),
// ),
// TableCell(
//   child: Container(
//     padding: EdgeInsets.all(8),
//     child: Text(
//       'PERSON RESPONSIBLE',
//       style: TextStyle(fontWeight: FontWeight.bold),
//       textAlign: TextAlign.center,
//     ),
//   ),
// ),
