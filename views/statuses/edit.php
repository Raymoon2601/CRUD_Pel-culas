<main class="container">
	<div class="row">
		<h1 class="col-md-12 d-flex justify-content-center">Editar Estado</h1>
	</div>

	<section class="row mt-3">
		<div class="card w-50 m-auto">
			<div class="card-header container">
				<h2 class="m-auto">Información del Estado</h2>
			</div>

			<div class="card-body w-100">
				<form action="?controller=status&method=update" method="post">
					<input type="hidden" name="id" value="<?php echo $data[0]->id ?>">
					<div class="form-group">
						<label>Nombre</label>
						<input type="text" name="name" class="form-control" placeholder="Ej. Pedro Perez" value="<?php echo $data[0]->name ?>">
					</div>
					<div class="form-group">
                        <label>Tipo de estado</label>
                        <select name="type_status_id" class="form-control">
                            <option value="">Seleccione...</option>
                             <?php 
                            	foreach($types as $type) {
                            		if($type->id === $data[0]->type_status_id) {
                            ?>
                                		<option selected value="<?php echo $type->id ?>"><?php echo $type->name ?></option>
                            <?php
                            		} else {
                            ?>
                                		<option value="<?php echo $type->id ?>"><?php echo $type->name ?></option>
                            <?php
                            		}
                            	} 
                            ?>
                        </select>
                        
                    </div>
					<div class="form-group">
						<button class="btn btn-primary">Guardar</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</main>