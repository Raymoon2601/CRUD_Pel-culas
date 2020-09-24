// Variable global para almancenar el listado de las Películas seleccionadas
var arrayMovies = []


$("#addElement").click(function(e) {
	//Deshabilitar el envio por HTTP
	e.preventDefault()

	let idmovie 		= $("#movie").val()
	let namemovie 	= $("#movie option:selected").text()

	
	if (idmovie != '') {

		if(typeof existmovie(idmovie) === 'undefined') {

			arrayMovies.push({
				'id'  :  idmovie,
				'name':  namemovie
			})
		} else {
			alert("La Película ya se Encuentra Seleccionada")
		}

		showCategories()

	} else {
		alert("Debe Seleccionar una Película ")
	}

	console.log(arrayMovies)

})


function existmovie(idmovie) {	
	
	let existmovie = arrayMovies.find(function (movie) {
		return movie.id == idmovie
	})
	return existmovie

}

function showCategories() {
	$("#list-categories").empty()

	arrayMovies.forEach(function (movie) {
		$("#list-categories").append('<div class="form-group"><button class="btn btn-danger" onclick="removeElement('+movie.id+')">X</button><span>'+movie.name+'</span></div>')
	})
}

function removeElement(idmovie) {
	let index = arrayMovies.indexOf(existmovie(idmovie))
	arrayMovies.splice(index, 1)
	showCategories()
}

//Metodo de envio del formulario
$("#save").click(function (e) {
	e.preventDefault()

	let url 	= "?controller=Rental&method=save"
	let params 	= {
		fechaInicio: 	$("#finicio").val(),
		fechaFin: 		$("#ffin").val(),  
		total: 			$("#total").val(),
		user_id: 		$("#IDusuario").val(),  
		status_id: 		$("#IDestado").val(),    
		movies:		arrayMovies  
	}

	//metodo ajax de tipo post para realizar el envio del formulario a PHP (Backend)
	$.post(url, params, function (response) {
		//validar la respuesta del request
		if(typeof response.error !== 'undefined') {
			alert(response.message)
		} else {
			alert("Inserción Satisfactoria")
			location.href = '?controller=Rental'
		}
	}, 'json').fail(function (error) {
		console.log(error)
		alert("Inserción Fallida ("+error.responseText+")")
	})
})