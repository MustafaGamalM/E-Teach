part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
// update profile

class SearchFailed extends SearchState {
  final String errorMessage;

  SearchFailed(this.errorMessage);
}

class SearchSuccessfully extends SearchState {
  final SearchModel searchModel;

  SearchSuccessfully(this.searchModel);
}

class SearchLoading extends SearchState {}
