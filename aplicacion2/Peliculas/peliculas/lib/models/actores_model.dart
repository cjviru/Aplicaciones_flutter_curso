 class Cast
 {
  List<Actor> actores = [];
  Cast.fromJsonList(List<dynamic> jsonlist)
  {
    if(jsonlist==null)return;

    for (var item in jsonlist) {
      final actormodel = Actor.fromJsonMap(item);
      actores.add(actormodel);
    }
  }

  


 }



class Actor 
{
  int? castId;
  String? character;
  String? creditId;
  int? gender;
  int? id;
  String? name;
  int? order;
  String? profilePath;

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

  Actor.fromJsonMap(Map<String,dynamic> json)
  {
    castId      = json['cast_id'];
    character   = json['character'];
    creditId    = json['credit_id'];
    gender      = json['gender'];
    id          = json['id'];
    name        = json['name'];
    order       = json['order'];
    profilePath = json['profile_path'];
  }

 getPosterImg()
{
  if(profilePath==null||profilePath!.isEmpty)
  {
    return "https://cdn-icons-png.flaticon.com/512/4044/4044493.png";
  
  }
  else
  {
    return "https://image.tmbd.org/t/p/w500$profilePath";
    
  }
}

}
