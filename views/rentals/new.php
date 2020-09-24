<main class="container">
	<div class="row">
		<h1 class="col-md-12 d-flex justify-content-center">Nueva renta</h1>
	</div>

	<section class="row mt-3">
		<div class="card w-50 m-auto">
			<div class="card-header container">
				<h2 class="m-auto">Información de la renta</h2>
			</div>

			<div class="card-body w-100">
				<!--<form action="?controller=rental&method=save" method="post">-->
					<div class="form-group">
						<label>Fecha de inicio</label>
						<input id="finicio" type="date" name="start_date" class="form-control" placeholder="">
					</div>
					<div class="form-group">
						<label>Fecha de fin</label>
						<input id="ffin" type="date" name="end_date" class="form-control" placeholder="">
					</div>
					<div class="form-group">
						<label>total</label>
						<input id="total" type="number" name="total" class="form-control" placeholder="">
					</div>
					<div class="form-group">
					<label>Usuarios</label>
                        <select id="IDusuario" class="form-control">
                            <option value="">Seleccione...</option>
                            <?php foreach($users as $user): ?>
                                <option value="<?php echo $user->id ?>"><?php echo $user->name ?></option>
                            <?php endforeach ?>
                        </select>
                        </div>
					<div class="form-group">
					<label>Estado</label>
                        <select id="IDestado" class="form-control">
                            <option value="">Seleccione...</option>
                            <?php foreach($statuses as $status): ?>
                                <option value="<?php echo $status->id ?>"><?php echo $status->name ?></option>
                            <?php endforeach ?>
                        </select>
                        </div>
					<div class="form-group row">
                        <div class="col-md-8">                            
                            <label>Películas</label>
                            <select id="movie" class="form-control">
                                <option value="">Seleccione...</option>
                                <?php foreach($movies as $movie): ?>
                                    <option value="<?php echo $movie->id ?>"><?php echo $movie->name ?></option>
                                <?php endforeach ?>
                            </select>
                        </div>
                        <div class="col-md-4 mt-4">
                            <a href="#" class="btn btn-success" id="addElement">+</a>
                        </div>
                    </div>                    

                    <div id="list-categories" class="form-group"></div>
					<div class="form-group">
						<button class="btn btn-primary" id="save">Guardar</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</main>
<script src="assets/js/Rental.js"></script>