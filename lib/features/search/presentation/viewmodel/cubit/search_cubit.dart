import 'package:bloc/bloc.dart';
import 'package:e_teach/features/search/data/model/search_model.dart';
import 'package:e_teach/features/search/data/repo/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchInitial());
  final SearchRepo _searchRepo;
  static SearchCubit get(context) => BlocProvider.of(context);

  serachCourse(String name) async {
    emit(SearchLoading());
    var res = await _searchRepo.search(name);
    res.fold((l) => emit(SearchFailed(l.errMessage)), (r) {
      emit(SearchSuccessfully(r));
    });
  }
}
