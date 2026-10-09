class NotesDAO{
  int? idNote;
  String? title;
  String? content;
  String? dateNote;

  NotesDAO({this.idNote,this.title,this.content,this.dateNote});

  //factory= constructor nombrado
  factory NotesDAO.fromMap(Map<String,dynamic> note){
    return NotesDAO(
      idNote: note['idNote'],
      title: note['title'],
      content: note['content'],
      dateNote: note['dateNote']
    );
  }


}