-- El Profe Store · SQL v9 (opción «Hombre y Dama»)
-- Ejecutar DESPUÉS de supabase-v8.sql. Pégalo completo en Supabase → SQL Editor → Run. Es re-ejecutable.

alter table public.productos drop constraint if exists productos_gender_check;
alter table public.productos add constraint productos_gender_check check (gender is null or gender in ('hombre','dama','ambos'));
