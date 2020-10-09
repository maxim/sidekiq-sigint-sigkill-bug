# How to reproduce.

### Prerequisites

1. I'm on Ruby 2.6.6, but it probably doesn't matter much.
2. `gem install puma sidekiq-pro`
3. Make sure you have empty Redis running on localhost:6379
   (You can run `docker-compose up` if you have Docker.)

### Reproducing

1. Make sure Redis is clear (you can run `./clear-redis`)
2. _Optional_ — Run `puma` to see the web dashboard
2. Run `./reproduce` and watch output

### My output

```
❯ ./clear-redis
❯ ./reproduce
REPRODUCE LOG: Reproducing the bug
REPRODUCE LOG: 1. Starting Sidekiq and waiting 3s
2020-10-09T16:48:00.388Z pid=97512 tid=ovxelom60 INFO: Running in ruby 2.6.6p146 (2020-03-31 revision 67876) [x86_64-darwin19]
2020-10-09T16:48:00.388Z pid=97512 tid=ovxelom60 INFO: Sidekiq Pro 5.2.0, commercially licensed. Thanks for your support!
2020-10-09T16:48:00.388Z pid=97512 tid=ovxelom60 INFO: Booting Sidekiq 6.1.2 with redis options {}
2020-10-09T16:48:00.408Z pid=97512 tid=ovxelom60 INFO: Starting processing, hit Ctrl-C to stop
2020-10-09T16:48:00.409Z pid=97512 tid=ovxf8gbfs INFO: SuperFetch activated
REPRODUCE LOG: Jobs in the default queue: 0
REPRODUCE LOG: Job in progress: 0
REPRODUCE LOG: 2. Enqueueing a batch and waiting 3s
2020-10-09T16:48:03.025Z pid=97512 tid=ovxf8gdkc class=SleepyWorker jid=95df8fc1394d564cf1165972 bid=yW2PMNL0kpJR4w INFO: start
REPRODUCE LOG: Jobs in the default queue: 0
REPRODUCE LOG: Job in progress: 1
REPRODUCE LOG: Jobs pending in batch: 1
REPRODUCE LOG: 3. Sending SIGINT to Sidekiq and waiting 1s
2020-10-09T16:48:06.039Z pid=97512 tid=ovxelom60 INFO: Shutting down
2020-10-09T16:48:06.039Z pid=97512 tid=ovxelom60 INFO: Terminating quiet workers
2020-10-09T16:48:06.039Z pid=97512 tid=ovxf8gdpo INFO: Scheduler exiting...
2020-10-09T16:48:06.141Z pid=97512 tid=ovxelom60 INFO: Pausing to allow workers to finish...
REPRODUCE LOG: 4. Sending SIGKILL to Sidekiq before jobs ended and waiting 3s
REPRODUCE LOG: Jobs in the default queue: 0
REPRODUCE LOG: Job in progress: 1
REPRODUCE LOG: Jobs pending in batch: 1
REPRODUCE LOG: 5. Starting Sidekiq again and waiting 3s
2020-10-09T16:48:10.421Z pid=97513 tid=ouy0hfikp INFO: Running in ruby 2.6.6p146 (2020-03-31 revision 67876) [x86_64-darwin19]
2020-10-09T16:48:10.421Z pid=97513 tid=ouy0hfikp INFO: Sidekiq Pro 5.2.0, commercially licensed. Thanks for your support!
2020-10-09T16:48:10.421Z pid=97513 tid=ouy0hfikp INFO: Booting Sidekiq 6.1.2 with redis options {}
2020-10-09T16:48:10.427Z pid=97513 tid=ouy0hfikp INFO: Starting processing, hit Ctrl-C to stop
2020-10-09T16:48:10.428Z pid=97513 tid=ouy0tz1sp INFO: SuperFetch activated
REPRODUCE LOG: Waiting for the job to finish.
REPRODUCE LOG: Expected batch to complete, but still pending with 1 jobs
```
