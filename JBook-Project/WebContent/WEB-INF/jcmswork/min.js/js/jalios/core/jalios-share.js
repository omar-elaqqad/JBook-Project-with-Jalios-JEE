!(function(b){const d=function(){var e=document.querySelector(".share-link");e.select();e.setSelectionRange(0,99999);navigator.clipboard.writeText(e.value);if(toastr){toastr.options={positionClass:"toast-top-center"};toastr.info(b(".share-modal .btn-copy-link").data("jalios-toastr-text"))}};const c=function(){var e=document.querySelector(".share-modal .btn-copy-link");if(e){e.addEventListener("click",d)}};const a=function(){c();b(document).on("jalios:refresh",c)};b(document).ready(a)})(window.jQuery);