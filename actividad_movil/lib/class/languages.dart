class MusicList {
  String title;
  String name;
  String descriptions;
  String single;
  String author;
  String durations;
  String coverImg;

  MusicList(this.title, this.name, this.descriptions, this.single, this.author, this.durations, this. coverImg);

  static List<MusicList> musicList() {
    return [
      MusicList(
        "Blinding Lights",
        "The Weeknd",
        "Un éxito mundial de pop/synthwave con vibes de los 80s",
        "Sí",
        "The Weeknd",
        "3:20",
        "https://link_to_cover/blinding_lights.jpg",
      ),
      MusicList(
        "Shape of You",
        "Ed Sheeran",
        "Canción pop con influencias dancehall, uno de los temas más escuchados",
        "Sí",
        "Ed Sheeran",
        "3:54",
        "https://link_to_cover/shape_of_you.jpg",
      ),
      MusicList(
        "Bohemian Rhapsody",
        "Queen",
        "Clásico del rock con múltiples estilos en una sola canción",
        "No",
        "Freddie Mercury",
        "5:55",
        "https://link_to_cover/bohemian_rhapsody.jpg",
      ),
      MusicList(
        "Smells Like Teen Spirit",
        "Nirvana",
        "Icono del grunge de los 90, himno de una generación",
        "Sí",
        "Kurt Cobain",
        "5:01",
        "https://link_to_cover/smells_like_teen_spirit.jpg",
      ),
      MusicList(
        "Despacito",
        "Luis Fonsi ft. Daddy Yankee",
        "Reguetón/pop latino que rompió récords en todo el mundo",
        "Sí",
        "Luis Fonsi",
        "3:47",
        "https://link_to_cover/despacito.jpg",
      ),
    ];
  }
}