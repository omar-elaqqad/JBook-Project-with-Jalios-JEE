/**
 * ImageUploader.js - a client-side image resize and upload javascript module
 *
 * @author Ross Turner (https://github.com/zsinj)
 *
 * Copied from https://github.com/rossturner/HTML5-ImageUploader/blob/master/src/main/webapp/js/ImageUploader.js
 * and http://stackoverflow.com/questions/10333971/html5-pre-resize-images-before-uploading
 */
var ImageUploader = function(config) {
  if (
    !config ||
    !config.inputElement ||
    !config.inputElement.getAttribute ||
    config.inputElement.getAttribute("type") !== "file"
  ) {
    throw new Error(
      'Config object passed to ImageUploader constructor must include "inputElement" set to be an element of type="file"'
    );
  }
  this.setConfig(config);

  var This = this;
  this.config.inputElement.addEventListener(
    "change",
    function(event) {
      $.log(new Date(), "fileInput reveiced change event");
      var fileArray = [];
      var cursor = 0;

      // Remove previous thumbnail if any
      var nextPossibleThumbnail = $(This.config.inputElement)
        .parent()
        .next();
      if (nextPossibleThumbnail.hasClass("uploader-preview-wrapper")) {
        nextPossibleThumbnail.remove();
      }

      for (; cursor < This.config.inputElement.files.length; ++cursor) {
        fileArray.push(This.config.inputElement.files[cursor]);
      }
      This.handleFileList(fileArray, This.config.inputElement);
    },
    false
  );
};

ImageUploader.prototype.handleFileList = function(fileArray, inputElement) {
  var This = this;
  if (fileArray.length > 1) {
    var file = fileArray.shift();
    this.handleFileSelection(file, inputElement);
  } else if (fileArray.length === 1) {
    this.handleFileSelection(fileArray[0], inputElement);
  }
};

ImageUploader.prototype.handleFileSelection = function(file, inputElement) {
  var img = document.createElement("img");
  this.currentFile = file;
  var reader = new FileReader();
  var This = this;

  $.log(new Date(), "Showing loader");
  $(".ui-loader").loader("show");

  reader.onload = function(e) {
    $.log(new Date(), "Checking it is an image");
    if (e.target.result.split(",")[0].indexOf("data:image/") === -1) {
      $.log(new Date(), "Not an image, hiding loader");
      $(".ui-loader").loader("hide");
      return;
    }

    $.log(new Date(), "Creating fake image");
    img.src = e.target.result;

    setTimeout(function() {
      This.scaleImage(img, inputElement, e.target.result);
    }, 1);
  };
  reader.readAsDataURL(file);
};

