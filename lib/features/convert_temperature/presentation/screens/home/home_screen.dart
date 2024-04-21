import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/temperature_repository_impl.dart';
import '../../../domain/usecases/convert_temperature_usecase.dart';
import '../../blocs/temperature_converter/temperature_converter_bloc.dart';
import 'widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TemperatureConverterBloc(
        ConvertTemperatureUseCase(
          repository: TemperatureRepositoryImpl(),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Temperature Converter'),
        ),
        body: const HomeBody(),
      ),
    );
  }
}
