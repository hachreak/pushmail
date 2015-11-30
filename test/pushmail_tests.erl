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
%%% @doc Application backend behaviour.
%%% @end

-module(pushmail_tests).

-include_lib("eunit/include/eunit.hrl").

pushmail_test_() ->
    {foreach,
        fun start/0,
        fun stop/1,
        [
          fun generate_ok/1
        ]
      }.

%%%===================================================================
%%% Setup/teardown
%%%===================================================================

start() ->
    application:set_env(pushmail, backend, pushmail_backend_mock),
    pushmail_backend_mock:start("test").

stop(_State) ->
    ok.

generate_ok(AppCtx) ->
  fun() ->
      Token = <<"test-generate-ok-token">>,
      {ok, {AppCtx, Token}} = pushmail:send(Token, AppCtx)
  end.
