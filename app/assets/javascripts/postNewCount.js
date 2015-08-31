;$(function() {

    $('#post_content').on('keyup', function() {
        var charCount = $(this).val().length;
        var charCountHTML;
        switch (true) {
            case (charCount > 100 && charCount <= 140):
                charCountHTML = '<mark><em>' + (140 - charCount) + '</em></mark>';
                break;
            case (charCount > 140):
                charCountHTML = '<strong><u>' + (140 - charCount) + '</u></strong>';
                break;
            default:
                charCountHTML = 140 - charCount
        }
        $(".charCount").html(charCountHTML);
    });  //The above code is for counting user input text



});