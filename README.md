# El Profe Store · Catálogo

- `index.html` – tienda pública (lee productos de Supabase; si falla usa respaldo local).
- `admin.html` – panel sin contraseña: agrega, edita, elimina, oculta y marca "de temporada"; sube fotos a `images/` en GitHub.
- `supabase.sql` – tablas, políticas RLS, bucket de fotos y datos iniciales.

## Puesta en marcha
1. Supabase → SQL Editor → pegar y ejecutar `supabase.sql`.
2. Abrir `admin.html` (sin contraseña). Primera vez: botón «Token GitHub» y pegar un token con permiso Contents read/write sobre este repo (queda solo en ese navegador).
3. Publicar el repo con GitHub Pages (Settings → Pages → rama principal). Admin en `/admin.html`.

Las fotos se guardan en `images/` (GitHub) y los datos en Supabase. La clave `anon` permite leer y escribir `productos`: quien tenga el link de admin puede editar el catálogo. La `service_role` nunca va en estos archivos.
