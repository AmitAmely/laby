
(*
 * Copyright (C) 2007-2009 The laby team
 * You have permission to copy, modify, and redistribute under the
 * terms of the GPL-3.0. For full license terms, see gpl-3.0.txt.
 *)

(**
   ocaml-dtools
   @author Stéphane Gimenez
*)

(**
  Log management module.
*)

type t =
    <
      internal: F.t -> unit;
      fatal: F.t -> unit;
      error: F.t -> unit;
      warning: F.t -> unit;
      info: F.t -> unit;
      debug: int -> F.t -> unit;
    >
    (**
       Type for loggers.
       - [f lvl] prints a level [lvl] debug message using a printf like
       function.
    *)

val make : ?level:int -> Conf.path -> t
  (**
     Make a logger labeled according to the given path.
  *)

val start : Init.t
  (**
     An atom that starts the logging.
  *)

val stop : Init.t
  (**
     An atom that stops the logging.
  *)

val conf : Conf.ut
val conf_level : int Conf.t
val conf_timestamps : bool Conf.t
val conf_timestamps_format : string Conf.t
val conf_stdout : bool Conf.t
val conf_file : bool Conf.t
val conf_file_path : string Conf.t
val conf_file_append : bool Conf.t
val conf_file_perms : int Conf.t

