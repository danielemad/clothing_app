import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../wishlist/presentation/cubits/wishlist_cubit.dart';
import '../../domain/entities/product.dart';

class FavButton extends StatefulWidget{
 final Product product;

  const FavButton({
    required this.product,
    super.key
  });

  @override
  State<StatefulWidget> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton>{
  
  bool isToggled = false;

  @override
  void initState(){
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This code will execute after the first frame is drawn
      setState(() {
        isToggled = context.read<WishListCubit>().isInList(widget.product);
      });

      // You can perform actions here that depend on the UI being fully rendered,
      // such as showing a dialog, performing animations, or accessing widget sizes.
    });
    
  }

  @override
  Widget build(BuildContext context){

    
    return IconButton(
      icon: isToggled ? Icon(
          Icons.favorite ,
          color: Colors.red,
        ) : Icon(Icons.favorite_border),
      onPressed: (){
        ScaffoldMessenger.of(context).clearSnackBars();
        if(isToggled){
          BlocProvider.of<WishListCubit>(context).removeFromFav(widget.product);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("your item has been removed from wishlist") ,
                    Spacer(),

                  ],
                ),
              )
            )
          );
        }
        else{
          BlocProvider.of<WishListCubit>(context).addToFav(widget.product);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("your item has been added to wishlist") ,
                    Spacer(),

                  ],
                ),
              )
            )
          );
        }
        
        setState(() {
          isToggled = !isToggled;
        });
       
      },
    );
  }
}