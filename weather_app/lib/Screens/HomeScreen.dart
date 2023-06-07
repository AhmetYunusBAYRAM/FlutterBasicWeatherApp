import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/Objects/ResponseObject.dart';
import 'package:weather_app/Shared/Send.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Send send = Send();
  final List<String> items = [
    "Choose City",
    "Adana",
    "Adıyaman",
    "Afyon",
    "Ağrı",
    "Amasya",
    "Ankara",
    "Antalya",
    "Artvin",
    "Aydın",
    "Balıkesir",
    "Bilecik",
    "Bingöl",
    "Bitlis",
    "Bolu",
    "Burdur",
    "Bursa",
    "Çanakkale",
    "Çankırı",
    "Çorum",
    "Denizli",
    "Diyarbakır",
    "Edirne",
    "Elazığ",
    "Erzincan",
    "Erzurum ",
    "Eskişehir",
    "Gaziantep",
    "Giresun",
    "Gümüşhane",
    "Hakkari",
    "Hatay",
    "Isparta",
    "Mersin",
    "İstanbul",
    "İzmir",
    "Kars",
    "Kastamonu",
    "Kayseri",
    "Kırklareli",
    "Kırşehir",
    "Kocaeli",
    "Konya",
    "Kütahya ",
    "Malatya",
    "Manisa",
    "Kahramanmaraş",
    "Mardin",
    "Muğla",
    "Muş",
    "Nevşehir",
    "Niğde",
    "Ordu",
    "Rize",
    "Sakarya",
    "Samsun",
    "Siirt",
    "Sinop",
    "Sivas",
    "Tekirdağ",
    "Tokat",
    "Trabzon  ",
    "Tunceli",
    "Şanlıurfa",
    "Uşak",
    "Van",
    "Yozgat",
    "Zonguldak",
    "Aksaray",
    "Bayburt ",
    "Karaman",
    "Kırıkkale",
    "Batman",
    "Şırnak",
    "Bartın",
    "Ardahan",
    "Iğdır",
    "Yalova",
    "Karabük ",
    "Kilis",
    "Osmaniye ",
    "Duzce"
  ];
  String? selectedValue = "Choose City";
  bool first = false;
  var responseObject = ResponseObject(
      cityName: "", temperature: "", status: "", icon: "", wind_kph: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarView(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: first == true
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(),
                    Container(
                      height: 40,
                    ),
                    responseObject.icon != ""
                        ? Image.network(responseObject.icon)
                        : Container(),
                    Container(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "City : ",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Container(
                          width: 30,
                        ),
                        ChooseCityView(),
                      ],
                    ),
                    Container(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Container()),
                        Text(
                          "City :",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        Text(
                          responseObject.cityName,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    Container(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Container()),
                        Text(
                          "Temperature :",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        Text(
                          responseObject.temperature,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    Container(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Container()),
                        Text(
                          "Wind Kph :",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        Text(
                          responseObject.wind_kph,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    Container(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Container()),
                        Text(
                          "Weather Status :",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        Text(
                          responseObject.status,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    Container(
                      height: 200,
                    ),
                    Text(
                      "Flutter Basic Weather App",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "2023",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "City : ",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Container(
                          width: 30,
                        ),
                        ChooseCityView(),
                      ],
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
        ),
      ),
    );
  }

  DropdownButtonHideUnderline ChooseCityView() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: [
            Icon(
              Icons.list,
              size: 16,
              color: Colors.yellow,
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                'Select Item',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) async {
          setState(() async {
            if (value != "Choose City") {
              selectedValue = value as String;
              responseObject = await send.weatherSend(selectedValue);
              responseObject.icon =
                  "http://" + responseObject.icon.replaceFirst("//", "");
              first = true;
              setState(() {});
            }
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.white,
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 600,
          width: 200,
          padding: null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          elevation: 8,
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }

  AppBar AppBarView() {
    return AppBar(
      title: const Text("Weather"),
      centerTitle: true,
      backgroundColor: Colors.black,
      elevation: 0,
    );
  }
}
