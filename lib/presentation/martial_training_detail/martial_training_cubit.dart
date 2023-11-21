import 'package:boxing_traning/data/repository/sport_repositories.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'martial_training_state.dart';

class MartialTrainingCubit extends Cubit<MartialTrainingState> {
  MartialTrainingCubit() : super(MartialTrainingInitial());
  final SportRepository _repository = SportRepositoryImplement();
  void initialData(String id) {
    getMaterialDetail(id);
  }

  Future<void> deleteMaterialArt(String id) async {
    await _repository.deleteSport(id);
  }

  Future<void> getMaterialDetail(String id) async {
    emit(MartialLoading());
    final result = await _repository.getDetail(id);
    emit(MartialLoadSuccess(result));
  }
}
