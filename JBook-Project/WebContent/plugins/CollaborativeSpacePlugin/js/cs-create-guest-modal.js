// the semi-colon before function invocation is a safety net against concatenated
// scripts and/or other plugins which may not be closed properly.
;(function($, window, document, undefined) {

  "use strict";

  const register = function(event){
    initPropositionCards(event);

    // Register Ajax-Refresh callback
    $(document).on('jalios:refresh', handleAjaxRefresh);
  }; // register

  const handleAjaxRefresh = function (event) {
    // Handle an Ajax-Refresh After
    let refresh = $.jalios.Event.match(event, 'refresh', 'after');
    if (!refresh || !refresh.target){ return; }
    initPropositionCards(event);
  }; // handleAjaxRefresh

  /**
   * click on "transform contact to guest"
   */
  const convertContactToGuest = function(event) {
    let $target = $(event.target);
    let $urlDiv = $target.closest('[data-jalios-csp-transform-contact-to-guest-url]');
    let convertUrl = $urlDiv.length ? $urlDiv.data('jalios-csp-transform-contact-to-guest-url') : undefined;
    if (!convertUrl) {
      return false;
    }
    let $card = $(event.currentTarget).closest('.card-member');
    if (!$card.length) {
      return false;
    }
    let mid = $card.attr('data-jalios-data-id');
    let $modal = $card.closest('FORM').closest('[data-jalios-ajax-refresh-url]');
    if (!$modal.length) {
      return false;
    }
    // Update the ajax refresh URL to redirect to transform contact to guest modal
    $modal.attr('data-jalios-ajax-refresh-url', convertUrl + '?contact=' + mid);
    $(':input[name=proposedMemberId]').val(mid);

    let $opNext = $card.closest('FORM').find(':input[name=opNext]');
    if ($opNext.exists()) {
      event.preventDefault();
      event.stopImmediatePropagation();
      $opNext.click();
    }
  }; // convertContactToGuest

  const selectProposition = function (event) {
    let $selectBtn = $(event.target);
    if (!$selectBtn.length) { return; }
    let $card = $selectBtn.closest('.card-member-guest-proposition');
    let mid = $selectBtn.data('jalios-data-id');
    if (!mid) { return; }
    $(':input[name=proposedMemberId]').val(mid);

    let $opNext = $card.closest('FORM').find(':input[name=opNext]');
    if ($opNext.exists()) {
      event.preventDefault();
      event.stopImmediatePropagation();
      $opNext.click();
    }
  }; // selectProposition

  /**
   * Generate a Select button for each proposed member cards
   */
  const initPropositionCards = function (event) {
    if (!$('.card-cs-guest-layout').length) {
      return;
    }
    $('.card-member-guest-proposition').each(function(index, value){
      let $card = $(this);
      let mid = $card.data('jalios-data-id');
      let $btnTarget = $card.find('.card-front .card-block:first-child');
      let $btn = $('.btn-guest-mbr-proposition[data-jalios-data-id="' + mid + '"]');
      if ($btn.length && $btnTarget.length) {
        $btnTarget[0].after($btn[0]);
      }

      let $cardFlipper = $card.find('.card-flipper');
      $cardFlipper.remove();

      let $emailTarget = $card.find('.card-front .card-block:first-child .card-block-item');
      let $email = $card.find('DIV.member-email');
      if ($email.length && $emailTarget.length) {
        $emailTarget[0].append($email[0]);
      }
    });

    // Init Select btn onClick
    $('.card-cs-guest-layout .btn-select-mbr').on('click', selectProposition);
    $('.card-cs-guest-layout .convert-contact-to-guest-btn').on('click', convertContactToGuest);
  }; // initPropositionCards

  // ------------------------------------------
  //  DOM READY CODE
  // ------------------------------------------

  $(document).ready(function(event) {
    register(event);
  });

}(jQuery, window, document));
