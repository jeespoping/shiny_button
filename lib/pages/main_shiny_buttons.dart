import 'package:flutter/material.dart';

class MainShinyButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shiny buttons'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ShinyButtons(
              child: Text(
                'Hello World',
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.red,
              onTap: () {
                print('On Tapp');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ShinyButtons(
              child: Text(
                'Hola mundo',
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.green,
              onTap: () {
                print('On Tapp');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ShinyButtons extends StatefulWidget {
  final Widget child;
  final Color color;
  final VoidCallback onTap;

  const ShinyButtons({Key key, this.onTap, this.color, @required this.child})
      : super(key: key);

  @override
  _ShinyButtonsState createState() => _ShinyButtonsState();
}

class _ShinyButtonsState extends State<ShinyButtons>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return InkWell(
            onTap: widget.onTap,
            child: Container(
              child: widget.child,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  widget.color,
                  Colors.white,
                  widget.color,
                ],
                stops: [
                  0.0,
                  _controller.value,
                  1.0,
                ],
              )),
            ),
          );
        });
  }
}
