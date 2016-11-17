/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function(){
   
   function validarFields(nombre, descripcion, precio, categoria, detalles, reviews, size, color){
       if(nombre.length > 1 && nombre.length <=100){
           if(descripcion.length > 1 && descripcion.length <=1000){
               if(precio.length > 0 && precio.length < 10){
                   if($.isNumeric(precio)){
                       if(categoria.length > 1 && categoria.length <= 20){
                            if(detalles.length > 1 && detalles.length <= 500){
                                 if(reviews.length > 1 && reviews.length <= 500){
                                     if(size != "Seleccione una opcion"){
                                         if(color.length > 1 && color.length < 20){                                             
                                             //validar campo de tipo file
                                             var archivos = document.getElementById('archivos').files;
                                             if(archivos.length == 5){
                                                  for(var i=0; i<archivos.length; i++){
                                                     var name = archivos[i].name;
                                                     var ext = name.substring(name.lastIndexOf('.') + 1).toLowerCase();
                                                     if(ext != 'jpg' && ext != "png"){
                                                         alert('Archivo '+name + ' incorrecto, solo imagenes jpg o png...');
                                                         return false;
                                                     }
                                                  }
                                                  return true;
                                             }else{alert("Por favor seleccione 5 archivos de tipo imagen");}                                    
                                             
                                         }else{alert("Escriba un color");}
                                     }else{alert("Seleccione una tamaño");}
                                 }else{alert("Debe escribir un review correcto");}
                            }else{alert("Debe los detalles de forma correcta");}
                       }else{alert("Debe escribir una categoria correcta");}                       
                   }else{alert("Debe ingresar un numero valido")}
               }else{alert("El campo precio se encuentra vacio");}
           }else{alert("Escriba una descripcion correcta");}
       }else{alert("Escriba un nombre correcto");}
       
       return false;
   }
   
   $('#btncrearproducto').click(function(e){
      e.preventDefault();
      var nombre = $('#nombre').val();
      var descripcion = $('#descripcion').val();
      var precio = $('#precio').val();
      var categoria = $('#categoria').val();
      var detalles = $('#detalles').val();
      var reviews = $('#reviews').val();
      var size = $('#size').val();
      var color = $('#color').val();
      
      if(validarFields(nombre, descripcion, precio, categoria, detalles, reviews, size, color)){
          var data = new FormData($('#frm_nuevo')[0]);
          $.ajax({
             url : "crearproducto",
             type : "post",
             data : data,
             contentType: false,
             processData: false,
             success : function(data){
                 alert(data);
             }
          });
      }
      
   });
    
    
});

