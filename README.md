pushmail
========

[![Build Status](https://travis-ci.org/hachreak/pushmail.svg?branch=master)](https://travis-ci.org/hachreak/pushmail)

An OTP generic framework to handle different plugin to send email.


Configuration
-------------

```erlang
[
  {pushmail, [
    {backend, pushmail_backend_lag4erl}
  ]}
]
```


Plugins
-------

**Log4erl**

Simply log email that are sent (without do nothing more).

To configure the plugin, create a file `priv/log4erl.conf` where you can write
logging configuration accordly with its
[semantics](https://github.com/ahmednawras/log4erl).

E.g. log email in console:

```json
logger pushmail{
  %% Console appender with level set to debug
  console_appender cmd{
    level = debug,
    format = '[%L] %I %l%n'
  }
}
```

E.g. log email to file:

```json
logger pushmail{
  file_appender file{
    dir = "/var/log/myapp",
    level = debug,
    file = "mail",
    type = size,
    max = 100000,
    suffix = log,
    rotation = 5,
    format = '[%L] %I %l%n'
  }
}
```

To load the plugin you need to configure `pushmail` and start it with:

```erlang
{ok, AppCtx} = pushmail:start("priv/log4erl.conf").
```

After that, you are ready to log email with:

```erlang
Mail = #{
  sender => <<"test@mydomain.org">>,
  receivers => [<<"receiver@otherdomain.org">>],
  subject => <<"My subject">>,
  message => <<"My message!">>,
  headers => {}
},
pushmail:send(Mail, AppCtx).
```


Build
-----

    $ rebar3 compile


Tests
-----

    $ ./utils/rebar3 eunit
