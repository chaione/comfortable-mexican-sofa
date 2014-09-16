// CMS Uploader using plupload http://www.plupload.com/. Code inspired by
// plupload queue widget https://github.com/moxiecode/plupload/tree/master/js/jquery.plupload.queue
//
//= require moxie
//= require plupload.dev
//= require plupload/i18n/de
//= require plupload.settings

(function($, o) {
  window.CMS || (window.CMS = {});

  window.CMS.uploader = function(target, settings) {
    var uploader, id;

    id = target.attr('id');

    if (!id) {
      id = plupload.guid();
      target.attr('id', id);
    }

    settings = $.extend({
      runtimes : 'html5,browserplus,silverlight,flash,gears',
      dragdrop : true,
      drop_element : id + '-drag-drop-target',
      browse_button : id + '-browse',
      container : id,
      file_data_name : 'file[file]',
      headers : { 'Accept' : 'text/plupload' }
    }, settings);

    uploader = new plupload.Uploader(settings);

    // Add a file to the file list.
    function addFile(file) {
      var fileList = $('.cms-uploader-filelist', target);

      fileList.prepend(
        '<tr id="' + file.id + '">' +
          '<td>' +
            '<div class="icon"></div>' +
          '</td>' +
          '<td class="main">' +
            '<div class="item-title cms-uploader-file-title">' + file.name + '</div>' +
            '<div class="item-meta cms-uploader-file-meta"></div>' +
          '</td>' +
          '<td><div class="btn-group btn-group-sm"><a class="btn btn-danger cms-uploader-file-delete" href="#">Delete</a></div></td>' +
        '</tr>'
      );

      $('#' + file.id + ' a.cms-uploader-file-delete').click(function(e) {
        uploader.removeFile(file);
        e.preventDefault();
      });

      updateFileStatus(file);
    }

    // Remove a file from the file list.
    function removeFile(file) {
      $('#' + file.id).remove();
    }

    // Update a files upload status in the file list.
    function updateFileStatus(file) {
      var statusElm = $('#' + file.id + ' .cms-uploader-file-meta', target);

      if (file.status == plupload.UPLOADING) {
        statusElm.addClass('cms-uploader-file-status-bar').css('width', file.percent + '%');
      }

      if (file.status == plupload.FAILED) {
        statusElm.removeClass('cms-uploader-file-status-bar').html(file.error_message).css('color', 'red');
      }
    }

    uploader.bind("PostInit", function(up) {
      // Show drag and drop info and attach events if drag and drop is
      // supported and enabled.
      if (up.settings.dragdrop && up.features.dragdrop) {
        $('.cms-uploader-drag-drop-info', target).show();

        var drop_element = $(up.settings.drop_element);

        // When dragging over the document add a class to the drop target
        // that puts it ontop of every element and remove that class when
        // dropping or leaving the drop target. Otherwise the dragleave
        // event would fire whenever we dragging over a child element inside
        // the drop target such as text nodes or stuff.
        $(document).bind('dragenter', function(e) {
          drop_element.addClass('cms-uploader-drag-drop-target-active');
        });

        drop_element.bind('drop dragleave', function(e) {
          drop_element.removeClass('cms-uploader-drag-drop-target-active');
        });

      } else {
        $('.cms-uploader-drag-drop-info', target).hide();
      }
    });

    // Need to bind this before initialization to handle initialization errors too.
    uploader.bind("Error", function(up, err) {
      var file = err.file, message;

      if (file) {
        // Get error message from the server response. Not all runtimes
        // support this though.
        message = err.response;

        // If no error message is in the server response get standard
        // plupload error messages. This will have descriptive error message
        // for something like file size or file format errors but for
        // server errors it will only display a general error message.
        if (!message) {
          message = err.message;
          if (err.details) {
            message += " (" + err.details + ")";
          }
        }

        file.status = plupload.FAILED;
        file.error_message = message;
        updateFileStatus(file);
      }

      if (err.code === plupload.INIT_ERROR) {
        alert(_("Error: Initialisation error. Reload to try again."));
      }
    });

    uploader.init();

    uploader.bind('FilesAdded', function(up, files) {
      $.each(files, function(i, file) {
        addFile(file);
      });

      // Auto start upload when files are added.
      uploader.start();
    });

    uploader.bind("UploadProgress", function(up, file) {
      updateFileStatus(file);
    });

    uploader.bind('FileUploaded', function(up, file, info) {
      // Replace the dummy file entry in the file list with the the entry
      // from the server response.
      $('#' + file.id).replaceWith(info.response);
    });

    uploader.bind('FilesRemoved', function(up, files) {
      $.each(files, function(i, file) {
        removeFile(file);
      });
    });

    // Call setup function
    if (settings.setup) {
      settings.setup(uploader);
    }

  };
})(jQuery, mOxie);
