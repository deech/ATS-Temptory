(* ****** ****** *)
(*
HX:
For testing divconq
*)
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

#staload "./../SATS/divconq.sats"
#staload "./../DATS/divconq.dats"

(* ****** ****** *)

fun
f91(n: int) =
(
divconq_solve<i><o>(n)
) where
{
//
typedef i = int
typedef o = int
//
impltmp
divconq_divide<i><o>
(x) =
g0ofg1($list1{i}(x+11))
impltmp
divconq_conquer_cmb<i><o>(rs) =
(
f91(r1)
) where
{
val-cons(r1, rs) = rs
}
//
impltmp
divconq_solve_rec<i><o> =
lam(n) =>
f91(n)
impltmp
divconq_solve_opt<i><o> =
lam(x) =>
if x <= 100 then none_vt() else some_vt(x-10)
//
} (* where *) // end of [f91]

(* ****** ****** *)

fun
fibonacci(n: int) =
(
divconq_solve<i><o>(n)
) where
{
//
typedef i = int
typedef o = int
//
impltmp
divconq_divide<i><o>
(x) =
g0ofg1($list1{i}(x-1, x-2))
impltmp
divconq_conquer_cmb<i><o>(rs) =
(
r1 + r2
) where
{
val-cons(r1, rs) = rs
val-cons(r2, rs) = rs
}
//
impltmp
divconq_solve_rec<i><o> =
lam(n) =>
fibonacci(n)
impltmp
divconq_solve_opt<i><o> =
lam(x) =>
if x >= 2 then none_vt() else some_vt(x)
//
} (* where *) // end of [fibonacci]

(* ****** ****** *)

#define N 10

(* ****** ****** *)

implfun main0() = ()

(* ****** ****** *)

val () =
println!
("f91(", N, ") = ", f91(N))
val () =
println!
("fibonacci(", N, ") = ", fibonacci(N))

(* ****** ****** *)

(* end of [test03.dats] *)
