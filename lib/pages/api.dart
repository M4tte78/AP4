import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiPage extends StatefulWidget {
  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  Future<List<dynamic>>? futureData;

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      return jsonDecode(response.body)['results'];
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Page'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              setState(() {
                futureData = fetchData();
              });
            },
            child: Text('Fetch Data from API'),
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: futureData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Name',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Email',
                          ),
                        ),
                      ],
                      rows: snapshot.data.map<DataRow>((item) {
                        return DataRow(
                          cells: <DataCell>[
                            DataCell(Text('${item['name']['first']} ${item['name']['last']}')),
                            DataCell(Text(item['email'])),
                          ],
                        );
                      }).toList(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show an empty container.
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}