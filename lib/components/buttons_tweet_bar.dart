
import 'package:flutter/material.dart';

class ButtonTweetBar extends StatefulWidget {

  const ButtonTweetBar({
    super.key,
  });

  @override
  State<ButtonTweetBar> createState() => _ButtonTweetBarState();
}

class _ButtonTweetBarState extends State<ButtonTweetBar> {
  bool _isLiked = false;
  bool _isRT = false;   // retweet
  void _changeLike(){
    //Je signale à Flutter que _ButtonTweetBarState est dirty et donc que l'on
    //doit redéclencher un build().
    setState(() {
      _isLiked = !_isLiked;
    });
  }
  void _changeRT(){
    //Je signale à Flutter que _ButtonTweetBarState est dirty et donc que l'on
    //doit redéclencher un build().
    setState(() {
      _isRT = !_isRT;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text("Répondre"),
        _isRT ?
        IconButton(icon: const Icon(Icons.repeat, color: Colors.blue,),onPressed: ()=>_changeRT(),)
            :
        IconButton(icon: const Icon(Icons.repeat),onPressed: ()=>_changeRT(),),
        _isLiked ?
        IconButton(icon: const Icon(Icons.favorite, color: Colors.red,),onPressed: ()=>_changeLike(),)
            :
        IconButton(icon: const Icon(Icons.favorite_border),onPressed: ()=>_changeLike(),)
      ],
    );
  }
}
