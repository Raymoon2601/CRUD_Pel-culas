
<div class="modal fade" id="editUser<?php echo $rental->id ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Editar Usuario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form action="?controller=Rental&method=update" method="POST">
            <div class="modal-body">
                <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Fecha de inicio</th>
                        <th>Fecha de fin</th>
                        <th>Total</th>
                        <th>Usuario</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($movies as $movie): ?>
                        <tr>
                            <td><?php echo $movie->id ?></td>
                            <td><?php echo $rental->start_date ?></td>
                            <td><?php echo $rental->end_date ?></td>
                            <td><?php echo $rental->total ?></td>
                            <td><?php echo $rental->user_id ?></td>
                            <td><?php echo $rental->status_id ?></td>
                            <td>
                                <a href="?controller=rental&method=edit&id=<?php echo $rental->id?>" class="btn btn-warning" title="Editar Renta">Editar</a>
                                <a href="?controller=rental&method=delete&id=<?php echo $rental->id?>" class="btn btn-danger" title="Eliminar Renta">Eliminar</a>
                            </td>
                        </tr>
                    <?php endforeach ?>
                </tbody>
            </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-primary">Actualizar</button>
            </div>
        </form>
    </div>
  </div>
</div>