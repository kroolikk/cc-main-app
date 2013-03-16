var $content = "<%= escape_javascript( render( :partial => 'shared/post_box') ) %>";
$('.post_box').append($content);
$('.mason-holder').masonry( 'reload' );