<main class="container">
	<div class="row">
		<h1 class="col-md-12 d-flex justify-content-center">Nuevo Rol</h1>
	</div>

	<section class="row mt-3">
		<div class="card w-50 m-auto">
			<div class="card-header container">
				<h2 class="m-auto">Información del Rol</h2>
			</div>

			<div class="card-body w-100">
				<form action="?controller=rol&method=update" method="post">
					<input type="hidden" name="id" value="<?php echo $roles[0]->id ?>">
					<div class="form-group">
						<label>Nombre</label>
						<input type="text" name="name" class="form-control" placeholder="Ej. Empleado" value="<?php echo $roles[0]->name ?>">
					</div>
					<div class="form-group">
						<label>Tipo de estado</label>
						<input type="text" name="status_id" class="form-control" placeholder="1, 2, 3" value="<?php echo $roles[0]->status_id ?>">
					</div>
					<div class="form-group">
						<button class="btn btn-primary">Guardar</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</main>