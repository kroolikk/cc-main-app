$(document).ready(function(){
  $('.blurme').blurjs({
    source: '.behind-bg',
    radius: 50
  }); //end blur.js
 
	 var $container = $('.mason-holder');
	$container.imagesLoaded(function(){
	  $container.masonry({
		itemSelector: '.mason',
		isFitWidth: true,
		isResizable: true,
		columnWidth: 1
	  });
	}); // end masonry
	
}); 
