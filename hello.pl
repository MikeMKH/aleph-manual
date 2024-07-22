:- use_module(library(aleph)).
:- aleph.

% from https://www.swi-prolog.org/pack/list?p=aleph

:- modeh(*,grandparent(+person,-person)).
:- modeh(*,parent(+person,-person)).

:- modeb(*,mother(+person,-person)).
:- modeb(*,father(+person,-person)).
:- modeb(*,parent(+person,-person)).

:- aleph_set(verbose,1).

:- begin_bg.
person(bob).
person(dad(bob)).
:- end_bg.

:- begin_in_pos.
grandparent(dad(dad(bob)),bob).
grandparent(dad(mum(bob)),bob).
:- end_in_pos.

:- begin_in_neg.
grandparent(bob,bob). % bob is not a grandparent of bob
:- end_in_neg.

% ?- pack_install(aleph). % installs aleph, see https://www.swi-prolog.org/pack/list

% ?- consult('hello.pl').
% true.

% ?- induce.
% [select example] [1]
% [sat] [1]
% [grandparent(dad(dad(bob)),bob)]

% [bottom clause]
% grandparent(A,B).
% [literals] [1]
% [saturation time] [0.00010699999999996823]
% [reduce]
% [best label so far] [[1,0,2,1]/0]
% grandparent(A,B).
% [2/1]
% [clauses constructed] [1]
% [search time] [0.00021100000000007224]
% [best clause]
% grandparent(dad(dad(bob)),bob).
% [pos cover = 1 neg cover = 0] [pos-neg] [1]
% [atoms left] [1]
% [positive examples left] [1]
% [estimated time to finish (secs)] [0.00021100000000007224]
% [select example] [2]
% [sat] [2]
% [grandparent(dad(mum(bob)),bob)]

% [bottom clause]
% grandparent(A,B).
% [literals] [1]
% [saturation time] [7.999999999996898e-5]
% [reduce]
% [best label so far] [[1,0,2,1]/0]
% grandparent(A,B).
% [clauses constructed] [1]
% [search time] [9.099999999995223e-5]
% [best clause]
% grandparent(dad(mum(bob)),bob).
% [pos cover = 1 neg cover = 0] [pos-neg] [1]
% [atoms left] [0]
% [positive examples left] [0]
% [estimated time to finish (secs)] [0.0]

% [theory]

% [Rule 1] [Pos cover = 1 Neg cover = 0]
% grandparent(dad(dad(bob)),bob).

% [Rule 2] [Pos cover = 1 Neg cover = 0]
% grandparent(dad(mum(bob)),bob).

% [Training set performance]
%          Actual
%        +        - 
%      + 2        0        2 
% Pred 
%      - 0        1        1 

%        2        1        3 

% Accuracy = 1
% [Training set summary] [[2,0,0,1]]
% [time taken] [0.001991000000000076]
% [total clauses constructed] [2]
% true.
