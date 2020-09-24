<main class="container">
	<section class="col-md-12 text-center">
		<div class="mt-3">
			<h1>Categorías de la película</h1>
		</div>

		<section class="col-md-16 flex-nowrap table-responsive">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th class="text-center">Id de categoría</th>
						<th class="text-center">Nombre</th>
						<th class="text-center">ID de estado</th>
						<th class="text-center">Estado</th>
						
					</tr>
				</thead>
				<tbody>
					<?php foreach($movies as $movie): ?>
						<tr>
							<td class="text-center"><?php echo $movie->id ?></td>
							<td class="text-center"><?php echo $movie->name ?></td>
							<td class="text-center"><?php echo $movie->status_id ?></td>
							<td class="text-center"><?php echo $movie->estado ?></td>
							

						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</section>
	</section>
</main>