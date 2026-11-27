-- Pega esto en Supabase > SQL Editor > Run
create table public.reservaciones (
  id bigint generated always as identity primary key,
  nombre text not null,
  correo text not null,
  telefono text,
  comentarios text,
  created_at timestamptz default now()
);

alter table public.reservaciones enable row level security;

-- La página solo puede INSERTAR datos; nadie puede leerlos desde el sitio público
create policy "Cualquiera puede enviar" on public.reservaciones
  for insert to anon with check (true);
