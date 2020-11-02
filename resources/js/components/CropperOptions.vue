<script>
import 'cropperjs/dist/cropper.css';
import Cropper from 'cropperjs';
const config = {
 aspectRatio: 1
}
let cropper = {
  transformer: function (file, done)  {
   
    var myDropZone = this;
    var exdiv = document.createElement('div');
    // exdiv.style.
    var editor = document.createElement('div');
    editor.style.position = 'fixed';
    editor.style.left = 0;
    editor.style.right = 0;
    editor.style.top = 0;
    editor.style.bottom = 0;
    editor.style.zIndex = 9999;
    editor.style.backgroundColor = '#000';
    document.body.appendChild(editor);
    // Create confirm button at the top left of the viewport
    var buttonConfirm = document.createElement('button');
    buttonConfirm.style.position = 'absolute';
    buttonConfirm.style.left = '10px';
    buttonConfirm.className = 'wt-btn';
    buttonConfirm.style.top = '10px';
    buttonConfirm.style.zIndex = 9999;
    buttonConfirm.textContent = $("#crop_translation").text();
    buttonConfirm.style.backgroundColor = '#9ee17c';
    buttonConfirm.style.color = 'black';
    exdiv.appendChild(buttonConfirm);
    editor.appendChild(exdiv);
    buttonConfirm.addEventListener('click', function() {
    var canvas = cropper.getCroppedCanvas({
      width: 256,
      height: 256
    });
    canvas.toBlob(function(blob) {
      myDropZone.createThumbnail(
        blob,
        myDropZone.options.thumbnailWidth,
        myDropZone.options.thumbnailHeight,
        myDropZone.options.thumbnailMethod,
        false, 
        function(dataURL) {
          
          myDropZone.emit('thumbnail', file, dataURL);
          done(blob);
      });
    });
    document.body.removeChild(editor);
  });
    var image = new Image();
    image.src = URL.createObjectURL(file);
    editor.appendChild(image);
    
    var cropper = new Cropper(image, { 
        aspectRatio: myDropZone.options.aspect_ratio
    });
 
  }
}
  export default cropper;
  
  
  
  </script>