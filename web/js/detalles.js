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

            $quantity.on('change', function(){

                var $this = $(this),
                    $ticketType = $this.attr('name'),
                    $total = $this.siblings('.quantity__total'),
                    $price;

                // add on to this variable after every option is selected
                $numberOfTickets = $numberOfTickets + parseFloat($this.val());

                // define a new variable to return the amount of tickets for each type (e.g adult, child, senior)
                var $ticketsByType = parseFloat($this.val());

                $this.parent().parent().prev().text('You\'ve selected '+$numberOfTickets+' '+'tickets');

                $this.parent().parent().prev().addClass('is-filled');

                if($numberOfTickets > 0) {
                    _self.$message = 'Please select '+$numberOfTickets+' seats';
                    _self.$messageText.text(_self.$message);
                    _self.$messageElement.addClass('is-visible is-success');
                }

                switch($ticketType) {

                    case 'adult':
                        $price = 10;
                        break;
                    case 'senior':
                        $price = 8;
                        break;
                    case 'child':
                        $price = 7;
                        break;

                }

                var $quantity = $('.quantity'),
                    $grandTotal = 0;

                for (var i = 0; i < $quantity.length; i++) {
                    var $totalTickets = Number($quantity.eq(i).val());

                    var $price;
                    switch($ticketType) {

                        case 'adult':
                            $price = 10;
                            break;
                        case 'senior':
                            $price = 8;
                            break;
                        case 'child':
                            $price = 7;
                            break;

                    }

                    var $subTotal = $price * $totalTickets;
                    $grandTotal += $subTotal;


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

                        _self.$message = 'Seat is already taken. Try again.';
                        _self.$messageText.text(_self.$message);
                        _self.$messageElement.addClass('is-visible is-error');

                    }

                    var $seatsSelected = $('.chart__column .js-seat.seat--selected'),
                        $seatsRemaining = ($numberOfTickets - ($seatsSelected.length));

                        if($seatsRemaining === 0) {

                            _self.$message = 'You\'ve selected all your seats. Checkout now!';
                            _self.$messageText.text(_self.$message);
                            if(_self.$messageElement.hasClass('is-error')){
                                _self.$messageElement.removeClass('is-error');
                            }
                            _self.$messageElement.addClass('is-visible is-success');

                        } else if($seatsRemaining === 1) {

                            _self.$message = 'You have 1 seat remaining';
                            _self.$messageText.text(_self.$message);

                        } else if( $seatsRemaining < $numberOfTickets ) {

                            _self.$message = 'You have '+($seatsRemaining)+' seats remaining';
                            _self.$messageText.text(_self.$message);

                            if(_self.$messageElement.hasClass('is-error')){
                                _self.$messageElement.removeClass('is-error');
                            }
                            _self.$messageElement.addClass('is-visible is-success');

                        }

                    if($seatsSelected.length > $numberOfTickets) {

                        _self.$message = 'You\'ve chosen all your seats';
                        _self.$messageText.text(_self.$message);
                        $(this).removeClass('seat--selected');
                        if(_self.$messageElement.hasClass('is-success')){
                            _self.$messageElement.removeClass('is-success');
                        }
                        _self.$messageElement.addClass('is-visible is-error');
                    }

                } else {

                    _self.$message = 'You must select your tickets first';
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
                            $price = 10;
                            break;
                        case 'senior':
                            $price = 8;
                            break;
                        case 'child':
                            $price = 7;
                            break;

                    }

                    var $subTotal = $price * $totalTickets;
                    $grandTotal += $subTotal;


                }

                var $seatsSelected = $('.chart__column .js-seat.seat--selected');

                if( $seatsSelected.length === 0 ) {

                    _self.$message = 'Make sure to select all the movie options!';
                    _self.$messageText.text(_self.$message);
                    if(_self.$messageElement.hasClass('is-success')){
                        _self.$messageElement.removeClass('is-success');
                    }
                    _self.$messageElement.addClass('is-visible is-error');

                } else if($grandTotal > 0) {

                    _self.$message = 'Your total is $'+$grandTotal+'.00. Enjoy your film!';
                    _self.$messageText.text(_self.$message);
                    if(_self.$messageElement.hasClass('is-error')){
                        _self.$messageElement.removeClass('is-error');
                    }
                    _self.$messageElement.addClass('is-visible is-success');

                }

            });

        }

    };

})();

$(function() {
    app.init();
});