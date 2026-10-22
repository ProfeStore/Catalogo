-- El Profe Store · SQL v7 (etiquetas «Limitado» y «Exclusivo»)
-- Ejecutar DESPUÉS de supabase-v6.sql. Pégalo completo en Supabase → SQL Editor → Run. Es re-ejecutable.

alter table public.productos drop constraint if exists productos_tag_check;
alter table public.productos
  add constraint productos_tag_check check (tag is null or tag in ('new','sale','limited','exclusive'));
