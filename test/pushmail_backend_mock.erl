%%% @author Leonardo Rossi <leonardo.rossi@studenti.unipr.it>
%%% @copyright (C) 2015 Leonardo Rossi
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
%%% @doc Application mock backend.
%%% @end

-module(pushmail_backend_mock).

-author('Leonardo Rossi <leonardo.rossi@studenti.unipr.it>').

-behaviour(pushmail_backend).

-export([start/1, stop/1, send/2]).

-spec start(pushmail:appctx()) ->
  {ok, pushmail:appctx()} | {error: term()}.
start(AppCtx) ->
  {ok, AppCtx}.

-spec stop(pushmail:appctx()) -> ok | {error: term()}.
stop(_) ->
  ok.

%% @doc Send a email (in appctx you can pass parameters)
-spec send(pushmail:mail(), pushmail:appctx()) ->
  {ok, pushmail:appctx()} | {error, term()}.
send(Mail, AppCtx) ->
  {ok, {AppCtx, Mail}}.
