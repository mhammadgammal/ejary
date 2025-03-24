abstract class ParameterizedBaseUseCase<R, T, P> {
  late final R repository;

  T call(P param);
}
