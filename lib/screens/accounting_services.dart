import 'package:citizen_charter/screens/services/accounting_services/acc_serv_1.dart';
import 'package:citizen_charter/screens/(notdone)table.dart';
import 'package:flutter/material.dart';

class AccountingServices extends StatelessWidget {
  const AccountingServices({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Text('Administrative Services', style: TextStyle(fontSize: 25)),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Account1()),
                  ),
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  // height: 150,
                  decoration: BoxDecoration(
                      color: Color(0xffCCD8FE),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      Text('PROCESSING OF CLAIMS\n(MUNICIPAL TRANSACTIONS)',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gilroy'),
                          textAlign: TextAlign.center),
                      Text(
                          "To safeguard the use and disposition of the Municipal Government's assets and to determine its liabilities from claims, pre-audit is undertaken by the Municipal Accountant to determine that all necessary supporting documents of vouchers claims are submitted.",
                          style: TextStyle(
                              // fontSize: 16,
                              ),
                          textAlign: TextAlign.justify)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                // height: 150,
                decoration: BoxDecoration(
                    color: Color(0xffCCD8FE),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Text(
                        'ISSUANCE OF CERTIFICATE OF INCOME \nTAX WITHHELD FROM EMPLOYEES',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gilroy'),
                        textAlign: TextAlign.center),
                    Text(
                        "Government employees' income taxes are withheld pursuant to the National Internal Revenue Code. The Certificate of Compensation Payment/Tax withheld is annually given to show proof that tax due to employees had been paid.",
                        style: TextStyle(
                            // fontSize: 16,
                            ),
                        textAlign: TextAlign.justify)
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                // height: 150,
                decoration: BoxDecoration(
                    color: Color(0xffCCD8FE),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Text('ISSUANCE OF CERTIFICATE OF \nNET TAKE HOME PAY',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gilroy'),
                        textAlign: TextAlign.center),
                    Text(
                        "Employees shall secure from the Municipal Accounting Office the certificate of net take home pay for whatever purpose it may serve them.",
                        style: TextStyle(
                            // fontSize: 16,
                            ),
                        textAlign: TextAlign.justify)
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                // height: 150,
                decoration: BoxDecoration(
                    color: Color(0xffCCD8FE),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Text('PROCESSING OF CLAIMS \n(MUNICIPAL TRANSACTIONS)',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gilroy'),
                        textAlign: TextAlign.center),
                    Text(
                        "All claims shall be approved by the Punong Barangay (PB) and certified as to validity,  propriety and legality of the claim by the Municipal Accountant. In case of claim  chargeable against SK Fund, the SK Chairman shall initial under the name of the PB.  All disbursements shall be covered with duly processed and approved DVs/payrolls.  The BT shall be responsible for paying claims against the Barangay.",
                        style: TextStyle(
                            // fontSize: 16,
                            ),
                        textAlign: TextAlign.justify),
                    // Expanded(child: TableExampleApp())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
