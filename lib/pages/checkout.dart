import 'package:e_commerce/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class checkoutPage extends StatelessWidget {
  const checkoutPage({super.key});

  @override
   Widget build(BuildContext context) {
    final carttt= Provider.of<Cart>(context);
    return Scaffold(
       appBar: AppBar(
         automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,),),
        backgroundColor: Color.fromARGB(255, 76, 141, 95),
        title: Text('Checkout',style: TextStyle(color: Colors.white),),
        actions: [
         Consumer<Cart>(
          builder:((context,cartInstance,child)
          {
            return  Row(
            children: [
              
                   Stack(
                children: [
                  IconButton(onPressed: (){}, icon: Icon( Icons.add_shopping_cart,color: Colors.white,)),
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
       body: Column(
         children: [
           SingleChildScrollView(
             child: SizedBox(
              height: 550,
              child: ListView.builder(
                itemCount:carttt.selectedItems.length ,
                itemBuilder:(BuildContext context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(carttt.selectedItems[index].name),
                      subtitle: Text('${carttt.selectedItems[index].price} - ${carttt.selectedItems[index].location}'),
                      leading:CircleAvatar(
                        backgroundImage: NetworkImage(carttt.selectedItems[index].img),
                      
                      ),
                      trailing: IconButton(
                        onPressed: (){
                         carttt.remove(carttt.selectedItems[index]);
                        },
                        icon: Icon(Icons.remove),),
                    ),
                  );
                }
                ),
              ),
           ),
           ElevatedButton(
            onPressed: (){},
             child: Text('pay \$${carttt.price}',style: TextStyle(color: Colors.white),),
             style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pink),
              padding: MaterialStateProperty.all(EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
             ),
             )
         ],
       ),
        
    );
   }
}