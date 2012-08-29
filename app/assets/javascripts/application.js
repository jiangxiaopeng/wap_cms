// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Removes a snippet directly from the frontend when frontend controls are enabled
function removeSnip(snip_id, url) {
  jQuery.ajax({
    url: url,
    type: 'delete',
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    cache: false,
    success: function(data, textStatus, jqXHR) {
      $('#snippet-'+snip_id).remove();
    },
    error: function(data, textStatus, jqXHR) {
      result = jQuery.parseJSON(data.responseText);
      alert(result.message);
    }
  });
}

function openDialog(title, url) {
  $( "#yd_dialog").dialog({
    height: 'auto',
    width: 800,
    modal: true,
    title: 'Configuration: ' + title,
    open: function() {
      // loading the dialog content
      $("#yd_dialog_content").load(url, function() {
        $("#yd_dialog .loading").hide();
        $("#yd_dialog").height(400);
        $("#yd_dialog").dialog('option', 'position', 'center');
        // Change all forms to be an ajax form using jquery.form.js
        $("#yd_dialog form").ajaxForm({
          beforeSubmit: function () {
            $("#yd_dialog .error").hide();
            $("#yd_dialog form").hide();
            $("#yd_dialog .loading").show();
            $("#yd_dialog").height('auto');
            $("#yd_dialog").dialog('option', 'position', 'center');
          },
          // success: function() {
          //   location.reload();
          // },
          // error: function(data, textStatus, jqXHR) {
          //   alert(data.statusText + ' ('+data.status+')');
          // }
          complete: function(data, textStatus, jqXHR) {
            if (data.responseText == 'success') {
              location.reload();
            } else {
              $("#yd_dialog .error").text(data.responseText);
              $("#yd_dialog .error").show();
              $("#yd_dialog .loading").hide();
              $("#yd_dialog").height(400);
              $("#yd_dialog form").show();
              $("#yd_dialog").dialog('option', 'position', 'center');
              //alert(data.responseText);
            }
          }
        });
      });
    },
    close: function() {
      location.reload();
    }
  });
}

function adminInitSnippetSortable() {
    // Provides sorting of snippets, submitting the list of snippets present in every area
    $('.snippets').sortable({
        items:'.drag_item',
        forceHelperSize:true,
        placeholder: 'dashed_placeholder',        
        forcePlaceholderSize:true,
        connectWith: '.drop_target',
        handle: '.title',
        start: function(event, ui) {
          $('.drop_target').addClass('dragging');
        },
        stop: function(event, ui){
          $('.drop_target').removeClass('dragging');
          var sortorder={};
          $('.drop_target').each(function(){
            var itemorder=$(this).sortable('toArray');
            var targetId=$(this).attr('id');
            sortorder[targetId] = itemorder.toString();
          });
          adminSendSnippetOrder(sortorder);
        } 
    });
}

function adminSendSnippetOrder(sortorder) {
  $.ajax({
      type: 'put',
      url: admin_snippet_sort_url,
      data: ({'areas':sortorder}),
      error: function(data, textStatus, jqXHR) {
        alert(data.statusText + ' ('+data.status+')');
        location.reload();
      }
  });
}

// This helper function is needed for testing with selenium
function testScriptExecution(script) {
  eval(script);
}

function testDragTo(snippet, target) {
  jQuery.getScript("/javascripts/jquery.simulate.js");

  distance_between_elements = $(snippet).offset().top - $(target).offset().top;
  height_of_elements = $(target).height();
  dy = (distance_between_elements * ( $(snippet).size() - 1 )) + height_of_elements/2;

  alert(dy);
  
  jQuery.getScript("/javascripts/jquery.simulate.js");

  first = $(snippet);
  first.simulate("drag", {dx:0, dy:dy});
}
