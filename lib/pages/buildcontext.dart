import 'package:flutter/material.dart';


final keys = GlobalKey<_Colored1State>();
class ColoredContainers extends StatelessWidget {
  const ColoredContainers({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: InheritedContainers(

        child:Container(
          padding: EdgeInsets.all(20.0),
          child:  Center(
            child:Column(
              children: [
                Colored1(firstColor: Colors.red,secondColor: Colors.green,child: ButtonChange(),),
                SizedBox(height: 20,),


              ],
            )
          )
        )
      )
    );
  }
}

class InheritedContainers extends InheritedWidget {
  const InheritedContainers({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);


  @override
  bool updateShouldNotify(  InheritedContainers old) {
    return false ;
  }
}

class Colored1 extends StatefulWidget {
  final Widget child;
  final Color firstColor;
  final Color secondColor;
  const Colored1({Key? key, required this.firstColor, required this.child, required this.secondColor}) : super(key: key);

  @override
  State<Colored1> createState() => _Colored1State();
}

class _Colored1State extends State<Colored1> {
  late Color containerColor;
  late Color secContainerColor;

  @override
  void initState() {
    containerColor = widget.firstColor;
    secContainerColor = widget.secondColor;
    super.initState();
  }

  void onChanged(Color firstcolor,Color secondcolor){
    setState(() {
      this.containerColor = firstcolor;
      this.secContainerColor = secondcolor;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            width: 200,
            height: 100,
            color: containerColor,
          ),
          SizedBox(height: 20.0,),
          Container(
            width: 200,
            height: 100,
            color:secContainerColor,
          ),
          SizedBox(height: 20.0,),
          widget.child,
        ],
      )

    );
  }
}


class ButtonChange extends StatelessWidget {
  const ButtonChange({Key? key}) : super(key: key);

  void _onChange(BuildContext context){
    context.findAncestorStateOfType<_Colored1State>()?.onChanged(Colors.purple,Colors.black);
    // context.findRootAncestorStateOfType<_Colored1State>()?.onChanged(Colors.yellow,Colors.pink);

  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      _onChange(context);
    }, child: Text('Change'));
  }
}







