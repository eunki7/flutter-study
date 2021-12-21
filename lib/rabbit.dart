class Rabbit{
  String _name;
  RabbitState _state;
  Rabbit({ required String name, required RabbitState state }) : _name = name, _state = state;

  get name => _name;
  get state => _state;

  updateState(RabbitState state) {
    this._state = state;
  }
}

enum RabbitState{ SLEEP, RUN, WALK, EAT }