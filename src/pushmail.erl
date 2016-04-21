%%% @author Leonardo Rossi <leonardo.rossi@studenti.unipr.it>
%%% @copyright (C) 2015, 2016 Leonardo Rossi
%%%
%%% This software is free software; you can redistribute it and/or
%%% modify it under the terms of the GNU General Public License as
%%% published by the Free Software Foundation; either version 2 of the
%%% License, or (at your option) any later version.
%%%
%%% This software is distributed in the hope that it will be useful, but
%%% WITHOUT ANY WARRANTY; without even the implied warranty of
%%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%%% General Public License for more details.
%%%
%%% You should have received a copy of the GNU General Public License
%%% along with this software; if not, write to the Free Software Foundation,
%%% Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.
%%%
%%% @doc Application pushmail.
%%% @end

-module('pushmail').

%% API exports
-export([start/0, start/1, stop/1, send/2]).

%%% Macros ===========================================================
-define(BACKEND, (pushmail_config:backend())).

%%% Types ============================================================

-type mail() :: #{sender => binary(), receivers => list(binary()),
                  subject => binary(), message => binary(),
                  headers => tuple()}.

-type appctx() :: any().

%%====================================================================
%% API functions
%%====================================================================

-spec start() ->
  {ok, pushmail:appctx()} | {error: term()}.
start() ->
  ?BACKEND:start().

-spec start(pushmail:appctx()) ->
  {ok, pushmail:appctx()} | {error: term()}.
start(AppCtx) ->
  ?BACKEND:start(AppCtx).

-spec stop(pushmail:appctx()) -> ok | {error: term()}.
stop(AppCtx) ->
  ?BACKEND:stop(AppCtx).

-spec send(mail(), appctx()) -> {ok, appctx()} | {error, term()}.
send(Mail, AppCtx) ->
  ?BACKEND:send(Mail, AppCtx).

%%====================================================================
%% Internal functions
%%====================================================================
