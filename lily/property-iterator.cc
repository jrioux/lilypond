/*
  This file is part of LilyPond, the GNU music typesetter.

  Copyright (C) 1997--2014 Han-Wen Nienhuys <hanwen@xs4all.nl>

  LilyPond is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  LilyPond is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with LilyPond.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "property-iterator.hh"

#include "context-def.hh"
#include "global-context.hh"
#include "international.hh"
#include "music.hh"

bool check_grob (Music *mus, SCM sym);

/**
   There is no real processing to a property: just lookup the
   translation unit, and set the property.
*/
void
Property_iterator::process (Moment mom)
{
  Context *o = get_outlet ();
  Music *m = get_music ();
  bool once = to_boolean (m->get_property ("once"));
  SCM symbol = m->get_property ("symbol");
  SCM previous_value = SCM_UNDEFINED;
  if (once)
    o->here_defined (symbol, &previous_value);

  send_stream_event (o, "SetProperty", m->origin (),
                     ly_symbol2scm ("symbol"), symbol,
                     ly_symbol2scm ("value"), m->get_property ("value"));

  /* For \once \set install a finalization hook to reset the property to the
   * previous value after the timestep */
  if (once)
    {
      Global_context *tg = get_outlet ()->get_global_context ();
      tg->add_finalization (scm_list_4 (once_finalization_proc,
                                        o->self_scm (), m->self_scm (),
                                        previous_value));
    }

  Simple_music_iterator::process (mom);
}

void
Property_unset_iterator::process (Moment mom)
{
  Context *o = get_outlet ();
  Music *m = get_music ();
  bool once = to_boolean (m->get_property ("once"));
  SCM symbol = m->get_property ("symbol");
  SCM previous_value = SCM_UNDEFINED;
  if (once)
    o->here_defined (symbol, &previous_value);

  send_stream_event (o, "UnsetProperty", m->origin (),
                     ly_symbol2scm ("symbol"), symbol);

  /* For \once \unset install a finalization hook to reset the property to the
   * previous value after the timestep */
  if (once && !SCM_UNBNDP (previous_value))
    {
      Global_context *tg = get_outlet ()->get_global_context ();
      tg->add_finalization (scm_list_4 (Property_iterator::once_finalization_proc,
                                        o->self_scm (), m->self_scm (),
                                        previous_value));
    }

  Simple_music_iterator::process (mom);
}

MAKE_SCHEME_CALLBACK (Property_iterator, once_finalization, 3);
SCM
Property_iterator::once_finalization (SCM ctx, SCM music, SCM previous_value)
{
  Music *m = Music::unsmob (music);
  Context *c = Context::unsmob (ctx);

  // Do not use UnsetProperty, which sets the default, but rather
  // cache the value before the \once \set command and restore it now
  send_stream_event (c, "SetProperty", m->origin (),
                     ly_symbol2scm ("symbol"), m->get_property ("symbol"),
                     ly_symbol2scm ("value"), previous_value);

  return SCM_UNSPECIFIED;
}

void
Property_iterator::do_quit ()
{
}

bool
check_grob (Music *mus, SCM sym)
{
  bool g = to_boolean (scm_object_property (sym, ly_symbol2scm ("is-grob?")));

  if (!g)
    mus->origin ()->warning (_f ("not a grob name, `%s'",
                                 ly_symbol2string (sym)));

  return g;
}

SCM
get_property_path (Music *m)
{
  SCM grob_property_path = m->get_property ("grob-property-path");

  SCM eprop = m->get_property ("grob-property");
  if (scm_is_symbol (eprop))
    {
      grob_property_path = scm_list_1 (eprop);
    }

  return grob_property_path;
}

void
Push_property_iterator::process (Moment m)
{
  SCM sym = get_music ()->get_property ("symbol");
  if (check_grob (get_music (), sym))
    {
      SCM grob_property_path = get_property_path (get_music ());
      SCM val = get_music ()->get_property ("grob-value");

      if (to_boolean (get_music ()->get_property ("pop-first"))
          && !to_boolean (get_music ()->get_property ("once")))
        send_stream_event (get_outlet (), "Revert", get_music ()->origin (),
                           ly_symbol2scm ("symbol"), sym,
                           ly_symbol2scm ("property-path"), grob_property_path);

      send_stream_event (get_outlet (), "Override", get_music ()->origin (),
                         ly_symbol2scm ("symbol"), sym,
                         ly_symbol2scm ("property-path"), grob_property_path,
                         ly_symbol2scm ("value"), val);
    }
  Simple_music_iterator::process (m);
}

MAKE_SCHEME_CALLBACK (Push_property_iterator, once_finalization, 2);
SCM
Push_property_iterator::once_finalization (SCM ctx, SCM music)
{
  Music *mus = Music::unsmob (music);
  Context *c = Context::unsmob (ctx);

  SCM sym = mus->get_property ("symbol");
  if (check_grob (mus, sym))
    {
      SCM grob_property_path = get_property_path (mus);

      send_stream_event (c, "Revert", mus->origin (),
                         ly_symbol2scm ("symbol"), sym,
                         ly_symbol2scm ("property-path"), grob_property_path);
    }
  return SCM_UNSPECIFIED;
}

void
Push_property_iterator::do_quit ()
{
  if (to_boolean (get_music ()->get_property ("once")))
    {
      SCM trans = get_outlet ()->self_scm ();
      SCM music = get_music ()->self_scm ();

      Global_context *tg = get_outlet ()->get_global_context ();
      tg->add_finalization (scm_list_3 (once_finalization_proc,
                                        trans, music));
    }
}

void
Pop_property_iterator::process (Moment m)
{
  SCM sym = get_music ()->get_property ("symbol");

  if (check_grob (get_music (), sym))
    {
      SCM grob_property_path = get_property_path (get_music ());

      send_stream_event (get_outlet (), "Revert", get_music ()->origin (),
                         ly_symbol2scm ("symbol"), sym,
                         ly_symbol2scm ("property-path"), grob_property_path);
    }
  Simple_music_iterator::process (m);
}

IMPLEMENT_CTOR_CALLBACK (Pop_property_iterator);
IMPLEMENT_CTOR_CALLBACK (Push_property_iterator);
IMPLEMENT_CTOR_CALLBACK (Property_iterator);
IMPLEMENT_CTOR_CALLBACK (Property_unset_iterator);
