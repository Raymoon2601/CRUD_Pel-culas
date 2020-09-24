<main class="container">
	<section class="col-md-12 text-center">
		<div class="mt-3">
			<h1>Tipos de estado</h1>
		</div>

		<div class="col-md-12 m-4 d-flex justify-content-between">
			<h2>Lista de tipos de Estado</h2>
			<a href="?controller=typestatus&method=add" class="btn btn-primary">Agregar</a>
		</div>

		<section class="col-md-12 flex-nowrap table-responsive">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Id</th>
						<th>Nombres</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach($typeSt as $tstatus): ?>
						<tr>
							<td><?php echo $tstatus->id ?></td>
							<td><?php echo $tstatus->name ?></td>
							<td>
								<a href="?controller=TypeStatus&method=edit&id=<?php echo $tstatus->id?>" class="btn btn-warning" title="Editar tipo de estado">Editar</a>
								<a href="?controller=TypeStatus&method=delete&id=<?php echo $tstatus->id?>" class="btn btn-danger" title="Eliminar tipo de estado">Eliminar</a>
							</td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</section>
	</section>
</main>