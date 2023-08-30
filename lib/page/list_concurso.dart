import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/concurso_bloc/concurso_bloc.dart';
import '../cubit/concurso_bloc/concurso_state.dart';

class ListConcurso extends StatelessWidget {
  const ListConcurso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[350],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ConcursoBloc, ConcursoState>(
              builder: (context, state) {
                if (state is ConcursoLoadingState ||
                    state is ConcursoInitialState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ConcursoLoadedState) {
                  return Container(
                    color: Colors.grey[350],
                    height: 215,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.concurso.length,
                      itemBuilder: (BuildContext context, int i) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            margin: const EdgeInsets.only(right: 8),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Container(
                                //   height: 215 / 2,
                                //   decoration: BoxDecoration(
                                //     image: DecorationImage(
                                //       // image: NetworkImage(
                                //       //   state.concurso[i].attachment!,
                                //       // ),
                                //       // fit: BoxFit.cover,
                                //       image: Image.memory(bytes)
                                //     ),
                                //     borderRadius: BorderRadius.circular(4),
                                //   ),
                                // ),
                                Image.memory(
                                  state.concurso[i].attachment!,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        state.concurso[i].name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                            color: Colors.amber,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                      child: Text(
                                        state.concurso[i].description,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          color: Colors.amber,
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
                                            "Á partir de  ${state.concurso[i].price}MT",
                                            style: const TextStyle(
                                              color: Colors.amber,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
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
                if (state is ConcursoFailToLoadedState) {
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
