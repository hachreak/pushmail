pushmail
========

[![Build Status](https://travis-ci.org/hachreak/pushmail.svg?branch=master)](https://travis-ci.org/hachreak/pushmail)

An OTP generic framework to handle different plugin to send email.


Configuration
-------------

To configure for example the plugin to log the email sent.

```erlang
[
  {pushmail, [
    {backend, pushmail_backend_error_logger}
  ]}
]
```


Usage
-----

Start `pushmail` with arguments or without (e.g. you don't need nothing
special to start the `error_logger` plugin):

```erlang
{ok, AppCtx} = pushmail:start(...).
```

or

```erlang
application:ensure_all_started(pushmail).
{ok, AppCtx} = pushmail:start().
```

After that, you are ready to send email with:

```erlang
Mail = #{
  sender => <<"test@mydomain.org">>,
  receivers => [<<"receiver@otherdomain.org">>],
  subject => <<"My subject">>,
  message => <<"My message!">>,
  headers => {}
},
{ok, NewAppCtx} = pushmail:send(Mail, AppCtx).
```

To stop the application:

```erlang
pushmail:stop(NewAppCtx).
```

Plugins
-------

**error_log**

The plugin simply log in console the email sent (without do nothing more).

To load the plugin you need to configure `pushmail` and start it with:

```erlang
[
  {pushmail, [
    {backend, pushmail_backend_error_logger}
  ]}
]
```


Build
-----

    $ ./utils/rebar3 compile


Tests
-----

    $ ./utils/rebar3 eunit
