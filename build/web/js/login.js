/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function(){
   $('tr #btn-eliminar').click(function(e){
      e.preventDefault();
      var opcion = confirm("¿Desea Eliminar la pelicula?");
      
      if(opcion){
           var fila = $(this).parent().parent();           
           var idpelicula  = fila.find('#id_pelicula').text();
           
           var data = {idPelicula:idpelicula};
           $.post("deletePelicula", data, function(res, est, jqXHR){
               
               fila.remove();
           });
      }    
   });
   
   $.ajaxSetup({
        beforeSend: showLoading,
        complete: hideLoading
       });
   
   $('#formLogin').submit(function(e){
       e.preventDefault();
       $(".info").html("");
       var data = $(this).serialize();       
       
       $.post("iniciar.jsp", data, function(res, est, jqXHR){
           //alert(res);
           $(".info").html(res);
           
       });
   });
   
   $('#formRegistrar').submit(function(e){
       e.preventDefault();
       $(".info").html("");
       var data = $(this).serialize();       
       
       $.post("registrar.jsp", data, function(res, est, jqXHR){
           //alert(res);
           $(".info").html(res);
           
       });
   });
   
   function showLoading(){
       $(".loading").show();
       $("#btnSubmitLogin").hide();
   }
   
   function hideLoading(){
       $(".loading").hide();
       $("#btnSubmitLogin").show();
   }
   
   
});
