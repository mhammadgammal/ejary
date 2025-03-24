abstract class NoParameterBaseUseCase<Repo, T> {

  late final Repo repository;

  T call();
}