ImageUploader.prototype.scaleImage = function(
  img,
  inputElement,
  originalImageData
) {
  $.log(new Date(), "Begin scaleImage");

  /* Slow, high quality method */
  if ($(inputElement).data("resize-quality-high")) {
    var canvas = document.createElement("canvas");
    canvas.width = img.width;
    canvas.height = img.height;
    canvas.getContext("2d").drawImage(img, 0, 0, canvas.width, canvas.height);

    while (canvas.width >= 2 * this.config.maxWidth) {
      $.log(new Date(), "Begin getHalfScaleCanvas iteration");
      canvas = this.getSimpleScaledCanvas(canvas, 2);
    }

    if (canvas.width > this.config.maxWidth) {
      $.log(new Date(), "Begin scaleCanvasWithAlgorithm iteration");
      canvas = this.scaleCanvasWithAlgorithm(canvas);
    }
  } else {
    /* Fast, low quality method */
    $.log(new Date(), "Begin fast canvas resize");
    var scale = img.width / this.config.maxWidth;
    var canvas = this.getSimpleScaledCanvas(img, scale);
    $.log(new Date(), "End fast canvas resize");
  }

  $.log(new Date(), "Begin getAsJPEGBlob");
  var resizedImageData = this.getAsJPEGBlob(
    canvas,
    inputElement,
    originalImageData
  );
  $.log(new Date(), "End getAsJPEGBlob");

  if (resizedImageData != null) {
    $(inputElement).data("image-data-content", resizedImageData);
    $(inputElement).data("image-data-filename", inputElement.files[0].name);

    // Create new thumbnail
    $(inputElement)
      .parent()
      .after(
        '<div class="uploader-preview-wrapper"><span class="uploader-preview-clear ui-input-btn ui-btn ui-icon-delete ui-btn-icon-notext ui-corner-all"></span><img class="uploader-preview-thumbnail" src="' +
          canvas.toDataURL("image/jpeg", 0.75) +
          '" />'
      );

    // Hide input
    $(inputElement)
      .parent()
      .addClass("hide");
  } else {
    if ($.jalios.smartPhone.isMobileApp()) {
      if (
        originalImageData.split(",")[0].indexOf("data:image/jpeg;base64") >= 0
      ) {
        $(".upload-image-action-container").append(
          '<div class="imagepreview"><span class="icon-close ui-input-btn ui-btn ui-icon-delete ui-btn-icon-notext ui-corner-all"></span><img src="' +
            originalImageData +
            '" /></div>'
        );
        $(".upload-image-action-icon").hide();
      }
    }
  }

  $(".ui-loader").loader("hide");
  $.log(new Date(), "Hiding loader");
};

ImageUploader.prototype.scaleCanvasWithAlgorithm = function(canvas) {
  var scaledCanvas = document.createElement("canvas");

  var scale = this.config.maxWidth / canvas.width;

  scaledCanvas.width = canvas.width * scale;
  scaledCanvas.height = canvas.height * scale;

  var srcImgData = canvas
    .getContext("2d")
    .getImageData(0, 0, canvas.width, canvas.height);
  var destImgData = scaledCanvas
    .getContext("2d")
    .createImageData(scaledCanvas.width, scaledCanvas.height);

  this.applyBilinearInterpolation(srcImgData, destImgData, scale);

  scaledCanvas.getContext("2d").putImageData(destImgData, 0, 0);

  return scaledCanvas;
};

ImageUploader.prototype.getSimpleScaledCanvas = function(canvas, scale) {
  var scaledCanvas = document.createElement("canvas");
  scaledCanvas.width = canvas.width / scale;
  scaledCanvas.height = canvas.height / scale;

  scaledCanvas
    .getContext("2d")
    .drawImage(canvas, 0, 0, scaledCanvas.width, scaledCanvas.height);

  return scaledCanvas;
};

