-- --------SQL Queries para la Tienda----------
USE tienda;
SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio , precio * 1.09 AS 'Price in USD'  FROM producto;
SELECT nombre AS 'Product Name', precio AS 'Price in Euros', precio * 1.09 AS 'Price in USD'  FROM producto;
SELECT UPPER(nombre) AS 'Product Name' , precio FROM producto;
SELECT LOWER(nombre) AS 'Product Name' , precio FROM producto;
SELECT nombre, concat(UPPER(SUBSTR(nombre,1,2)), SUBSTR(nombre,3)) AS '2 Letras en Mayuscula' FROM fabricante;
SELECT nombre, round(precio) AS 'price rounded' FROM producto;
SELECT nombre, TRUNCATE(precio, 0) AS 'price truncated' FROM producto;
SELECT f.codigo FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT DISTINCT f.codigo FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT * FROM fabricante ORDER BY nombre;
SELECT * FROM fabricante ORDER BY nombre DESC;
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3, 2;
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT * FROM producto WHERE codigo_fabricante = 2;
SELECT p.nombre, precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre;
SELECT p.codigo AS 'codigo producto', p.nombre, f.codigo AS 'codigo fabricante', f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio LIMIT 1;
SELECT p.nombre, precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio DESC LIMIT 1;
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'lenovo';
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'crucial' AND precio > 200;
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'seagate';
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('asus', 'Hewlett-Packard', 'seagate');
SELECT p.nombre, precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';
SELECT p.nombre, precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';
SELECT p.nombre AS 'product name' , precio, f.nombre AS 'name manufacturer' FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo  WHERE precio >= 180 ORDER BY precio DESC, p.nombre ASC;
SELECT DISTINCT f.codigo, f.nombre from fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT * FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT * FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;
SELECT * FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'lenovo';
SELECT * FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE precio = (SELECT precio FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'lenovo' ORDER BY precio DESC LIMIT 1);
SELECT p.nombre FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'lenovo' ORDER BY precio DESC LIMIT 1;
SELECT p.nombre FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'Hewlett-Packard' ORDER BY precio LIMIT 1;
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE precio >= (SELECT precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'lenovo' ORDER BY precio DESC LIMIT 1);
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'asus' AND precio > (SELECT AVG(precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'asus');





-- ---------SQL Queries para Universidad-------------------
USE universidad;
SELECT DISTINCT apellido1, apellido2, nombre FROM persona LEFT JOIN alumno_se_matricula_asignatura ON id = id_alumno ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT DISTINCT nombre, apellido1, apellido2 FROM persona LEFT JOIN alumno_se_matricula_asignatura ON id = id_alumno WHERE telefono IS NULL;
SELECT DISTINCT * FROM persona LEFT JOIN alumno_se_matricula_asignatura ON id = id_alumno WHERE fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
SELECT * FROM persona JOIN profesor ON id = id_profesor WHERE telefono IS NULL AND nif LIKE '%k';
SELECT * FROM asignatura WHERE id_grado = 7 AND cuatrimestre = 1 AND curso = 3;
SELECT apellido1, apellido2, per.nombre, d.nombre AS 'departamento' FROM persona per JOIN profesor pro ON per.id = pro.id_profesor JOIN departamento d ON pro.id_departamento = d.id ORDER BY apellido1 ASC, nombre ASC;
SELECT a.nombre AS 'Class name', anyo_inicio AS 'Start year' , anyo_fin AS 'Final Year' FROM asignatura a JOIN alumno_se_matricula_asignatura asma ON a.id = id_asignatura JOIN curso_escolar ce ON ce.id = id_curso_escolar JOIN persona per ON per.id = id_alumno WHERE nif = '26902806M';
SELECT  d.nombre AS 'department name', a.nombre AS 'subject name', g.nombre AS 'degree name' FROM departamento d JOIN profesor p ON d.id = id_departamento JOIN asignatura a ON p.id_profesor = a.id_profesor JOIN grado g ON id_grado = g.id;
SELECT DISTINCT p.* FROM persona p JOIN alumno_se_matricula_asignatura asma ON p.id = id_alumno JOIN curso_escolar ce ON ce.id = id_curso_escolar WHERE anyo_inicio BETWEEN 2018 AND 2019;
SELECT d.nombre AS 'department name' , apellido1, apellido2, p.nombre AS 'first name' FROM persona p JOIN profesor ON p.id = id_profesor LEFT JOIN departamento d ON d.id = id_departamento ORDER BY d.nombre ASC, apellido1 ASC, p.nombre ASC;
SELECT * FROM persona p RIGHT JOIN profesor ON p.id = id_profesor JOIN departamento d ON d.id = id_departamento WHERE id_departamento IS NULL;
SELECT id, nombre AS 'Department name' FROM departamento LEFT JOIN profesor ON id = id_departamento WHERE id_profesor IS NULL;
SELECT * FROM persona p JOIN profesor pro ON p.id = id_profesor LEFT JOIN asignatura a ON pro.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;
SELECT a.* FROM asignatura a LEFT JOIN profesor pro ON pro.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;
SELECT DISTINCT d.* FROM departamento d LEFT JOIN profesor pro ON d.id = id_departamento LEFT JOIN asignatura a ON a.id_profesor = pro.id_profesor WHERE cuatrimestre IS NULL;
SELECT COUNT(distinct p.id) AS 'Total students' FROM persona p JOIN alumno_se_matricula_asignatura ON p.id = id_alumno;
SELECT COUNT(distinct p.id) AS 'Total students born in 1999' FROM persona p JOIN alumno_se_matricula_asignatura ON p.id = id_alumno WHERE fecha_nacimiento between'1999-01-01' AND '1999-12-31';
SELECT nombre AS 'department name', COUNT(distinct id_profesor) AS 'Number of teachers' FROM profesor p JOIN departamento ON id = id_departamento GROUP BY nombre ORDER BY COUNT(distinct id_profesor) DESC;
SELECT nombre AS 'department name', COUNT(distinct id_profesor) AS 'Number of teachers' FROM profesor p RIGHT JOIN departamento ON id = id_departamento GROUP BY nombre ORDER BY COUNT(distinct id_profesor) DESC;
SELECT g.nombre, COUNT(a.nombre) AS 'Number of subjects' FROM grado g LEFT JOIN asignatura a ON g.id = id_grado GROUP BY g.nombre ORDER BY COUNT(distinct a.nombre) DESC;
SELECT g.nombre, COUNT(a.nombre) AS 'Number of subjects' FROM grado g LEFT JOIN asignatura a ON g.id = id_grado GROUP BY g.nombre HAVING COUNT(a.nombre) > 40 ORDER BY COUNT(distinct a.nombre) DESC;
SELECT g.nombre, tipo, COUNT(tipo) AS 'total of subject type' FROM grado g LEFT JOIN asignatura a ON g.id = id_grado GROUP BY g.nombre, a.tipo;
SELECT DISTINCT anyo_inicio, COUNT(DISTINCT id_alumno) AS 'total students enrolled' FROM curso_escolar LEFT JOIN alumno_se_matricula_asignatura ON id = id_curso_escolar GROUP BY anyo_inicio;
SELECT DISTINCT p.id, p.nombre, apellido1, apellido2, COUNT(a.id) AS 'subject total' FROM persona p JOIN profesor pro ON p.id = id_profesor LEFT JOIN asignatura a ON pro.id_profesor = a.id_profesor GROUP BY p.id, a.id ORDER BY COUNT(a.id) DESC;
SELECT * FROM persona p JOIN alumno_se_matricula_asignatura asma ON p.id = id_alumno JOIN curso_escolar ce ON ce.id = id_curso_escolar JOIN asignatura a ON a.id = id_asignatura ORDER BY DATE(fecha_nacimiento) DESC LIMIT 3;
SELECT p.*, d.*, a.nombre AS 'subject name' FROM departamento d JOIN profesor pro ON d.id = id_departamento LEFT JOIN asignatura a ON a.id_profesor = pro.id_profesor JOIN persona p ON p.id = pro.id_profesor WHERE a.nombre IS NULL;
