# How to reproduce

### Prerequisites

1. I'm on Ruby 2.6.6, but it probably doesn't matter much.
2. `gem install puma sidekiq-pro`
3. Make sure you have empty Redis running on localhost:6379
   (You can run `docker-compose up` if you have Docker.)

### Reproducing

1. Make sure Redis is clear  
   You can run `./clear-redis`  
   **Careful!** It clears all data in `localhost:6379` redis
2. Make sure you don't have any Sidekiq instances running
3. _Optional_ — Run `puma` to see the web dashboard
4. Run `./reproduce` and watch output

### My output

```
❯ ./clear-redis
❯ ./reproduce  
REPRODUCE LOG: Reproducing the bug
REPRODUCE LOG: 1. Starting Sidekiq and waiting 5s
2020-10-09T17:33:42.610Z pid=3633 tid=ouxluk2zl INFO: Running in ruby 2.6.6p146 (2020-03-31 revision 67876) [x86_64-darwin19]
2020-10-09T17:33:42.610Z pid=3633 tid=ouxluk2zl INFO: Sidekiq Pro 5.2.0, commercially licensed. Thanks for your support!
2020-10-09T17:33:42.610Z pid=3633 tid=ouxluk2zl INFO: Booting Sidekiq 6.1.2 with redis options {}
2020-10-09T17:33:42.625Z pid=3633 tid=ouxluk2zl INFO: Starting processing, hit Ctrl-C to stop
2020-10-09T17:33:42.625Z pid=3633 tid=ouxmertv1 INFO: SuperFetch activated
REPRODUCE LOG: Jobs in the default queue: 0
REPRODUCE LOG: Job in progress: 0
REPRODUCE LOG: 2. Enqueueing a batch and waiting 5s
2020-10-09T17:33:47.278Z pid=3633 tid=ouxm9rqn9 class=SleepyWorker jid=77380701f0d8a8cdeb1078f4 bid=13IxB9D3q2uTRA INFO: start
REPRODUCE LOG: Jobs in the default queue: 0
REPRODUCE LOG: Job in progress: 1
REPRODUCE LOG: Jobs pending in batch: 1
REPRODUCE LOG: 3. Sending SIGINT to Sidekiq
2020-10-09T17:33:52.289Z pid=3633 tid=ouxluk2zl INFO: Shutting down
2020-10-09T17:33:52.289Z pid=3633 tid=ouxluk2zl INFO: Terminating quiet workers
2020-10-09T17:33:52.289Z pid=3633 tid=ouxm9rqw5 INFO: Scheduler exiting...
2020-10-09T17:33:52.391Z pid=3633 tid=ouxluk2zl INFO: Pausing to allow workers to finish...
REPRODUCE LOG: 4. Sending SIGKILL to Sidekiq too soon
REPRODUCE LOG: Jobs in the default queue: 0
REPRODUCE LOG: Job in progress: 1
REPRODUCE LOG: Jobs pending in batch: 1
REPRODUCE LOG: 5. Starting Sidekiq again and waiting 3s
2020-10-09T17:33:56.231Z pid=3634 tid=ox2iqi5h6 INFO: Running in ruby 2.6.6p146 (2020-03-31 revision 67876) [x86_64-darwin19]
2020-10-09T17:33:56.231Z pid=3634 tid=ox2iqi5h6 INFO: Sidekiq Pro 5.2.0, commercially licensed. Thanks for your support!
2020-10-09T17:33:56.231Z pid=3634 tid=ox2iqi5h6 INFO: Booting Sidekiq 6.1.2 with redis options {}
2020-10-09T17:33:56.236Z pid=3634 tid=ox2iqi5h6 INFO: Starting processing, hit Ctrl-C to stop
2020-10-09T17:33:56.237Z pid=3634 tid=ox2j81ujq INFO: SuperFetch activated
REPRODUCE LOG: Waiting 25s for the job to finish.
REPRODUCE LOG: Jobs in the default queue: 0
REPRODUCE LOG: Job in progress: 1
REPRODUCE LOG: Jobs pending in batch: 1
REPRODUCE LOG: Expected batch to complete, but still pending with 1 jobs
REPRODUCE LOG: Killing sidekiq
```
