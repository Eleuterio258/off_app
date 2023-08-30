import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:off_app/cubit/course_bloc/course_state.dart';

 
import '../cubit/course_bloc/course_bloc.dart';
import 'list_service.dart';

class ListCurso extends StatelessWidget {
  const ListCurso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[350],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
                if (state is CourseLoadingState ||
                    state is CourseLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CourseLoadedState) {
                  return Container(
                    color: Colors.grey[350],
                    height: 215,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.course.length,
                      itemBuilder: (BuildContext context, int i) {
                        return InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         CursoPage(curso: state.course[i]),
                            //   ),
                            // );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            margin: const EdgeInsets.only(right: 8),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.memory(
                                  state.course[i].imageUrl[0].path,
                                  height: 215 / 2,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        state.course[i].name,
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
                                        state.course[i].description,
                                        maxLines: 3,
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
                                            "Á partir de  ${state.course[i].price}MT",
                                            style: const TextStyle(
                                              color:Colors.green,
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
                if (state is CourseFailToLoadedState) {
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
