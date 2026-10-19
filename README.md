# El Profe Store · Catálogo

- `index.html` – tienda pública (lee productos de Supabase; si falla usa respaldo local).
- `admin.html` – panel para agregar, editar, eliminar, ocultar y marcar "de temporada" (login con Supabase Auth).
- `supabase.sql` – tablas, políticas RLS, bucket de fotos y datos iniciales.

## Puesta en marcha
1. Supabase → SQL Editor → pegar y ejecutar `supabase.sql`.
2. Authentication → Users → *Add user* con el correo que está en la tabla `admins` (y desactivar "Allow new users to sign up").
3. Publicar el repo con GitHub Pages (Settings → Pages → rama principal). Admin en `/admin.html`.

Solo la clave `anon` va en el código; las escrituras las protege RLS. Nunca pongas la `service_role` en estos archivos.
