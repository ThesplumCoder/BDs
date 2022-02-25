--PUNTO 3, TALLER 1.

-- Insertar tres maestros zapateros, 2 ayudantes y 2 cortadores
-- en base de datos.
    insert into huellitas.login values (1, 'Andres', 'Andres1');
    insert into huellitas.login values (2, 'Felipe', 'Felipe2');
    insert into huellitas.login values (3, 'Jesus', 'Jesus3');
    insert into huellitas.login values (4, 'Maria', 'Maria4');
    insert into huellitas.login values (5, 'Alejandra', 'Alejandra5');
    insert into huellitas.login values (6, 'Paola', 'Paola6');
    insert into huellitas.login values (7, 'Jose', 'Jose7');

    insert into huellitas.empleado 
    values (1, 1, 'Andres', 'Parra', '11111', '1000', 'C.C.', '11111', 'casa1', '20000101', 'andres@mail');
    insert into huellitas.empleado 
    values (2, 2, 'Felipe', 'Alfaro', '22222', '1000', 'C.C.', '22222', 'casa2', '20000101', 'felipe@mail');
    insert into huellitas.empleado 
    values (3, 3, 'Jesus', 'Martinez', '33333', '1000', 'C.C.', '33333', 'casa3', '20000101', 'jesus@mail');
    insert into huellitas.empleado 
    values (4, 4, 'Maria', 'Gutierrez', '44444', '1000', 'C.C.', '44444', 'casa4', '20000101', 'maria@mail');
    insert into huellitas.empleado 
    values (5, 5, 'Alejandra', 'Simmer', '55555', '1000', 'C.C.', '55555', 'casa5', '20000101', 'alejandra@mail');
    insert into huellitas.empleado 
    values (6, 6, 'Paola', 'Pardo', '66666', '1000', 'C.C.', '66666', 'casa6', '20000101', 'paola@mail');
    insert into huellitas.empleado 
    values (7, 7, 'Jose', 'Pinto', '77777', '1000', 'C.C.', '77777', 'casa7', '20000101', 'jose@mail');

    -- Maestros zapateros.
    insert into huellitas.maestrozapatero values (1, 1, 1, 'Bueno');
    insert into huellitas.maestrozapatero values (2, 2, 2, 'Veloz');
    insert into huellitas.maestrozapatero values (3, 3, 3, 'Barato');
    -- Ayudantes.
    insert into huellitas.ayudante values (4, 4, 'Respetuoso');
    insert into huellitas.ayudante values (5, 5, 'Diligente');
    -- Cortadores.
    insert into huellitas.cortador values (6, 6, 'Preciso');
    insert into huellitas.cortador values (7, 7, 'Productivo');

-- Insertar un nuevo disenio de un zapato.
    insert into huellitas.material values (1, 'Cuero', 'Original');
    insert into huellitas.trozo values (1, 1, 1);
    insert into huellitas.suela values (1, 'Planta baja', 'Hecho por H');
    insert into huellitas.dise�ozapato values (1, 1, 1, 1, 'Escence', 10, 5, 0);

-- Insertar un nuevo lote de 10 zapatos generados a partir de este disenio y con
-- los empleados ya creados.
    insert into huellitas.lotezapatoproduccion values (1, 10, '20220202');
    insert into huellitas.zapato (id, idlotezapatoproduccion, idmaestro, iddise�o)
    select generate_series(1, 10) as id, 1 as id2, 3, 1 as design;

-- Modificar el rol de un empleado de ayudante a maestro zapatero.
    insert into huellitas.maestrozapatero(id, idempleado, idmaestro, descripcion)
    select a.id as id, a.id as idempleado, 3 as idmaestro, a.descripcion
    from huellitas.ayudante a
    where a.id = 5;
    delete from huellitas.ayudante where id = 5;

-- Actualizar un disenio de un zapato agregando un accesorio nuevo.
    insert into huellitas.accesorio values (1, 'Cadenita', 'Joyer�a, oro puro.');
    update huellitas.dise�ozapato set numeroaccesorios = 1 where nombre = 'Escence';

-- Actualizar un disenio de un zapato agregando un trozo de un
-- material diferente.
    update huellitas.diseñozapato 
    set idtrozo = 4;

-- Eliminar un zapato de un lote.
    delete from huellitas.zapato 
    where idlotezapatoproduccion =  1: 'Id especificado en tipo INT para eliminarlo del lote en especifico'

-- Eliminar un disenio de zapatos en base de datos que ya 
-- tenga un lote de 10 zapatos generados.  
    delete from huellitas.diseñozapato 
    join huellitas.lotezapatoproduccion 
    where zapatosproducidos = 10 and id = 5; 'Se elimina el zapato con el id indicado y con la condicion de que se haya producido 10 unidades en el lote.'

-- Insertar un nuevo accesorio en base de datos y luego
-- insertar un disenio que use este accesorio.
    insert into huellitas.accesorio values(4,'Pelos de lagarto','exotica piel de reptil');
    insert into huellitas.diseñozapato values (1,20,45,102,'air jordan 1 retro', (5,12), 2, 1, 4);


-- PUNTO 4, TALLER 1.

-- Realizar una consulta que permita conocer en que zapatos
-- fue usado determinado molde.
    select (*) from huellitas.zapato z 
    join huellitas.materialmolde m 
    where m='se especifica el material y/o molde';

-- Realizar una consulta que me permita conocer que lotes de
-- material fueron usados en la construccion de un zapato.
    select count	(*)from huellitas.lote l , huellitas.loteaccesorio l2 ,huellitas.loteayudante l3 ,huellitas.lotematerial l4 ,huellitas.lotemolde l5 ,huellitas.lotesuela l6 ,huellitas.lotezapatoproduccion l7
    join huellitas.zapato z 
    where l,l2,l3,l4,l5,l6,l7 >=1; 'solo saldrán los lotes que han sido utilizados con valor de o más'
    and z=id	'id del zapato proporcionado';

-- Realizar una consulta que permita conocer cuantos zapatos se
-- crearon para un disenio determinado.
    select count (*) from huellitas.diseñozapato d , huellitas.zapato z 
    where z.id = d.id ;
