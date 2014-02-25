$(function(){

  $('#addSection form').on('submit', function(event){
    event.preventDefault();


    console.log("section was added!", event);

    var newSection = {};

    newSection.title = $("#section_title").val();
    console.log(newSection);

    $.post($("#addSection form").attr("action"), {section: newSection}).done(function(data){
      console.log(data);
      var sectionHTML = HandlebarsTemplates.section(data);
      $("#section_title").val("");
      $("#sections").append(sectionHTML);
    });
  });

   // get request to show all sections in that course
  $.ajax({
    url: $("#addSection form").attr("action"),
    type: "GET",
  }).done(function(data){
    console.log(data);
    $(data).each(function(index,section){
      var sectionHTML = HandlebarsTemplates.section(section);
      $("#sections").append(sectionHTML);
    });
  });

});