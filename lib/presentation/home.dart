import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifetimer/business_login/home_cubit/home_cubit.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                children: [
                  Text(
                    "Life - ${state.life}",
                    style: TextStyle(fontSize: size.width * 0.1),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Text(
                    "${Duration(seconds: state.timer!)}".substring(0, 7),
                    style: TextStyle(fontSize: size.width * 0.1),
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // < start
              IconButton(
                  onPressed: () {
                    homeCubit.startTimer(context);
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    size: size.width * 0.08,
                  )),

              // < stop

              IconButton(
                  onPressed: () {
                    homeCubit.timerStop(context);
                  },
                  icon: Icon(
                    Icons.stop,
                    size: size.width * 0.08,
                  )),

              // < reset

              IconButton(
                  onPressed: () {
                    homeCubit.timerReset(context);
                  },
                  icon: Icon(
                    Icons.restore_outlined,
                    size: size.width * 0.08,
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
