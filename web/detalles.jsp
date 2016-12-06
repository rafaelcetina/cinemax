<%-- 
    Document   : detalles
    Created on : 24/11/2016, 12:38:08 PM
    Author     : GERENTE COMERCIAL
--%>
<%@page import="Modelo.ModeloPeliculas"%>
<%@page import="include.Pelicula"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Pelicula pr = new ModeloPeliculas().getPelicula(id);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de Pelicula :: Cine Max</title>
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/detalles.css">
        <style>
            .movie-background--martian {
                background: url("SVerImagen?id=<%=id%>") no-repeat;
                background-position: top center;
                background-size: cover;
            }
        </style>
    </head>
    
    <body>
        <article class="cinema-app">
            
	<div class="movie movie--martian">
                <button class="btn">
                    <a href="index.jsp">
                    Regresar a cartelera
                    </a>
                </button>
		<div class="movie-background movie-background--martian">

			<div class="angled-overlay-big"></div>
			<!-- /.angled-overlay--big -->

			<div class="angled-overlay-medium"></div>
			<!-- /.angled-overlay--medium -->

			<div class="movie-actions">

				<div class="movie-actions__cart  js-slide-up"></div>
				<!-- /.movie-actions__cart -->

				<div class="movie-actions__rating">
					<span class="number">9.1</span>
				</div>
				<!-- /.movie-actions__rating -->

			</div>
			<!-- /.movie-actions -->

			<div class="movie-description">

                            <h1 class="movie-description__title">
                                <% if(pr.getTitulo().length() >= 23 ){
                                    out.print(pr.getTitulo().substring(0, 23)+"...");
                                }else{
                                    out.print(pr.getTitulo());
                                }
                                %>
                            </h1>
				<!-- /.movie-description__title -->

				<p class="movie-description__copy">
                                        <% if(pr.getDescripcion().length() >= 170 ){ %>
					<%=pr.getDescripcion().substring(0, 170)%>...
                                        <% }else{ %>
                                        <% out.print(pr.getDescripcion()); }%>
				</p>
				<!-- /.movie-description__copy -->

			</div>
			<!-- /.movie-description -->

			<span class="arrow arrow--down js-slide-up"></span>

		</div>
		<!-- /.movie-background .movie-background--martian -->

		<div class="seating is-hidden">

			<div class="message is-error">
				<p class="message__text"></p>
				<!-- /.error-message__text -->
			</div>

			<div class="arrow arrow--up js-slide-up"></div>
			<!-- /.arrow arrow--up -->

			<div class="seating--wrap">

				<nav class="movie-options">

					<ul class="movie-options-list">

						<li class="movie-options-list__item movie-options-list__item--has-children js-top-level">

							<input type="checkbox" class="movie-options__checkbox" name="movie-options-group-1">
							<label class="movie-options-list__label js-label" for="movie-options-group-1">Tipo de Sala</label>

							<ul class="movie-options-sub-list">

								<input type="text" class="movie-type h-hidden" />

								<li class="movie-options-sub-list__item js-option">IMAX</li>
								<!-- /.movie-options-sub-list__item js-option -->
								<li class="movie-options-sub-list__item js-option">IMAX 3D</li>
								<!-- /.movie-options-sub-list__item js-option -->
								<li class="movie-options-sub-list__item js-option">3D</li>
								<!-- /.movie-options-sub-list__item js-option -->
								<li class="movie-options-sub-list__item js-option">Standard</li>
								<!-- /.movie-options-sub-list__item js-option -->

							</ul>
							<!-- movie-options-sub-list -->

						</li>
						<!-- movie-options-list__item movie-options-list__item--has-children js-top-level -->

						<li class="movie-options-list__item movie-options-list__item--has-children js-top-level">

							<input type="checkbox" class="movie-options__checkbox" name="movie-options-group-1">
							<label class="movie-options-list__label movie-options-list__label--time js-label" for="movie-options-group-1">Horario</label>

							<ul class="movie-options-sub-list">

								<li class="movie-options-sub-list__item movie-options-sub-list__item--ticket js-option">

									<span class="movie-options-sub-list__showtime movie-options-sub-list__ticket">
                                        <span class="movie-options-sub-list__time">12:25pm</span>
									</span>

								</li>
								<!-- /.movie-options-sub-list__item -->

								<li class="movie-options-sub-list__item movie-options-sub-list__item--ticket js-option">

									<span class="movie-options-sub-list__showtime movie-options-sub-list__ticket">
                                        <span class="movie-options-sub-list__time">1:40pm</span>
									</span>

								</li>
								<!-- /.movie-options-sub-list__item -->

								<li class="movie-options-sub-list__item movie-options-sub-list__item--ticket js-option">

									<span class="movie-options-sub-list__showtime movie-options-sub-list__ticket">
                                        <span class="movie-options-sub-list__time">4:40pm</span>
									</span>

								</li>
								<!-- /.movie-options-sub-list__item -->

								<li class="movie-options-sub-list__item movie-options-sub-list__item--ticket js-option">

									<span class="movie-options-sub-list__showtime movie-options-sub-list__ticket">
                                        <span class="movie-options-sub-list__time">7:40pm</span>
									</span>

								</li>
								<!-- /.movie-options-sub-list__item -->

								<li class="movie-options-sub-list__item movie-options-sub-list__item--ticket js-option">

									<span class="movie-options-sub-list__showtime movie-options-sub-list__ticket">
                                        <span class="movie-options-sub-list__time">10:25pm</span>
									</span>

								</li>
								<!-- /.movie-options-sub-list__item -->

							</ul>
							<!-- movie-options-sub-list -->

						</li>
						<!-- movie-options-list__item movie-options-list__item--has-children js-top-level -->

						<li class="movie-options-list__item movie-options-list__item--has-children js-top-level">

							<input type="checkbox" class="movie-options__checkbox" name="movie-options-group-3">
							<label class="movie-options-list__label js-label" for="movie-options-group-3">Número de entradas</label>

							<ul class="movie-options-sub-list movie-options-sub-list--select">

								<li class="movie-options-sub-list__item">

									<label for="adult" class="quantity__label">Adulto</label>

									<select class="quantity" name="adult">

                                        <option value="0">0</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>

                                    </select>

									<span class="operator">&times;</span>

									<span class="quantity__amount">&dollar;60.00</span>

									<span class="operator">&equals;</span>

									<span class="quantity__total">&dollar;0.00</span>

								</li>
								<!-- /.movie-options-sub-list__item -->

								<li class="movie-options-sub-list__item">

									<label for="adult" class="quantity__label">Adulto Mayor</label>

									<select class="quantity" name="senior">

                                        <option value="0">0</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>

                                    </select>

									<span class="operator">&times;</span>

									<span class="quantity__amount">&dollar;40.00</span>

									<span class="operator">&equals;</span>

									<span class="quantity__total">&dollar;0.00</span>

								</li>
								<!-- /.movie-options-sub-list__item -->

								<li class="movie-options-sub-list__item">

									<label for="adult" class="quantity__label">Infante</label>

									<select class="quantity" name="child">

                                        <option value="0">0</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>

                                    </select>

									<span class="operator">&times;</span>

									<span class="quantity__amount">&dollar;20.00</span>

									<span class="operator">&equals;</span>

									<span class="quantity__total">&dollar;0.00</span>

								</li>
								<!-- /.movie-options-sub-list__item -->

							</ul>
							<!-- movie-options-sub-list -->

						</li>
						<!-- movie-options-list__item movie-options-list__item--has-children js-top-level -->

					</ul>
					<!-- /.movie-options-list -->

				</nav>
				<!-- /.movie-options -->

				<div class="seating-chart">

					<div class="seating-chart--wrap">

						<div class="legend">

							<div class="legend__available">

								<span class="seat seat--available"></span>
								<span class="legend__text">Disponible</span>

							</div>
							<!-- /.legend__available -->

							<div class="legend__taken">

								<span class="seat seat--taken"></span>
								<span class="legend__text">Ocupado</span>

							</div>
							<!-- /.legend__taken -->

						</div>
						<!-- /.legend -->

						<div class="chart">

							<div class="chart__column chart__column--2rows chart__column--outside chart__column--outside-left" data-column="1">

								<div class="seat seat--available chart__seat js-seat" data-id="A-1"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="A-2"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="A-3"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="A-4"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="A-5"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="A-6"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="A-7"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="A-8"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="A-9"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="A-10"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="A-11"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="A-12"></div>


							</div>

							<div class="chart__column chart__column--3rows chart__column--middle" data-column="2">

								<div class="seat seat--available chart__seat js-seat" data-id="B-1"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-2"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-3"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-4"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-5"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-6"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-7"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-8"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-9"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-10"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-11"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-12"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-13"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-14"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-15"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-16"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-17"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-18"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-19"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-20"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="B-21"></div>
								<!-- /.seat seat--available chart__seat js-seat -->

							</div>
							<!-- /.chart__column chart__column--3rows chart__column--middle -->

							<div class="chart__column chart__column--2rows chart__column--outside chart__column--outside-right" data-column="3">

								<div class="seat seat--available chart__seat js-seat" data-id="C-1"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="C-2"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="C-3"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="C-4"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="C-5"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="C-6"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="C-7"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="C-8"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="C-9"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="C-10"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="C-11"></div>
								<!-- /.seat seat--available chart__seat js-seat -->
								<div class="seat seat--available chart__seat js-seat" data-id="C-12"></div>


							</div>
							<!-- /.chart__column chart__column--2rows chart__column--outside -->

						</div>
						<!-- /.chart -->

					</div>
					<!-- /.seating-chart--wrap -->

				</div>
				<!-- /.seating-chart -->

			</div>
			<!-- /.seating--wrap -->

			<div class="checkout">

				<div class="checkout--wrap">

					<span class="checkout__text">Total</span>
					<span class="js-grand-total checkout__text checkout__text--color-white">$0.00</span>
					<span class="checkout__button">Pagar</span>

				</div>
				<!-- /.checkout--wrap -->

			</div>
			<!-- /.checkout -->

		</div>
		<!-- /.seating -->

        </div>
	<!-- /.movie -->

    </article>
    <form action="tickets.jsp" method="post">
        <input type="hidden" value="<%=pr.getTitulo()%>" name="titulo">
        <input type="hidden" name="persona" id="persona">
        <input type="hidden" name="asientos"  id="asientos">
        <input type="hidden" name="ntickets" id="ntickets">
        <input type="hidden" name="horario" id="horario">
        <input type="submit" id="btnTickets" style="display: none">
    </form>
<!-- /.cinema-app -->
    </body>
    <script src="js/jquery.min.js"></script>
    <script src="js/detalles.js"></script>
</html>
