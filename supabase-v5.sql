-- El Profe Store · SQL v5 (varios videos por producto, uno por color/referencia, guardados en Supabase)
-- Ejecutar DESPUÉS de supabase-v4.sql. Pégalo completo en Supabase → SQL Editor → Run. Es re-ejecutable.

-- 1) Videos por producto: [{"url":"https://...mp4","color_id":3}, ...]  (se muestran después de las fotos)
alter table public.productos add column if not exists videos jsonb not null default '[]'::jsonb;

-- Pasa el video único anterior (video_url) a la nueva lista, sin color asignado
update public.productos
   set videos = jsonb_build_array(jsonb_build_object('url', video_url, 'color_id', null))
 where video_url is not null and videos = '[]'::jsonb;

-- 2) Bucket público para los archivos de video (máx. 50 MB, mp4 / webm / mov)
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('videos', 'videos', true, 52428800, array['video/mp4','video/webm','video/quicktime'])
on conflict (id) do update set file_size_limit = excluded.file_size_limit, allowed_mime_types = excluded.allowed_mime_types;

drop policy if exists "videos subir"  on storage.objects;
drop policy if exists "videos borrar" on storage.objects;
create policy "videos subir"  on storage.objects for insert to anon, authenticated with check (bucket_id = 'videos');
create policy "videos borrar" on storage.objects for delete to anon, authenticated using (bucket_id = 'videos');
