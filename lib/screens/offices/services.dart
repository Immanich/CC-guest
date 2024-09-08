import 'package:flutter/material.dart';

// int _maxWidthItem = (MediaQuery.of(context).size.width * 0.8);
double _maxWidthItem = 200;

List<DropdownMenuItem<String>> getServices(String office) {
  switch (office) {
    case 'Accounting':
      return [
        DropdownMenuItem(
          value: 'Accounting 1',
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: _maxWidthItem),
              child: Text(
                '•PROCESSING CLAIMS(MUNICIPAL TRANSACTIONS)',
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ),
        ),
        DropdownMenuItem(
            value: 'Accounting 2',
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: _maxWidthItem),
                child: Text(
                  '•ISSUANCE OF CERTIFICATE OF INCOME TAX WITHHELD FORM EMPLOYEES',
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: 'Accounting 3',
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: _maxWidthItem),
                child: Text(
                  '•ISSUANCE OF CERTIFICATE OF NET TAKE HOME PAY)',
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: 'Accounting 4',
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: _maxWidthItem),
                child: Text(
                  '•PROCESSING OF CLAIMS (MUNICIPAL TRANSACTIONS)',
                  softWrap: true,
                ),
              ),
            )),
      ];
    case "Assessor":
      return [
        DropdownMenuItem(
            value: "Assessor 1",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•ISSUANCE OF CERTIFIED TRUE COPIES OF TAX DECLARATIONS",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Assessor 1",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•REQUEST FOR ISSUANCE OF TAX DECLARATIONS FOR NEW DISCOVERIES OF LAND",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Assessor 1",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•REQUEST FOR ISSUANCE OF TAX DECLARATIONS FOR NEW BUILDING AND MACHINERY",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Assessor 1",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•REQUEST FOR ISSUANCE OF TAX DECLARATIONS FOR TRANSFER OF OWNERSHIP OF UNTITLED PROPERTY",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Assessor 1",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•REQUEST FOR ISSUANCE OF TAX DECLARATIONS FOR TRANSFER OF OWNERSHIP OF TITLED PROPERTY",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Assessor 1",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•REQUEST FOR THE REVISION OF OLD TAX DECLARATION",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Assessor 1",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•REQUEST FOR THE ISSUANCE OF CERTIFICATION OF LANDHOLDING/NO LANDHOLDINGS",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Assessor 1",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•REQUEST FOR THE ISSUANCE OF SKETCH PLAN PER APPROVED CADASTRAL SURVEY OR VICINITY MAP",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Assessor 1",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•REQUEST FOR THE ISSUANCE OF CERTIFICATION OF IMPROVEMENT/NO IMPROVEMENT",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Assessor 1",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•REQUEST FOR CANCELLATION OF TAX DECLARATION BECAUSE IT IS NO LONGER EXISTING AND DUE TO DESTRUCTION",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Assessor 1",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•REQUEST FOR CANCELLATION OF TAX DECLARATION DUE TO COURT DECISION",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Assessor 1",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•REQUEST FOR CANCELLATION OF TAX DECLARATION DUE TO DUPLICATIONS",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Assessor 1",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•REQUEST FOR SUBDIVISION/CONSOLIDATION OF TITLED PROPERTIES",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Assessor 1",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•REQUEST FOR SUBDIVISION/CONSOLIDATION OF UNTITLED PROPERTIES",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Assessor 1",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•REQUEST FOR SUBDIVISION/CONSOLIDATION OF PROPERTY UNDER CARP/OLT/CLOA",
                  softWrap: true,
                ),
              ),
            )),
      ];
    case "Bus. Permits and Licensing":
      return [
        DropdownMenuItem(
          value: "Bus. Permits and Licensing 1",
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: Text(
                "•SECURING MAYOR’S PERMIT TO VARIOUS ACTIVITIES",
                softWrap: true,
              ),
            ),
          ),
        ),
        DropdownMenuItem(
          value: "Bus. Permits and Licensing 2",
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: Text(
                "•SECURING PERMIT ON ALL ADVERTISING/PROMOTIONAL ACTIVITIES",
                softWrap: true,
              ),
            ),
          ),
        ),
        DropdownMenuItem(
          value: "Bus. Permits and Licensing 3",
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: Text(
                "•SECURING / RENEWING MAYOR’S PERMIT / BUSINESS PERMIT",
                softWrap: true,
              ),
            ),
          ),
        ),
        DropdownMenuItem(
          value: "Bus. Permits and Licensing 4",
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: Text(
                "•SECURING / RENEWING MAYOR’S PERMIT FOR TRICYCLES, TRISIKADS, MULTI-CABS , V- HIRE AND BUSES",
                softWrap: true,
              ),
            ),
          ),
        ),
        DropdownMenuItem(
            value: "Bus. Permits and Licensing 5",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•ISSUANCE OF FISHERY PERMIT",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Bus. Permits and Licensing 6",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•RETIRING A BUSINESS OPERATION/ CERTIFICATION OF “NO BUSINESS PERMIT RECORD”",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Bus. Permits and Licensing 7",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•AMENDMENTS IN THE BUSINESS PERMIT",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Bus. Permits and Licensing 8",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•RENEWAL OF CONTRACT OF LEASE",
                  softWrap: true,
                ),
              ),
            )),
        DropdownMenuItem(
            value: "Bus. Permits and Licensing 9",
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 250),
                child: Text(
                  "•SECURING A BURIAL PERMIT",
                  softWrap: true,
                ),
              ),
            )),
      ];
    case "Engineering":
      return [
        DropdownMenuItem(value: "Engineering 1", child: Text("Engineering 1")),
        DropdownMenuItem(value: "Engineering 2", child: Text("Engineering 2")),
      ];
    default:
      return [
        DropdownMenuItem(
          value: 'default',
          child: Text('Select a service'),
        ),
      ];
  }
}
