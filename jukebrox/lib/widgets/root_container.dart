import 'package:flutter/material.dart';

class RootContainer extends StatelessWidget {
  final String name;

  RootContainer(this.name);

  Future onClick(context) async {
    //Navigator.push(context, MaterialPageRoute(builder: (context) => XXXXX()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[50],
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            constraints: BoxConstraints.expand(
              height: Theme.of(context).textTheme.headline5.fontSize * 1.1 + 50.0,
            ),
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                Image(
                  image: AssetImage('assets/images/google_drive_icon.png'),
                  width: 40,
                ),
                Text(this.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.black)),
              ],
            ),
          ),
          onTap: () {
            onClick(context);
          },
        ),
      ),
    );
  }
}
