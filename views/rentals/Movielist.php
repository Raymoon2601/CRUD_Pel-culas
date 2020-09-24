<main class="container">
	<section class="col-md-12 text-center">
		<div class="mt-3">
			<h1>Películas de la renta</h1>
		</div>

		<section class="col-md-16 flex-nowrap table-responsive">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th class="text-center">Id</th>
						<th class="text-center">Id de la renta</th>
						<th class="text-center">Nombre de la película</th>
						<th class="text-center">Descripción</th>
						<th class="text-center">Usuario</th>
						
					</tr>
				</thead>
				<tbody>
					<?php foreach($movies as $movie): ?>
						<tr>
							<td class="text-center"><?php echo $movie->id ?></td>
							<td class="text-center"><?php echo $movie->rental_id ?></td>
							<td class="text-center"><?php echo $movie->namemovie ?></td>
							<td class="text-center"><?php echo $movie->description ?></td>
							<td class="text-center"><?php echo $movie->nameuser ?></td>

						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</section>
	</section>
</main>