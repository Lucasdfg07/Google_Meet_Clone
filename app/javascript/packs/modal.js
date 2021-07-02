import $ from 'jquery';

$(document).ready(function() {
    $('.chat_modal').hide();

    $('.chat_btn').click(function() {
        $('.chat_modal').toggle(300);
    });

    $('.close').click(function() {
        $('.chat_modal').hide(300);
    });
});
