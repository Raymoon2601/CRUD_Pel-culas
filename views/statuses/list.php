<main class="container">
	<section class="col-md-12 text-center">
		<div class="mt-3">
			<h1>Gestión de Estados</h1>
		</div>

		<div class="col-md-12 m-4 d-flex justify-content-between">
			<h2>Lista de estados</h2>
			<a href="?controller=status&method=add" class="btn btn-primary">Agregar</a>
		</div>

		<section class="col-md-12 flex-nowrap table-responsive">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Id</th>
						<th>Nombres</th>
						<th>Tipo de status</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach($statuses as $status): ?>
						<tr>
							<td><?php echo $status->id ?></td>
							<td><?php echo $status->name ?></td>
							<td><?php echo $status->type ?></td>
							<td>
								<a href="?controller=status&method=edit&id=<?php echo $status->id?>" class="btn btn-warning" title="Editar estado">Editar</a>
								<a href="?controller=status&method=delete&id=<?php echo $status->id?>" class="btn btn-danger" title="Eliminar estado">Eliminar</a>
							</td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</section>
	</section>
</main>
