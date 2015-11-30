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
%%% @doc Application backend behaviour: it take care to send the email.
%%% @end

-module(pushmail_backend).

-author('Leonardo Rossi <leonardo.rossi@studenti.unipr.it>').

%% @doc Configure the backend.
-callback start(pushmail:appctx()) ->
  {ok, pushmail:appctx()} | {error: term()}.

%% @doc Configure the backend.
-callback stop(pushmail:appctx()) -> ok | {error: term()}.

%% @doc Send a email (in appctx you can pass parameters)
-callback send(pushmail:mail(), pushmail:appctx()) ->
  {ok, pushmail:appctx()} | {error, term()}.
