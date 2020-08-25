import 'package:flutter/material.dart';
import 'package:feedme/helper/authentication.dart';
import 'package:feedme/pages/InsertQuote.dart';

class AllQuotes extends StatefulWidget {
  _AllQuotesState createState() => _AllQuotesState();
}

class _AllQuotesState extends State<AllQuotes> {
  @override
  Widget build(BuildContext context) {
    double scwidth = MediaQuery.of(context).size.width;
    double scheight = MediaQuery.of(context).size.height;
    return (Scaffold(
      backgroundColor: Color.fromRGBO(30, 73, 117, 80),
      body: Padding(
          padding: EdgeInsets.only(top: scheight * 1 / 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: scwidth * 1 / 8,
                      height: scheight * 1 / 16,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/feed1.png'),
                              fit: BoxFit.fill),
                          shape: BoxShape.circle),
                    ),
                    SizedBox(width: scwidth * 1 / 15),
                    Container(
                        width: scwidth * 1 / 4,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.white70),
                          ),
                          style: TextStyle(color: Colors.white),
                        )),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white70,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: scwidth * 1 / 20),
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          'profile',
                          style: TextStyle(color: Colors.white70),
                        )),
                    SizedBox(width: scwidth * 1 / 17),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Home',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: scheight / 30,
                    left: scheight / 40,
                    right: scheight / 30),
                child: GestureDetector(onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>InsertQuote()));
                },
                  child: Container(
                    width: scwidth,
                    height: scheight / 8,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),child: Center(child: Text('Type a Quote here ... ',style: TextStyle(fontSize:22,color: Colors.grey[500]),),),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Quote("MedoGad", "Love",
                        "Everything will be appreciated : )");
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: scheight * 1 / 30,
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}

class Quote extends StatelessWidget {
  final String username;
  final String title;
  final String quote;
  Quote(this.username, this.title, this.quote);
  @override
  Widget build(BuildContext context) {
    double scwidth = MediaQuery.of(context).size.width;
    double scheight = MediaQuery.of(context).size.height;
    return Container(
      width: scwidth * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border:
              Border.all(color: Color.fromRGBO(251, 212, 237, 1), width: 1)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: scwidth * 0.2, top: 20 ),
            child: Row(
              children: [
                Text(
                  username,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                SizedBox(
                  width: scwidth * 0.15,
                ),
                RaisedButton(
                    onPressed: () {},
                    child: Text('Follow'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                IconButton(icon:Icon(Icons.favorite,color: Colors.red,size:35 ,),)
              ],
            ),
          ),
          Text(
            '____________________________________',
            style: TextStyle(
                color: Color.fromRGBO(251, 212, 237, 1), fontSize: 20),
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          Text(
            quote,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height:scheight/40),
        ],
      ),
    );
  }
}