ImageUploader.prototype.applyBilinearInterpolation = function(
  srcCanvasData,
  destCanvasData,
  scale
) {
  function inner(f00, f10, f01, f11, x, y) {
    var un_x = 1.0 - x;
    var un_y = 1.0 - y;
    return f00 * un_x * un_y + f10 * x * un_y + f01 * un_x * y + f11 * x * y;
  }
  var i, j;
  var iyv, iy0, iy1, ixv, ix0, ix1;
  var idxD, idxS00, idxS10, idxS01, idxS11;
  var dx, dy;
  var r, g, b, a;
  for (i = 0; i < destCanvasData.height; ++i) {
    iyv = i / scale;
    iy0 = Math.floor(iyv);
    // Math.ceil can go over bounds
    iy1 =
      Math.ceil(iyv) > srcCanvasData.height - 1
        ? srcCanvasData.height - 1
        : Math.ceil(iyv);
    for (j = 0; j < destCanvasData.width; ++j) {
      ixv = j / scale;
      ix0 = Math.floor(ixv);
      // Math.ceil can go over bounds
      ix1 =
        Math.ceil(ixv) > srcCanvasData.width - 1
          ? srcCanvasData.width - 1
          : Math.ceil(ixv);
      idxD = (j + destCanvasData.width * i) * 4;
      // matrix to vector indices
      idxS00 = (ix0 + srcCanvasData.width * iy0) * 4;
      idxS10 = (ix1 + srcCanvasData.width * iy0) * 4;
      idxS01 = (ix0 + srcCanvasData.width * iy1) * 4;
      idxS11 = (ix1 + srcCanvasData.width * iy1) * 4;
      // overall coordinates to unit square
      dx = ixv - ix0;
      dy = iyv - iy0;
      // I let the r, g, b, a on purpose for debugging
      r = inner(
        srcCanvasData.data[idxS00],
        srcCanvasData.data[idxS10],
        srcCanvasData.data[idxS01],
        srcCanvasData.data[idxS11],
        dx,
        dy
      );
      destCanvasData.data[idxD] = r;

      g = inner(
        srcCanvasData.data[idxS00 + 1],
        srcCanvasData.data[idxS10 + 1],
        srcCanvasData.data[idxS01 + 1],
        srcCanvasData.data[idxS11 + 1],
        dx,
        dy
      );
      destCanvasData.data[idxD + 1] = g;

      b = inner(
        srcCanvasData.data[idxS00 + 2],
        srcCanvasData.data[idxS10 + 2],
        srcCanvasData.data[idxS01 + 2],
        srcCanvasData.data[idxS11 + 2],
        dx,
        dy
      );
      destCanvasData.data[idxD + 2] = b;

      a = inner(
        srcCanvasData.data[idxS00 + 3],
        srcCanvasData.data[idxS10 + 3],
        srcCanvasData.data[idxS01 + 3],
        srcCanvasData.data[idxS11 + 3],
        dx,
        dy
      );
      destCanvasData.data[idxD + 3] = a;
    }
  }
};
ImageUploader.prototype.dataURItoBlob = function(dataURI, callback) {
  // convert base64 to raw binary data held in a string
  // doesn't handle URLEncoded DataURIs

  var byteString;
  if (dataURI.split(",")[0].indexOf("base64") >= 0) {
    byteString = atob(dataURI.split(",")[1]);
  } else {
    byteString = unescape(dataURI.split(",")[1]);
  }

  // separate out the mime component
  var mimeString = dataURI
    .split(",")[0]
    .split(":")[1]
    .split(";")[0];

  // write the bytes of the string to an ArrayBuffer
  var ab = new ArrayBuffer(byteString.length);
  var ia = new Uint8Array(ab);
  for (var i = 0; i < byteString.length; i++) {
    ia[i] = byteString.charCodeAt(i);
  }

  // write the ArrayBuffer to a blob
  return new Blob([ab], { type: mimeString });
};

ImageUploader.prototype.getAsJPEGBlob = function(
  canvas,
  element,
  originalImageData
) {
  var quality = $(element).data("jalios-imageuploader-jpeg-quality")
    ? $(element).data("jalios-imageuploader-jpeg-quality")
    : $["jalios-settings"]["imageuploader-default-jpeg-quality"];
  var resizedImageData = canvas.toDataURL("image/jpeg", quality);

  /* DEVSMARTPHONE-102 : FileUpload - Prevent base 64 issues in IOS */
  /* iOS returns "data:," when it thinks the image is too big for it. We do not use this. */
  if (
    resizedImageData == null ||
    resizedImageData === "" ||
    resizedImageData === "data:,"
  ) {
    return null;
  }

  // Restore EXIF informations
  if (originalImageData.split(",")[0].indexOf("data:image/jpeg;base64") >= 0) {
    resizedImageData =
      "data:image/jpeg;base64," +
      ExifRestorer.restore(originalImageData, resizedImageData);
  }

  var blob = this.dataURItoBlob(resizedImageData);

  return blob;
};

ImageUploader.prototype.setConfig = function(customConfig) {
  this.config = customConfig;
  this.config.debug = this.config.debug || false;
  if (!this.config.maxWidth) {
    this.config.maxWidth = 1024;
  }

  // Create container if none set
  if (!this.config.workspace) {
    this.config.workspace = document.createElement("div");
    document.body.appendChild(this.config.workspace);
  }
};
