$(function(){

  // show new form
  var path = {path: gon.content_path};
  var newFormHTML = HandlebarsTemplates.new_form(path);
  $("#content1").append(newFormHTML);

  // listen for submit on #addContent
  $("#content1 form").on("submit", function(event){
    event.preventDefault();

    // create newContent using
    // content_source_url and content_text
    // from the content form
    var newContent = {
      source_url: $("#content_source_url").val(),
      text: $("#content_text").val()
    };

    // log the newContent in console
    console.log(newContent);

    // Grab url from form's action
    // specifically from #new-content form
    $.post(gon.content_path, {content: newContent}).done(function(data){
        console.log(data);

      // Append this content
      var contentHTML = HandlebarsTemplates.contents(data);
      $("#content1").append(contentHTML);
    });
  });// <-- end of submit #addContent function


  // Display all content(s) on the page
  // WHAT'S THE URL? 
  $.get(gon.content_path).done(function(data){
    $(data).each(function(index, contentItem){
      var contentHTML = HandlebarsTemplates.contents(contentItem);
      $("#content1").append(contentHTML);
    });
  });


}); // <-- end of entire function