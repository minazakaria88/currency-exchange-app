import 'package:equatable/equatable.dart';

class CurrencyEntity extends Equatable {
  final String base;
  final String update;
  final int ms;
  final Results ? results;

  const CurrencyEntity({required this.results,
      required this.base, required this.update, required this.ms});

  @override
  List<Object?> get props => [];
}

class Results extends Equatable {
  final double country;
  const Results({required this.country});

  @override
  List<Object?> get props => [country];
}
