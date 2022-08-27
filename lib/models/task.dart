class Task {
  String title;
  String description;

  Task(this.title, this.description);
}

// {nominal} - precisamos passar o nome
// Task({this.title, this.description});
// var teste = Task(title: 'b', description: 'b');

// [opcional] - não precisamos passar
// Task([this.title, this.description]);
// var teste = Task();
