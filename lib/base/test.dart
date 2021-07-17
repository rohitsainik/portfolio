import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dynamicList2 extends StatefulWidget {
  @override
  _dynamicList2State createState() => _dynamicList2State();
}

class _dynamicList2State extends State<dynamicList2> {

  List roomAvailable=[];
  List adultList=List();
  List<String> selectedItemValue = List<String>();
  List<dynamic> selectAdults = List<String>();
  var selectedadl;
  List<TextEditingController> priceController = [];

  Map<dynamic,dynamic> hello={
    "room_list":[
      {"roomtype":"bedroom", "room_id":"1",
        "available":[
          {"value":1,"no_room":1},{"value":2,"no_room":2},
          {"value":3,"no_room":3},{"value":4,"no_room":4}
        ]
      },
      {
        "roomtype":"premium delux room","room_id":"2",
        "available":
        [
          {"value":1,"no_room":1},{"value":2,"no_room":2},{"value":3,"no_room":3},{"value":4,"no_room":4},{"value":5,"no_room":5}
        ]
      },
      {
        "roomtype":"myroomType","room_id":"3",
        "available":
        [
          {"value":1,"no_room":1},{"value":2,"no_room":2},
        ]
      }
    ]};
  Map<dynamic,dynamic> hello2={
    "details":{
      "room_id":"1",
      "metadata":{
        "adults":{
          "selected":[
            {"value":1,"adult":1}
          ],
          "adults_list":[
            {"value":1,"adults":1},{"value":2,"adults":2}
            ,{"value":3,"adults":3},{"value":4,"adults":4}
          ]},
        "child":{"child_list":[{"value":0,"child":0},{"value":1,"child":1}
          ,{"value":2,"child":2}]},"extraperson":{"extraperson_list":[
          {"value":0,"extraperson":0},{"value":1,"extraperson":1},{
            "value":2,"extraperson":2},{"value":3,"extraperson":3}
        ]},"meal_plan":{"selected":[{"value":"EP","meal_plan":"EP"}
        ],"meal_plan_list":[{"value":"EP","meal_plan":"EP"}]},
        "price":"2000","tax":"360","total":"2360"}}};

  Widget reservationBox() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount:  hello["room_list"].length,
      itemBuilder: ((context, index) {
        roomAvailable =
        hello["room_list"][index]["available"];
        adultList=hello2["details"]["metadata"]["adults"]["adults_list"];
        selectAdults.add("1");
        priceController.add(new TextEditingController());
        priceController[index].text=hello2["details"]["metadata"]["price"];

        for (int i = 0; i < roomAvailable.length; i++) {
          selectedItemValue.add("1");
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: ListTileTheme(
                  dense: true,
                  child: ExpansionTile(
                    trailing: Icon(Icons.keyboard_arrow_down,
                        color: Color.fromRGBO(255, 109, 112, 1.0)),
                    backgroundColor: Colors.white,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(hello["room_list"][index]["roomtype"],
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(255, 109, 112, 1.0))),
                        Text(
                          hello["room_list"][index]["available"].length.toString(),
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(255, 109, 112, 1.0)),
                        ),
                      ],
                    ),
                    children: <Widget>[
                      Divider(
                        thickness: 1.0,
                        height: 1.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      expansionData2(index , hello["room_list"][index]["roomtype"])
                      /*expansionData()*/
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        );
      }),
    );
  }
  Widget expansionData2(index , String val){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Add Rooms",style: GoogleFonts.montserrat(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(2, 15, 67,1))),
              Container(
                width: 90,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(border: InputBorder.none),
                  value: selectedItemValue[index].toString(),
                  items: roomAvailable.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item['no_room'].toString(),
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.black54),
                      ),
                      value: item['value'].toString(),
                    );
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      selectedItemValue[index]=value;
                      print(selectedItemValue[index].toString());
                    });
                  },
                  hint: Text('Select',style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),),
                ),
              ),
            ],
          ),
        ),
        dynamicBox3(index,val),
      ],);
  }
  Widget dynamicBox3(indexnew,String val){
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: int.parse(selectedItemValue[indexnew]),
          itemBuilder: (context, index)
          {
            index=index+1;
            return  SizedBox(
              /* height: 560,*/
              height: 200,
              width: 450,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Room -$index :',
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(255, 109, 112, 1.0)),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Adults :',
                          style: GoogleFonts.montserrat(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(2, 15, 67, 1)),
                        ),
                        Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 3, bottom: 6),
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                const EdgeInsets.only(bottom: 6.0),
                              ),
                              value: selectAdults[index],
                              items: adultList.map((item) {
                                return DropdownMenuItem(
                                  child: Text(
                                    item['adults'].toString(),
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black54),
                                  ),
                                  value: item['value'].toString(),
                                );
                              }).toList(),
                              onChanged: (value) {
                                selectAdults[indexnew] = value;
                                print('selected data ${selectAdults[indexnew].toString()}');
                              },
                              hint: Text(
                                'Select',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        child: Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0))),
                        color: Colors.green,
                        onPressed: () {

                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView2"),
      ),
      body:SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 8.0, bottom: 28),
                        child: Divider(
                          thickness: 1.0,
                          height: 1.0,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromRGBO(255, 109, 112, 1.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 13.0, vertical: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Room Type',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white)),
                                    Text('Available',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white)),
                                    Text('Details',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                              reservationBox(),


                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),);
  }
}
