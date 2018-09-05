class Book{
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  //[this._description] is an optional parameter
  Book(this._title, this._priority, this._date, [this._description]);

  // named contructor
  Book.withId(this._id, this._title, this._priority, this._date, [this._description]);

  int get id => _id;
  String get title => _title;
  String get description => _description;
  int get priority => _priority;
  String get date => _date;

  set title (String newTitle){
    if(newTitle.length <= 255){
      _title = newTitle;
    }
  }

  set description(String newDescription){
    if(newDescription.length <= 255){
      _description = newDescription;
    }
  }

  set priority(int newPriority){
    if(newPriority >=0 && newPriority <=3){
      _priority = newPriority;
    }
  }

  set date(String newDate){
    _date = newDate;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    map["priority"] = _priority;
    map["date"] = _date;

    if(id != null){
      map["id"] = _id;
    }
    return map;
  }

  Book.fromObject(dynamic o){
    this._id = o["id"];
    this._title = o["title"];
    this._description = o["description"];
    this._priority = o["priority"];
    this._date = o["date"];

  }
}