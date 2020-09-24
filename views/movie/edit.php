<main class="container">
	<div class="row">
		<h1 class="col-md-12 d-flex justify-content-center">Nueva película</h1>
	</div>

	<section class="row mt-3">
		<div class="card w-50 m-auto">
			<div class="card-header container">
				<h2 class="m-auto">Información de la película</h2>
			</div>

			<div class="card-body w-100">
				<form action="?controller=movie&method=update" method="post">
					<div class="form-group">
						<input type="hidden" name="id" value="<?php echo $movie[0]->id ?>">
						<label>Nombre</label>
						<input type="text" name="name" class="form-control" placeholder="Harry Potter" value="<?php echo $movie[0]->name ?>">
					</div>
					<div class="form-group">
						<label>Descripción</label>
						<input type="text" name="description" class="form-control" placeholder="" value="<?php echo $movie[0]->description ?>">
					</div>
					<div class="form-group">
						<label>ID Usuario</label>
						<input type="text" name="user_id" class="form-control" placeholder="Ej. 1" value="<?php echo $movie[0]->user_id ?>">
					</div>
					<div class="form-group">
						<label>ID estado</label>
						<input type="text" name="status_id" class="form-control" placeholder="Ej. 1" value="<?php echo $movie[0]->status_id ?>">
					</div>
					<div class="form-group">
						<button class="btn btn-primary">Guardar</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</main>