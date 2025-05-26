import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection.dart';

import '../cubits/data_cubit.dart';
import '../cubits/data_state.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DataCubit>()..fetchData(),
      child: Scaffold(

        body: BlocBuilder<DataCubit, DataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return CircularProgressIndicator();
            } else if (state is DataLoaded) {
              return Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 8,mainAxisSpacing: 20),
                    itemCount: state.data.length,
                    itemBuilder: (ctx,i){
                      return Container(


                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff859eb2),width: 1),

                          borderRadius: BorderRadius.circular(16),

                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Color(0xffd4d3cf),

                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(image: NetworkImage(state.data[i].image),fit: BoxFit.fill)

                                  ),

                                ),



                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5,top: 0),
                              child: Row(
                                children: [
                                  Expanded(child: Text(state.data[i].title,overflow: TextOverflow.ellipsis,style:TextStyle(
                                    color: Color(0xff403e74),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold
                                  ),),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5,top: 1),
                              child: Row(
                                children: [
                                  Expanded(child: Text(state.data[i].description,overflow: TextOverflow.ellipsis,style:TextStyle(
                                      color: Color(0xff403e74),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold
                                  ),),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5,top: 1),
                              child: Row(
                                children: [
                                  Expanded(child: Text("EGP ${state.data[i].price}",overflow: TextOverflow.ellipsis,style:TextStyle(
                                      color: Color(0xff403e74),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold
                                  ),),),
                                  Expanded(child: Text(state.data[i].category,overflow: TextOverflow.ellipsis,style:TextStyle(
                                      color: Color(0xff403e74),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold
                                  ),),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5,top: 1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Row(
                                    children: [
                                      Text("Reviews (${state.data[i].rating.rate.toString()})",overflow: TextOverflow.ellipsis,style:TextStyle(
                                          color: Color(0xff403e74),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                      ),),
                                      Icon(Icons.star,color: Colors.yellow,size: 20,),
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(Icons.add,color: Color(0xff004087),),
                                  )
                                ],
                              ),

                            ),

                          ],
                        ),
                      );
                    }),
              );
            } else if (state is DataError) {
              return Text("Error: ${state.message}");
            }
            return Container(); // Default
          },
        )

      ),
    );



  }
}
