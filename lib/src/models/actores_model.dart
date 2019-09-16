

class Cast{
    List<Actor> actores=new List();

    Cast.fromJsonList(List<dynamic> jsonlist){
        if(jsonlist==null){
          return;
        }

        jsonlist.forEach((item){
          final actor=Actor.fromJsonMap(item);
          actores.add(actor);
        });
    }

}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });


  Actor.fromJsonMap(Map <String,dynamic> json){
    this.castId       = json['cast_id'];
    this.character    = json['character'];
    this.creditId     = json['credit_id'];
    this.gender       = json['gender'];
    this.id           = json['id'];
    this.name         = json['name'];
    this.order        = json['order'];
    this.profilePath  = json['profile_path'];
  }

  String getProfilePath(){
    if(profilePath==null){
      return 'https://www.speakandwrite.com.au/wp-content/uploads/2016/03/avatar-300x300.png';
    }
    return 'https://image.tmdb.org/t/p/w200/$profilePath';
  }

}

