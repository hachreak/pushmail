-module('pushmail').

%% API exports
-export([start/1, stop/1, send/2]).

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
