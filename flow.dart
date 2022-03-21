import 'package:flutter/material.dart';
import 'flowDelegate.dart';

class FlutterFlow extends StatefulWidget {
  const FlutterFlow({Key? key}) : super(key: key);

  @override
  _FlutterFlowState createState() => _FlutterFlowState();
}

class _FlutterFlowState extends State<FlutterFlow> with SingleTickerProviderStateMixin{
  late AnimationController _myAnimation;
  final List<IconData> _icons = <IconData>[
    Icons.menu,
    Icons.email,
    Icons.settings,
    Icons.notifications,
    Icons.person,
    Icons.wifi,
  ];

  @override
  void initState(){
    super.initState();

    _myAnimation = AnimationController(
      duration: Duration(seconds: 1),
        vsync: this,
    );
  }

  Widget _buildItem(IconData icon){
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: RawMaterialButton(
        fillColor: Colors.cyan,
        shape: CircleBorder(),
        constraints: BoxConstraints.tight(Size.square(50.0),),
        onPressed: () {
          _myAnimation.status == AnimationStatus.completed ? _myAnimation.reverse() : _myAnimation.forward();
        },
        child: Icon(
          icon,
          color: Colors.white,
          size: 30.0,
        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Flutter Flow",
        style: TextStyle(
          fontSize: 22,
        ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.grey,
          ),
          Flow(
            delegate: FlowDemoDelegate(myAnimation: _myAnimation),
            children:
              _icons.map<Widget>((IconData icon) => _buildItem(icon)).toList(),

          ),
        ],
      ),
    );
  }
}
