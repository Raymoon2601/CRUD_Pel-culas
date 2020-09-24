<main class="container">
	<div class="row">
		<h1 class="col-md-12 d-flex justify-content-center">Nuevo tipo de status</h1>
	</div>

	<section class="row mt-3">
		<div class="card w-50 m-auto">
			<div class="card-header container">
				<h2 class="m-auto">Información del tipo de status</h2>
			</div>

			<div class="card-body w-100">
				<form action="?controller=typestatus&method=save" method="post">
					<div class="form-group">
						<label>Nombre del tipo de status</label>
						<input type="text" name="name" class="form-control" placeholder="Ej. General">
					</div>
					<div class="form-group">
						<button class="btn btn-primary">Guardar</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</main>