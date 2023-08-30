import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 import '../cubit/service_bloc/service_bloc.dart';
import '../cubit/service_bloc/service_state.dart';

class ListService extends StatelessWidget {
  const ListService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[350],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ServiceBloc, ServiceState>(
              builder: (context, state) {
                if (state is ServiceLoadingState ||
                    state is ServiceInitialState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ServiceLoadedState) {
                  return Container(
                    color: Colors.grey[350],
                    height: 215,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.service.length,
                      itemBuilder: (BuildContext context, int i) {
                        return InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ServiceDetalhes(
                            //             service: state.service[i])));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            margin: const EdgeInsets.only(right: 8),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.memory(
                                    state.service[i].imageUrl[0].path!,
                                    height: 215 / 2,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover),
                                // Container(
                                //   height: 215 / 2,
                                //   decoration: BoxDecoration(
                                //     image: DecorationImage(
                                //         image: CachedNetworkImageProvider(state
                                //             .service[i].imageUrl![0].path!),
                                //         fit: BoxFit.cover),
                                //     borderRadius: BorderRadius.circular(4),
                                //   ),
                                // ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        state.service[i].name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                            color:Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                      child: Text(
                                        state.service[i].description,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          color:Colors.green,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 0, 8, 0),
                                          child: Text(
                                            "Á partir de  ${state.service[i].price}MT",
                                            style: const TextStyle(
                                              color:Colors.green,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 0, 8, 0),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.visibility,
                                                  size: 14,
                                                  color:Colors.green),
                                              const SizedBox(width: 5),
                                              Text(
                                                state.service[i].nrView.toString(),
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  color:Colors.green,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    if (state.service[i].rates.total == 0) ...[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 16, 0),
                                        child: Row(
                                          children: const [
                                            Icon(Icons.star,
                                                size: 16, color: Colors.white),
                                            Icon(Icons.star,
                                                size: 16, color: Colors.white),
                                            Icon(Icons.star,
                                                size: 16, color: Colors.white),
                                            Icon(Icons.star,
                                                size: 16, color: Colors.white),
                                            Icon(Icons.star,
                                                size: 16, color: Colors.white),
                                          ],
                                        ),
                                      )
                                    ] else if (state.service[i].rates.total<=
                                        20) ...[
                                      Row(
                                        children: const [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(Icons.star,
                                              size: 16, color:Colors.green),
                                          Icon(Icons.star,
                                              size: 16, color: Colors.white),
                                          Icon(Icons.star,
                                              size: 16, color: Colors.white),
                                          Icon(Icons.star,
                                              size: 16, color: Colors.white),
                                          Icon(Icons.star,
                                              size: 16, color: Colors.white),
                                        ],
                                      )
                                    ] else if (state.service[i].rates.total<=
                                        40) ...[
                                      Row(
                                        children: const [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(Icons.star,
                                              size: 16, color:Colors.green),
                                          Icon(Icons.star,
                                              size: 16, color:Colors.green),
                                          Icon(Icons.star,
                                              size: 16, color: Colors.white),
                                          Icon(Icons.star,
                                              size: 16, color: Colors.white),
                                          Icon(Icons.star,
                                              size: 16, color: Colors.white),
                                        ],
                                      )
                                    ] else if (state.service[i].rates.total<=
                                        60) ...[
                                      Row(
                                        children: const [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(Icons.star,
                                              size: 16, color:Colors.green),
                                          Icon(Icons.star,
                                              size: 16, color:Colors.green),
                                          Icon(Icons.star,
                                              size: 16, color:Colors.green),
                                          Icon(Icons.star,
                                              size: 16, color: Colors.white),
                                          Icon(Icons.star,
                                              size: 16, color: Colors.white),
                                        ],
                                      )
                                    ] else if (state.service[i].rates.total<=
                                        80) ...[
                                      Row(
                                        children: const [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(Icons.star,
                                              size: 16, color:Colors.green),
                                          Icon(Icons.star,
                                              size: 16, color:Colors.green),
                                          Icon(Icons.star,
                                              size: 16, color:Colors.green),
                                          Icon(Icons.star,
                                              size: 16, color:Colors.green),
                                          Icon(Icons.star,
                                              size: 16, color: Colors.white),
                                        ],
                                      )
                                    ] else ...[
                                      Row(
                                        children: const [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(Icons.star,
                                              size: 16, color:Colors.green),
                                          Icon(Icons.star,
                                              size: 16, color:Colors.green),
                                          Icon(Icons.star,
                                              size: 16, color:Colors.green),
                                          Icon(Icons.star,
                                              size: 16, color:Colors.green),
                                          Icon(Icons.star,
                                              size: 16, color:Colors.green),
                                        ],
                                      )
                                    ]
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                if (state is ServiceFailToLoadedState) {
                  return Center(child: Text(state.error));
                }
                return const Center(child: Text("Error"));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Asset {
}
