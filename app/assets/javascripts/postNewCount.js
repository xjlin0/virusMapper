;$(function() {

    $('#post_content').on('keyup', function() {
        var charCount = $(this).val().length;
        var charCountHTML;
        switch (true) {
            case (charCount > 100 && charCount <= 140):
                charCountHTML = '<kbd>' + (140 - charCount) + '</kbd>';
                break;
            case (charCount > 140):
                charCountHTML = '<code>' + (140 - charCount) + '</code>';
                break;
            default:
                charCountHTML = 140 - charCount
        }
        $(".charCount").html(charCountHTML);
    });  //The above code is for counting user input text

    $('.vote').on('click', function() {
      console.log('vote clicked!');
      // buttonGroup = this;
      button = $('span:last', this)
      // console.log(buttonGroup);
      // console.log('The following should be the thumb itself');
      // console.log($('span:first', buttonGroup));
      // console.log('The following should be the count itself');
      // console.log($('span:last', buttonGroup));
      // console.log('one step')
      console.log(button);
      console.log('data');
      console.log(button.attr('voter_hash'));
      var voteData = {
        voter_hash: button.attr('voter_hash'),
        vote:       button.attr('value'),
      };
      var postID =  button.attr('data-id');
      $.ajax({
          url: '/posts/' + postID + '/vote.json',
          dataType: 'JSON',
          data: voteData,
      })
      .done(function(postCount) {
          console.log("success");
          console.log('server data:');
          console.log(postCount);
          button.text(postCount)
          
      })
      .fail(function() {
          console.log("error");
      })
      .always(function() {
          console.log("complete");
      });
    

    })
//$('.badge.up[data-id=94]').text(2)


});