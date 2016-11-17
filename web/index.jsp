<%@page import="Controlador.ControladorPeliculas"%>
<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta charset="UTF-8">
    <title>CineMAX</title>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="window-margin">
	<div class="window">
            <aside class="sidebar">
                <div class="top-bar">
                    <p class="logo">CineMAX <i class="fa fa-film"></i></p>
                </div>

                <div class="search-box">
                    <input type="text" placeholder="Buscar..."/>
                    <p class="fa fa-search"></p>
                </div>

                <menu class="menu">
                        <p class="menu-name">Trailers de peliculas</p>
                        <ul>
                            <li class="active">
                                    <a href="#">Acción / Aventura</a>
                                <ul>
                                    <li><a href="#">Últimos</a></li>
                                    <li class="active"><a href="#">Popular</a></li>
                                    <li><a href="#">Proximamente</a></li>
                                    <li><a href="#">Recomendadas</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Animación</a></li>
                            <li><a href="#">Comedia</a></li>
                            <li><a href="#">Documentales</a></li>
                            <li><a href="#">Drama</a></li>
                            <li><a href="#">Horror</a></li>
                            <li><a href="#">Sci-Fi  / Fantasia</a></li>
                            <li><a href="#">Lista A-Z</a></li>
                        </ul>

                        <div class="separator"></div>

                        <ul class="no-bullets">
                            <li><a href="#">Últimas noticas</a></li>
                            <li><a href="#">Reseñas</a></li>
                            <li><a href="#">Top 10</a></li>
                        </ul>

                        <div class="separator"></div>
                </menu>
            </aside>


            <div class="main" role="main">

                <div class="top-bar">

                    <div class="profile-box">
                        <div class="circle"></div>
                        <span class="arrow fa fa-angle-down"></span>
                    </div>

                    <ul class="top-menu">
                        <li class="menu-icon trigger-sidebar-toggle">
                            <div class="line"></div>
                            <div class="line"></div>
                            <div class="line"></div>
                        </li>
                        <li><a href="#">Peliculas</a></li>
                        <li><a href="#">Reservaciones</a></li>
                        <li class="active"><a href="#">Cartelera</a></li>
                        <li><a href="#">Usuarios Top</a></li>
                        <li><a href="#">Tiendita</a></li>
                        <li><a href="administracion.jsp">Iniciar Sesión</a></li>
                    </ul>

                </div> <!-- top bar -->


                <div class="featured-movie">
                    <img class="cover" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/22043/backdrop_ggwxvq_1.jpg" alt="" class="cover" />
                    <p class="corner-title">Recomendación</p>

                    <div class="bottom-bar">
                        <div class="title-container">
                            <span class="fa fa-play-circle"></span>
                            <b>Sin escalas</b> Trailer #1
                        </div>

                        <div class="right">
                            <div class="stars">
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star-half-o"></span>
                                <span class="fa fa-star-o"></span>
                            </div>
                            <div class="share">
                                <icon class="fa fa-share-square"></icon> Compartir
                            </div>
                        </div> <!-- right -->
                    </div> <!-- bottom bar -->
                </div> <!-- featured -->


                <div class="movie-list">
                    <div class="title-bar">
                        <div class="left">
                            <p class="bold">Trailers populares</p>
                            <p class="grey">Acción / Aventura</p>
                        </div> <!-- left -->
                        <div class="right">
                            <a class="blue" href="#">Valoradas <i class="fa fa-angle-down"></i></a>
                            <a href="#">Últimas</a>
                            <a href="#">Anteriores</a>
                        </div> <!-- right -->
                    </div> <!-- title-bar -->

                    <ul class="list">
                        <%ControladorPeliculas cp = new ControladorPeliculas();%>
                        <%= cp.getViewPeliculas()%> 
                    </ul>

                    <a href="#" class="load-more">Mostrar más peliculas <span class="fa fa-plus"></span></a>

                </div> <!-- movie list -->

            </div> <!-- main -->

        </div> <!-- window -->
    </div> <!-- window margin -->
    </body>
    <script src="js/jquery.min.js"></script>
    <script src="js/script.js"></script>
</html>

