/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 * TODO: Add functionality to slide through multiple movies
 */

var app = (function() {
    var _self;

    return {

        $messageElement: $('.message'),
        $messageText: $('.message__text'),
        $message: '',

        init: function() {
            _self = this; // Scope

            _self.onLoad();
            _self.slideMovie();
            _self.options();
            _self.selectedOption();
            _self.taken();
            _self.calculateTotal();
            _self.checkout();

        },
        // start seating chart object

        onLoad: function(){

            $(window).load(function(){

                var cart = $('.movie-actions__cart'),
                    movie = $('.movie'),
                    ratings = $('.movie-actions__rating');

                cart.add(ratings).addClass('js-loaded');
                movie.addClass('js-loaded');

            });

        },

        slideMovie: function(){

            var movieBackground = $('.movie-background'),
                seating = $('.seating');

            $('.js-slide-up').on('click', function(){

                if( !movieBackground.hasClass('is-hidden') ) {

                    movieBackground.addClass('is-hidden');

                    if( seating.hasClass('is-hidden') ) {

                        seating.removeClass('is-hidden');

                    }

                } else if( !seating.hasClass('is-hidden') ) {

                    seating.addClass('is-hidden');

                    if( movieBackground.hasClass('is-hidden') ) {

                        movieBackground.removeClass('is-hidden');

                    }

                }

                // add animation to checkout button when seating is visible
                if( !seating.hasClass('is-hidden') ) {

                    $('.checkout__button').addClass('is-visible');

                }

            });

        },

        options: function(){

            var topLevel = $('.js-label');

            topLevel.on('click', function(){
                $(this).add($(this).next()).toggleClass('is-open');
            });

        },

        selectedOption: function(){

            // let's make a function to control a selected movie option

            var $movieOption = $('.js-option'),
                $selected;

            $movieOption.on('click',function(){

                var $this = $(this),
                    $selected = $this.text();

                $this.siblings().removeClass('is-selected');

                $this.toggleClass('is-selected');
                $this.parent().prev().text($selected);

                if($this.hasClass('is-selected')) {
                    $this.parent().prev().addClass('is-filled');
                    $this.parent().add($this.parent().prev()).removeClass('is-open');
                }

            });

        },

        calculateTotal: function(){

            var $quantity = $('.quantity'),
                $numberOfTickets = 0;
                
            $quantity.on('focus', function () {
                // Store the current value on focus and on change
                previous = this.value;
                console.log("valor previo: "+previous);
                
                }).on('change', function(){



                var $this = $(this),
                    $ticketType = $this.attr('name'),
                    $total = $this.siblings('.quantity__total'),
                    $price;
                
                if(previous==0){
                    // add on to this variable after every option is selected
                    $numberOfTickets = $numberOfTickets + parseFloat($this.val());
                }else{
                    $numberOfTickets = $numberOfTickets - previous;
                    $numberOfTickets = $numberOfTickets + parseFloat($this.val());
                }
                
                previous = this.value;

                // define a new variable to return the amount of tickets for each type (e.g adult, child, senior)
                var $ticketsByType = parseFloat($this.val());

                $this.parent().parent().prev().text('Usted ha seleccionado '+$numberOfTickets+' '+'entrada(s)');

                $this.parent().parent().prev().addClass('is-filled');

                if($numberOfTickets > 0) {
                    _self.$message = 'Por favor, escoja '+$numberOfTickets+' asientos';
                    _self.$messageText.text(_self.$message);
                    _self.$messageElement.addClass('is-visible is-success');
                }else{
                    _self.$message = 'Seleccione entradas';
                    _self.$messageText.text(_self.$message);
                    _self.$messageElement.addClass('is-visible is-error');
                }

                switch($ticketType) {

                    case 'adult':
                        $price = 60;
                        break;
                    case 'senior':
                        $price = 40;
                        break;
                    case 'child':
                        $price = 20;
                        break;

                }
                console.log("Ticket type: "+$ticketType);
                console.log("Primer price: "+$price);

                var $quantity = $('.quantity'),
                    $grandTotal = 0;

                $gtTickets = 0;
                var price =0;
                for (var i = 0; i < $quantity.length; i++) {
                    var $totalTickets = Number($quantity.eq(i).val());

                    //$ticketType = $this.attr('name')
                    console.log($quantity.eq(i).attr('name'));
                    switch($quantity.eq(i).attr('name')) {

                        case 'adult':
                            price = 60;
                            break;
                        case 'senior':
                            price = 40;
                            break;
                        case 'child':
                            price = 20;
                            break;

                    }

                    console.log("Price: "+price);
                    var $subTotal = price * $totalTickets;


                    $grandTotal += $subTotal;
                    console.log("St: "+$subTotal);
                    console.log("TTick: "+$totalTickets);
                    console.log("Gt: "+$grandTotal);

                    $gtTickets = $gtTickets + $totalTickets;
                    console.log($gtTickets);

                }

                $('.js-grand-total').addClass('is-filled');
                $('.js-grand-total').text('$'+$grandTotal+'.00');

                var $amount = $price * $ticketsByType;

                var $outputTotal = $total.text('$'+$amount+'.00');

            });

            var $seat = $('.js-seat');

            $seat.on('click', function(){

                var $this = $(this);
                if( $numberOfTickets !== undefined ) {

                    if(!$this.hasClass('seat--taken')) {

                        $this.toggleClass('seat--selected');

                        if(!$this.hasClass('seat--selected')) {

                            _self.$messageElement.removeClass('is-visible is-error');

                        }

                    } else {

                        _self.$message = 'Asiento ocupado. Intenta de nuevo.';
                        _self.$messageText.text(_self.$message);
                        _self.$messageElement.addClass('is-visible is-error');

                    }

                    var $seatsSelected = $('.chart__column .js-seat.seat--selected'),
                        $seatsRemaining = ($numberOfTickets - ($seatsSelected.length));

                        if($seatsRemaining === 0) {

                            _self.$message = 'Haz seleccionado todos tus asientos. Realiza el pago!';
                            _self.$messageText.text(_self.$message);
                            if(_self.$messageElement.hasClass('is-error')){
                                _self.$messageElement.removeClass('is-error');
                            }
                            _self.$messageElement.addClass('is-visible is-success');

                        } else if($seatsRemaining === 1) {

                            _self.$message = 'Aún tienes 1 asiento pendiente';
                            _self.$messageText.text(_self.$message);

                        } else if( $seatsRemaining < $numberOfTickets ) {

                            _self.$message = 'Aún tienes '+($seatsRemaining)+' asientos por escojer';
                            _self.$messageText.text(_self.$message);

                            if(_self.$messageElement.hasClass('is-error')){
                                _self.$messageElement.removeClass('is-error');
                            }
                            _self.$messageElement.addClass('is-visible is-success');

                        }

                    if($seatsSelected.length > $numberOfTickets) {

                        _self.$message = 'Haz selecionado todos tus asientos';
                        _self.$messageText.text(_self.$message);
                        $(this).removeClass('seat--selected');
                        if(_self.$messageElement.hasClass('is-success')){
                            _self.$messageElement.removeClass('is-success');
                        }
                        _self.$messageElement.addClass('is-visible is-error');
                    }

                } else {

                    _self.$message = 'Primero selecciona el número de entradas';
                    _self.$messageText.text(_self.$message);
                    _self.$messageElement.addClass('is-visible is-error');

                }

            });

        },

        taken: function(){

            // declare column and columnNum properties
            $columns = $('.chart__column');

            // just in case their are already taken seats -- remove them
            if( $('.chart__column .js-seat').hasClass('seat--taken') ){

                $('.chart__column .js-seat').removeClass('seat--taken');

            }

            // run for loop on columns
            for (var $columnNum = 1; $columnNum < $columns.length + 1; $columnNum++) {

                // set the seats to sele
                $seats = $('.chart__column[data-column='+$columnNum+'] .js-seat');
                numOfTaken = Math.floor( Math.random() * $seats.length );

                for (var i = 0; i < numOfTaken; i++) {
                    //console.log($seats.eq(i));
                    $seats.eq(i).addClass('seat--taken');

                }

            }

        },

        checkout: function(){
            
            var $checkout = $('.checkout__button');

            $checkout.on('click', function(){

                var $quantity = $('.quantity'),
                    $grandTotal = 0;

                for (var i = 0; i < $quantity.length; i++) {
                    var $totalTickets = Number($quantity.eq(i).val());
                    var $ticketCategory = $quantity.eq(i).attr('name');

                    var $price;
                    switch($ticketCategory) {

                        case 'adult':
                            $price = 60;
                            break;
                        case 'senior':
                            $price = 40;
                            break;
                        case 'child':
                            $price = 20;
                            break;

                    }

                    var $subTotal = $price * $totalTickets;
                    $grandTotal += $subTotal;
                    

                }
                

                var $seatsSelected = $('.chart__column .js-seat.seat--selected');
                var $asientos = [];
                //console.log($seatsSelected.data('id'));
                $($seatsSelected).each(function(){
                    console.log($(this).data('id'));
                    $asientos.push($(this).data('id'));
                });
                console.log("Asientos: "+$asientos);

                if( $seatsSelected.length === 0 ) {

                    _self.$message = 'Asegurate de seleccionar todas las opciones!';
                    _self.$messageText.text(_self.$message);
                    if(_self.$messageElement.hasClass('is-success')){
                        _self.$messageElement.removeClass('is-success');
                    }
                    _self.$messageElement.addClass('is-visible is-error');

                } else if($grandTotal > 0) {

                    _self.$message = 'Su total es de $'+$grandTotal+'.00. Disfrute su película!';
                    _self.$messageText.text(_self.$message);
                    if(_self.$messageElement.hasClass('is-error')){
                        _self.$messageElement.removeClass('is-error');
                    }
                    _self.$messageElement.addClass('is-visible is-success');
                    //setTimeout(generaTickets($tt), 3000);
                    generaTickets($gtTickets);
                }
                
                function generaTickets(tt){
                    var person = prompt("Por favor, ingresa un nombre", "Harry Potter");
                    console.log('Generando tickets...'+tt);
                    console.log($(".is-selected")[1].children[0].children[0].textContent);
                    $horario = $(".is-selected")[1].children[0].children[0].textContent;
                    $("#persona").val(person);
                    $("#asientos").val($asientos);
                    $("#ntickets").val(tt);
                    $("#horario").val($horario);
                    
                    $( "#btnTickets" ).trigger( "click" );
                    
                    
                }

            });

        }

    };

})();

$(function() {
    app.init();
});