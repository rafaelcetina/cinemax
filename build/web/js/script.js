jQuery(document).ready(function($) {

	$('a').on('click', function(e) {
		//e.preventDefault();
	});

	$('.trigger-sidebar-toggle').on('click', function() {
		$('body').toggleClass('sidebar-is-open');
	});
    
    var numeroAleatorio = Math.floor(Math.random() * 3 ) + 1;
    
    switch(numeroAleatorio){
        case 1:
            document.getElementById("login").style.background = "url(https://images-na.ssl-images-amazon.com/images/M/MV5BMTY2MTk3MDQ1N15BMl5BanBnXkFtZTcwMzI4NzA2NQ@@._V1_SX1200.jpg) no-repeat   center center #505050";
        break;
        case 2:
            document.getElementById("login").style.background = "url(https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ1MjQwMTE5OF5BMl5BanBnXkFtZTgwNjk3MTcyMDE@._V1_SX1200.jpg) no-repeat   center center #505050";
        break;
        case 3:
            document.getElementById("login").style.background = "url(http://pics.filmaffinity.com/the_fast_and_the_furious_tokyo_drift-349229245-large.jpg) no-repeat   center center #505050";
        break;
    }
    document.getElementById("login").style.backgroundSize = "cover";
    

});

