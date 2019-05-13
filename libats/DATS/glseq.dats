(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: February, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#define tt true
#define ff false

(* ****** ****** *)
//
#staload "./../SATS/gint.sats"
#staload "./../SATS/glseq.sats"
//
#staload UN = "./../SATS/unsafe.sats"
//
(* ****** ****** *)
//
implement
{xs}{x0}
glseq_forall0(xs) =
(
loop
(
glseq_streamize<xs><x0>(xs)
)
) where
{
fun
loop
( xs
: stream_vt(x0)): bool =
(
case+ !xs of
|
~stream_vt_nil() => true
|
~stream_vt_cons(x0, xs) =>
let
  val test =
  glseq_forall0$test<x0>(x0)
in
  if test then loop(xs) else (~xs; ff)
end // end of [let]
)
} (* end of [glseq_forall0] *)
//
(* ****** ****** *)
//
implement
{xs}{x0}
glseq_exists0(xs) =
(
if
glseq_forall0<xs><x0>(xs) then ff else tt
) where
{
//
implement
glseq_forall0$test<x0>
  (x0) =
(
if
glseq_exists0$test<x0>(x0) then ff else tt
) (* glseq_forall0$test *)
//
} (* end of [glseq_exists0] *)
//
(* ****** ****** *)
//
implement
{xs}{x0}
glseq_foreach0(xs) =
let
//
implement
glseq_forall0$test<x0>(x0) =
let
val () =
glseq_foreach0$work<x0>(x0) in true
end // end of [let]
//
in
  ignoret(glseq_forall0<xs><x0>(xs))
end // end of [let]
//
(* ****** ****** *)
//
implement
{xs}{x0}{r0}
glseq_foldleft0
  (xs, r0) = let
//
var rr: r0 = r0
val p0 = addr@(rr)
//
implement
glseq_foreach0$work<x0>
  (x0) = () where
{
val r0 =
$UN.ptr0_get<r0>(p0)
val r0 =
glseq_foldleft0$fopr<x0><r0>(r0, x0)
val () =
$UN.ptr0_set<r0>(p0, r0)
} (* end of [where] *)
//
in
let
val () = glseq_foreach0<xs><x0>(xs) in rr
end
end // end of [glseq_foreach0]
//
(* ****** ****** *)
//
implement
{xs}{x0}
glseq_iforall0(xs) =
(
glseq_forall0<xs><x0>(xs)
) where
{
//
var i0: int = 0
val p0 = addr@(i0)
//
implement
glseq_forall0$test<x0>
  (x0) =
(
glseq_iforall0$test<x0>(i0, x0)
) where
{
val i0 = $UN.ptr0_get<int>(p0)
val () = $UN.ptr0_set<int>(p0, succ(i0))
} (* end of [where] *)
//
} (* end of [glseq_iforall0] *)
//
(* ****** ****** *)
//
implement
{xs}{x0}
glseq_iexists0(xs) =
(
if
glseq_iforall0<xs><x0>(xs) then ff else tt
) where
{
//
implement
glseq_iforall0$test<x0>
  (i0, x0) =
(
if
glseq_iexists0$test<x0>(i0, x0) then ff else tt
) (* glseq_forall0$test *)
//
} (* end of [glseq_iexists0] *)
//
(* ****** ****** *)
//
implement
{xs}{x0}
glseq_iforeach0(xs) =
(
ignoret
(glseq_iforall0<xs><x0>(xs))
) where
{
//
implement
glseq_iforall0$test<x0>(i0, x0) =
let
val () =
glseq_iforeach0$work<x0>(i0, x0) in true
end // end of [let]
//
} (* end of [glseq_iforeach0] *)
//
(* ****** ****** *)
//
implement
{xs}{x0}
glseq_foreach1(xs) =
let
//
implement
glseq_forall1$test<x0>(x0) =
let
val () =
glseq_foreach1$work<x0>(x0) in true
end // end of [let]
//
in
  ignoret(glseq_forall1<xs><x0>(xs))
end // end of [glseq_forall1]
//
(* ****** ****** *)
//
implement
{xs}{x0}
glseq_iforall1(xs) =
(
glseq_forall1<xs><x0>(xs)
) where
{
//
var i0: int = 0
val p0 = addr@(i0)
//
implement
glseq_forall1$test<x0>
  (x0) =
(
glseq_iforall1$test<x0>(i0, x0)
) where
{
val i0 = $UN.ptr0_get<int>(p0)
val () = $UN.ptr0_set<int>(p0, succ(i0))
} (* end of [where] *)
//
} (* end of [glseq_iforall1] *)
//
(* ****** ****** *)
//
implement
{xs}{x0}
glseq_rforeach1(xs) =
let
//
implement
glseq_rforall1$test<x0>(x0) =
let
val () =
glseq_rforeach1$work<x0>(x0) in true
end // end of [let]
//
in
  ignoret(glseq_rforall1<xs><x0>(xs))
end // end of [glseq_rforeach1]
//
(* ****** ****** *)

(* end of [glseq.dats] *)
