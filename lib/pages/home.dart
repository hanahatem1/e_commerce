import 'package:e_commerce/items/item.dart';
import 'package:e_commerce/pages/checkout.dart';
import 'package:e_commerce/pages/deatails.dart';
import 'package:e_commerce/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homePage extends StatelessWidget {
   homePage({super.key});

final List<item> itemList= [
  item(name:'product 1',img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTS_pbNeOP3aTGesPKtN4uT2rECLBmjbHdaIauumvhaKtQznT8OXfxNgZhNae8ydPC6yEo&usqp=CAU' , price: 12.99,location: 'flower shop'),
  item(name:'product 2',img:'https://img.freepik.com/premium-photo/diagram-tree-with-words-tree-bottom_889779-662.jpg', price: 14.99),
  item(name:'product 3',img:'https://www.shutterstock.com/image-illustration/tree-retouch-sketchup-graphic-260nw-1980238757.jpg', price: 20.99),
  item(name:'product 4',img:'https://www.shutterstock.com/image-photo/tree-isolated-on-white-background-260nw-2197192443.jpg', price: 10.99),
  item(name:'product 5',img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTS_pbNeOP3aTGesPKtN4uT2rECLBmjbHdaIauumvhaKtQznT8OXfxNgZhNae8ydPC6yEo&usqp=CAU' , price: 12.99),
  item(name:'product 6',img:'https://img.freepik.com/premium-photo/diagram-tree-with-words-tree-bottom_889779-662.jpg', price: 14.99),
  item(name:'product 7',img:'https://www.shutterstock.com/image-illustration/tree-retouch-sketchup-graphic-260nw-1980238757.jpg', price: 20.99),
  item(name:'product 8',img:'https://www.shutterstock.com/image-photo/tree-isolated-on-white-background-260nw-2197192443.jpg', price: 10.99),
  item(name:'product 9',img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTS_pbNeOP3aTGesPKtN4uT2rECLBmjbHdaIauumvhaKtQznT8OXfxNgZhNae8ydPC6yEo&usqp=CAU' , price: 12.99),
  item(name:'product 10',img:'https://img.freepik.com/premium-photo/diagram-tree-with-words-tree-bottom_889779-662.jpg', price: 14.99),
  item(name:'product 11',img:'https://www.shutterstock.com/image-illustration/tree-retouch-sketchup-graphic-260nw-1980238757.jpg', price: 20.99),
  item(name:'product 12',img:'https://www.shutterstock.com/image-photo/tree-isolated-on-white-background-260nw-2197192443.jpg', price: 10.99),  
  item(name:'product 13',img:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTS_pbNeOP3aTGesPKtN4uT2rECLBmjbHdaIauumvhaKtQznT8OXfxNgZhNae8ydPC6yEo&usqp=CAU' , price: 12.99),
  item(name:'product 14',img:'https://img.freepik.com/premium-photo/diagram-tree-with-words-tree-bottom_889779-662.jpg', price: 14.99),
  item(name:'product 15',img:'https://www.shutterstock.com/image-illustration/tree-retouch-sketchup-graphic-260nw-1980238757.jpg', price: 20.99),
  item(name:'product 16',img:'https://www.shutterstock.com/image-photo/tree-isolated-on-white-background-260nw-2197192443.jpg', price: 10.99),  

];
  @override
   Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/images6.png'),
                      fit: BoxFit.cover
                    )
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Avatar.png'),
                  ),
                  accountName:Text('hana'),
                   accountEmail: Text('hanahatem@gmail.com')
                   ),
              
              ListTile(
               title: Text('Home'),
               leading: Icon(Icons.home),
               onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>homePage()));
               },
              ),
               ListTile(
               title: Text('My products'),
               leading: Icon(Icons.add_shopping_cart),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>checkoutPage()));
                },
              ),
               ListTile(
               title: Text('About'),
               leading: Icon(Icons.help_center),
                onTap: (){},
              ),
               ListTile(
               title: Text('Logout'),
               leading: Icon(Icons.exit_to_app),
                onTap: (){},
              ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text('Devloped by maichael 2023',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
            )
          ],
         ),
        ),
       appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 141, 95),
        title: Text('Home',style: TextStyle(color: Colors.white),),
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
       body: Padding(
         padding: const EdgeInsets.only(top: 16),
         child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 33,
            childAspectRatio: 3 / 2,
          ),
          itemCount: itemList.length,
           itemBuilder: (BuildContext context, int index) {
             return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsPage(product: itemList[index],)));
              },
               child: GridTile(
                footer: GridTileBar(
                  trailing: Consumer<Cart>(
                    builder: ((context,carttt , child){
                      return IconButton(
                    onPressed: (){
                      carttt.add(itemList[index]);
                    },
                    icon: Icon( Icons.add, color: Color.fromARGB(225, 62, 94, 70),),
                  );
                    }),
                    ),
                  leading: Text('\$${itemList[index].price}'),
                  title: Text(''),
                ),
                child:Stack(
                  children: [
                    Positioned(
                     top: -2,
                     bottom: -10,
                      right: 0,
                      left: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(55),
                  child: Image.network(itemList[index].img)
                )
                 )
                  ],
                )
               ),
             );
           }
           
           ),
       ),
      ),
    );
   }
}