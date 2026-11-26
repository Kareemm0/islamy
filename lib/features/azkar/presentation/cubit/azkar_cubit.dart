import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/azkar_category.dart';
import '../../domain/entities/azkar_item.dart';
import '../../domain/usecases/get_azkar_items_usecase.dart';
import 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit(this._getAzkarItems)
      : super(const AzkarState(items: [], status: AzkarStatus.loading));

  final GetAzkarItemsUseCase _getAzkarItems;

  Future<void> loadAzkar() async {
    emit(state.copyWith(status: AzkarStatus.loading, clearError: true));
    final result = await _getAzkarItems();
    if (isClosed) return;
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AzkarStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (items) => emit(
        state.copyWith(
          items: List<AzkarItem>.unmodifiable(items),
          status: AzkarStatus.success,
          clearError: true,
        ),
      ),
    );
  }

  void selectCategory(AzkarCategory category) {
    if (category == state.category) return;
    emit(state.copyWith(category: category, playingAll: false));
  }

  void toggleSearch() {
    final nextSearching = !state.searching;
    emit(
      state.copyWith(
        searching: nextSearching,
        query: nextSearching ? state.query : '',
      ),
    );
  }

  void setQuery(String value) {
    emit(state.copyWith(query: value));
  }

  void togglePlayAll() {
    emit(state.copyWith(playingAll: !state.playingAll));
  }

  void resetProgress() {
    final updated = List<AzkarItem>.unmodifiable(
      state.items.map(
        (item) => item.category == state.category
            ? item.copyWith(count: 0, clearRecitedAt: true)
            : item,
      ),
    );
    emit(state.copyWith(items: updated));
  }

  void tap(AzkarItem item) {
    if (item.isCompleted) return;
    final nextCount = item.count + 1;
    final completed = nextCount >= item.repetitions;
    final updated = List<AzkarItem>.unmodifiable(
      state.items.map(
        (current) => current.id == item.id
            ? current.copyWith(
                count: nextCount,
                recitedAt: completed ? _nowLabel() : current.recitedAt,
              )
            : current,
      ),
    );
    emit(state.copyWith(items: updated));
  }

  void reread(AzkarItem item) {
    final updated = List<AzkarItem>.unmodifiable(
      state.items.map(
        (current) => current.id == item.id
            ? current.copyWith(count: 0, clearRecitedAt: true)
            : current,
      ),
    );
    emit(state.copyWith(items: updated));
  }

  void incrementTasbih() {
    emit(state.copyWith(tasbihBeads: (state.tasbihBeads + 1) % 34));
  }

  void resetTasbih() {
    emit(state.copyWith(tasbihBeads: 0));
  }

  static String _nowLabel() {
    final n = DateTime.now();
    final h = n.hour % 12 == 0 ? 12 : n.hour % 12;
    final m = n.minute.toString().padLeft(2, '0');
    return '${h.toString().padLeft(2, '0')}:$m ${n.hour < 12 ? 'ص' : 'م'}';
  }
}
