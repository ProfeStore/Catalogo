-- El Profe Store · SQL v8 (tallas 36 a 44 y público: Hombre / Dama)
-- Ejecutar DESPUÉS de supabase-v7.sql. Pégalo completo en Supabase → SQL Editor → Run. Es re-ejecutable.

-- 1) Tallas: ahora de la 36 a la 44
alter table public.productos alter column sizes set default array[36,37,38,39,40,41,42,43,44];
update public.productos
   set sizes = coalesce((select array_agg(s order by s) from unnest(sizes) s where s between 36 and 44), '{}');

-- 2) Hombre o Dama (opcional)
alter table public.productos add column if not exists gender text;
alter table public.productos drop constraint if exists productos_gender_check;
alter table public.productos add constraint productos_gender_check check (gender is null or gender in ('hombre','dama'));
