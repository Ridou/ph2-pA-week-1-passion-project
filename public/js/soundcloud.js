// initialize client with app credentials
$(document).ready(function(){
	$('.scconnect').on('click', function(e){
		e.preventDefault;
		scInitial()
	});
});

var scInitial = function(){
	SC.initialize({
		client_id: '47881159922de503e34a10a3ab73c93d',
		redirect_uri: 'http://localhost:9393/callback'
	});

	// initiate auth popup
	SC.connect(function() {
		SC.get('/me', function(me) { 
			alert('You have successfully logged in, ' + me.username); 
		});
	});
}