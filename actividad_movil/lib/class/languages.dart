class LanguageList {
  String name;
  String creator;
  String description;
  String year;
  String paradigm;
  String imagenUrl;

  LanguageList(this.name, this.creator, this.description, this.year, this.paradigm, this.imagenUrl);

  static List<LanguageList> languageList() {
    return [
      LanguageList(
        "JavaScript",
        "Brendan Eich",
        "Lenguaje muy usado para desarrollo web, tanto frontend como backend (Node.js).",
        "1995",
        "Multiparadigma (Imperativo, Funcional, Orientado a Objetos)",
        "../assets/img/js.png",
      ),
      LanguageList(
        "Python",
        "Guido van Rossum",
        "Lenguaje interpretado, muy usado en IA, ciencia de datos y desarrollo web.",
        "1991",
        "Multiparadigma (Imperativo, Orientado a Objetos, Funcional)",
        "../assets/img/python.png",
      ),
      LanguageList(
        "Java",
        "James Gosling (Sun Microsystems)",
        "Lenguaje orientado a objetos, muy usado en aplicaciones empresariales y Android.",
        "1995",
        "Orientado a Objetos",
        "../assets/img/java.png",
      ),
      LanguageList(
        "C#",
        "Microsoft",
        "Lenguaje de programación moderno para desarrollo en .NET y videojuegos con Unity.",
        "2000",
        "Orientado a Objetos, Funcional",
        "../assets/img/csharp.png",
      ),
      LanguageList(
        "Dart",
        "Google",
        "Lenguaje optimizado para apps móviles, usado en Flutter.",
        "2011",
        "Orientado a Objetos",
        "../assets/img/dart.png",
      ),
    ];
  }
}