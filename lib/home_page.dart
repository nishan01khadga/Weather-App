import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather_bloc/weather_bloc.dart';
import 'package:weather_app/weather_bloc/weather_event.dart';
import 'package:weather_app/weather_bloc/weather_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = WeatherBloc();
    final weatherController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Weather App"),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        bloc: weatherBloc,
        builder: (context, state) {
          return Column(
            children: [
              TextFormField(
                controller: weatherController,
                decoration: const InputDecoration(
                    contentPadding:EdgeInsets.only(left: 10,right: 5),
                    hintText: 'Enter  city location'),
              ),
              ElevatedButton(
                onPressed: () {
                  weatherBloc.add(FetchWeatherEvent(weatherController.text.trim()));
                },
                child: Text("Fetch data"),
              ),
              if (state is WeatherLoadingState)
                CircularProgressIndicator()
              else if (state is WeatherLoadedState)
                Text(state.weatherData.current!.tempC.toString())
              else if (state is WeatherLoadingFailureState)
                  Text(state.error)
                else
                  SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}





// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app/weather_bloc/weather_bloc.dart';
// import 'package:weather_app/weather_bloc/weather_event.dart';
// import 'package:weather_app/weather_bloc/weather_state.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final weatherBloc = WeatherBloc();
//     final weatherController = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text("Weather App"),
//       ),
//       body: BlocBuilder<WeatherBloc,WeatherState>(
//         bloc: weatherBloc,
//         builder: (context,state){
//           return Column(
//             children: [
//              TextFormField(
//                controller: weatherController,
//                decoration: InputDecoration(hintText: 'Enter  city location'),
//              ),
//               ElevatedButton(
//                   onPressed: (){
//                     weatherBloc
//                     .add(FetchWeatherEvent(weatherController.text.trim()));
//                   },
//                   child:Text("Fetch data")),
//               state is WeatherLoadingState
//                   ? const CircularProgressIndicator()
//                   :state is WeatherLoadedState
//                   ? Text(state.weatherData.current!.toString())
//                   :state is WeatherLoadingFailureState  ? Text(state.error):const SizedBox.shrink()
//             ],
//           );
//         },
//       )
//     );
//   }
// }
