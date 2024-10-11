import 'package:e_commerce/items/item.dart';
import 'package:e_commerce/pages/checkout.dart';
import 'package:e_commerce/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
   DetailsPage({super.key,required this.product});

   item product;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
bool isShowmore=true;

  @override
   Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,),),
        backgroundColor: Color.fromARGB(255, 76, 141, 95),
        title: Text('details',style: TextStyle(color: Colors.white),),
        actions: [
         Consumer<Cart>(
          builder:((context,cartInstance,child)
          {
            return  Row(
            children: [
              
                   Stack(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>checkoutPage()));
                    },
                     icon: Icon( Icons.add_shopping_cart,color: Colors.white,)),
                  Container(
                    child: Text('${cartInstance.selectedItems.length}',style: TextStyle(fontSize: 12),),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(211, 164, 255, 193),
                      shape: BoxShape.circle
                    ),
                    ),
                ]
                ),
               
               Padding(
                 padding: const EdgeInsets.only(right: 11),
                 child: Text('\$${cartInstance.price}',style: TextStyle(fontSize: 18,color: Colors.white),),
               ),
            ],
          );
          }
          )
          )
        ],
       ),
    body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.product.img),
            const SizedBox(height: 10,),
            Text('\$${widget.product.price}'),
            const SizedBox(height: 10),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  child: Text('New'),
                 decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 129,129),
                  borderRadius: BorderRadius.circular(4)
                 ),
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    Icon(Icons.star,size: 22,color: Color.fromARGB(255, 255, 191, 0),),
                    Icon(Icons.star,size: 22,color: Color.fromARGB(255, 255, 191, 0),),
                    Icon(Icons.star,size: 22,color: Color.fromARGB(255, 255, 191, 0),),
                    Icon(Icons.star,size: 22,color: Color.fromARGB(255, 255, 191, 0),),
                    Icon(Icons.star,size: 22,color: Color.fromARGB(255, 255, 191, 0),),
                  ],
                ),
                 const SizedBox(width:90,),
                Row(
                  children: [
                    Icon(Icons.edit_location,color: Color.fromARGB(168, 3, 65, 27),),
                    Text(widget.product.location,style: TextStyle(fontSize: 16),)
                  ],
                )
              ],
            ),
            const SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Details : ',style: TextStyle(fontSize: 20),),
              ],
            ),
            const SizedBox(height: 10,),
            Text('A flower, also known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). Flowers consist of a combination of vegetative organs – sepals that enclose and protect the developing flower. These petals attract pollinators, and reproductive organs that produce gametophytes, which in flowering plants produce gametes. The male gametophytes, which produce sperm, are enclosed within pollen grains produced in the anthers. The female gametophytes are contained within the ovules produced in the ovary. When pollen from the anther of a flower is deposited on the stigma, this is called pollination. Some flowers may self-pollinate, producing seed using pollen from a different flower of the same plant, but others have mechanisms to prevent self-pollination and rely on cross-pollination, when pollen is transferred from the anther of one flower to the stigma of another flower on a different individual of the same species. Self-pollination happens in flowers where the stamen and carpel mature at the same time, and are positioned so that the pollen can land on the flower\'s stigma. This pollination does not require an investment from the plant to provide nectar and pollen as food for pollinators.[3] Some flowers produce diaspores without fertilization (parthenocarpy). After fertilization, the ovary of the flower develops into fruit containing seeds.' 
            ,style: TextStyle(fontSize: 17),
             maxLines: isShowmore ? 3 : null,
             overflow: TextOverflow.fade,
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: (){
                setState(() {
                  isShowmore= !isShowmore;
                });
              },
               child: Text(
                isShowmore? 'Show more' : 'Show less' ,
                style: TextStyle(color: Colors.blue,fontSize: 18),))
          ],
        ),
      ),
    ),
    
    );
   }
}