# grug principles — full set

Distilled from "The Grug Brained Developer" by Carson Gross
(https://grugbrain.dev/). Restated as actionable engineering heuristics in
this project's own words. Each section ends with a one-line trigger telling you
when to reach for it. This is the deep reference behind `grug-principles`;
consult it for thorough design reviews.

## Complexity — the eternal enemy

- Complexity is the single biggest threat to a codebase, worse than any
  outside pressure, because it is invisible and compounds.
- It arrives one reasonable-sounding decision at a time, usually from good
  intentions, until one change ripples into ten unrelated breakages.
- You cannot fight it head-on once it is entrenched; you keep it out at the
  door. Prevention beats cure.
- Treat "this makes the system harder to reason about" as a first-class cost,
  equal to a bug.
- **When to apply:** every design and review decision — it is the lens for all
  the rest.

## Saying no

- "No" is the most powerful tool against complexity: the feature not built
  cannot rot, break, or need maintaining.
- Push back on features and requirements before they enter, not after.
- It is often bad for a career and good for the codebase — spend the capital
  deliberately.
- **When to apply:** new feature requests, scope creep, "while we're in here"
  additions.

## Saying ok — the 80/20 solution

- Sometimes you must ship; survival funds the work. Say ok, then deliver the
  80/20 cut: most of the value for a fraction of the code.
- Name the scope you are deliberately leaving out so it is a choice, not a
  silent gap.
- The version that does less but is understandable usually beats the complete
  version nobody can safely change.
- **When to apply:** deadlines, gold-plated requirements, "make it configurable
  for every possible future case."

## Factoring and cut points

- Do not factor early. Early in a system the true shape is unknown, and
  abstractions guessed now are usually wrong and expensive to unwind.
- Wait for natural cut points to emerge: narrow interfaces with a small surface
  area that hide a lot of complexity behind them.
- A good cut point traps complexity inside; a bad one leaks internals through a
  wide, chatty interface.
- Build a prototype or demo early — tangible output reveals the real shape and
  keeps over-engineering honest.
- **When to apply:** "should we split this out / add a layer / introduce an
  interface?" — usually the answer is "not yet."

## Testing

- Tests are invaluable; test dogma is not. Distrust the shaman who mandates a
  ritual regardless of payoff.
- Unit tests are brittle — they pin implementation detail and break on
  refactors; write few, hold them loosely, discard without guilt.
- End-to-end tests prove the system works but are painful to debug when red.
- Integration tests at stable cut points are the sweet spot: high enough to
  show correctness, low enough to localize a failure.
- Ideal mix: some unit tests early as scaffolding, integration tests as the
  backbone once the shape firms up, a small curated e2e suite for critical
  paths, maintained religiously.
- When a bug appears, write the regression test that reproduces it first.
- Holding tests loosely has a flip side: discipline. "Works on my machine" is
  never a reason to skip writing tests. Write them along the way as the code
  firms up after the prototype phase — not test-first, and not chasing 100%
  coverage.
- **When to apply:** deciding test strategy, reviewing a PR heavy in mocks or
  brittle unit tests, reacting to a production bug.

## Agile and process

- Process is neither savior nor villain; the danger is the shaman who blames
  every failure on "you didn't do it right."
- No methodology is a silver bullet. Prototyping, strong tooling, and good
  people move the needle more than ceremony.
- Adopt the parts that help your team and drop the rest without apology.
- **When to apply:** process debates, retrospectives, "if we were more X this
  wouldn't happen" claims.

## Refactoring

- Refactoring is valuable, but big-bang refactors tend to fail — keep changes
  small and keep the system working the whole way through.
- The common failure mode is smuggling in new abstraction while refactoring;
  resist it, change one thing at a time.
- A small end-to-end test suite is a lifesaver here — it proves the system
  still works while the internals move.
- Grand over-abstracted frameworks (the J2EE/OSGi lineage) added complexity
  instead of containing it — a cautionary pattern.
- **When to apply:** large restructuring proposals, "let's rewrite this
  properly" moments.

## Chesterton's fence

- Do not remove code because it looks unnecessary. If you do not know why it
  exists, you do not yet know enough to delete it.
- Working-but-ugly code often guards a real edge case learned the hard way.
- The existing tests around the code are often the best explanation of why the
  fence stands — read them before approving deletion. (That said, absence of a
  test is still not proof the code is dead.)
- Ask "why was this put here?" and get an answer before approving removal.
- **When to apply:** reviewing deletions, cleanups, "this is obviously dead
  code" claims.

## Microservices

- Splitting a system across the network combines the hardest problem
  (factoring a system correctly) with a second hard problem (distributed
  systems). That is a strange thing to volunteer for.
- Default to a single deployable unit; introduce a service boundary only when a
  real, demonstrated need (independent scaling, team ownership) forces it.
- **When to apply:** architecture proposals that reach for services, queues, or
  network hops where a function call would do.

## Tools

- Tools and mastery of them are what separate a developer from chaos; invest in
  them relentlessly.
- Spending two focused weeks learning your editor, IDE, and shell can double
  productivity and pays off for years.
- The debugger is one of the highest-leverage skills there is — often more
  instructive than formal study. Learn it deeply.
- Never stop sharpening tooling; small daily frictions compound.
- **When to apply:** onboarding, recurring manual toil, "I'll just do it by
  hand again" habits.

## Type systems

- The biggest practical win from types is editor magic: type a dot, see what
  is available, discover the API without leaving the code.
- Prioritize that developer experience and discoverability over chasing
  maximal type-level correctness.
- Beware the big brain type shaman who builds beautiful type structures nobody
  else can use. Keep generics to container-like cases; do not astral-project
  into Platonic abstractions divorced from the actual problem.
- **When to apply:** reviewing elaborate generic signatures, type gymnastics,
  "let's make the types prove this can't happen."

## Expression complexity

- Minimize dense, deeply nested expressions. Brevity is not the goal;
  debuggability is.
- Break complicated conditionals into named intermediate variables — the name
  documents intent and gives the debugger somewhere to stop.
- Newer developers resist this as verbose; experience turns them around.
- **When to apply:** reviewing clever one-liners, chained ternaries, packed
  boolean conditions.

## DRY — don't repeat yourself, in moderation

- DRY is a real good, but over-applied it manufactures worse problems than the
  duplication it removes.
- Simple, obvious repetition often beats a clever abstraction that introduces
  callbacks, closures, or an elaborate object model just to avoid typing twice.
- Let duplication live until the shared shape is genuinely clear, then factor.
- **When to apply:** "we could extract this" suggestions, premature helper/base
  class creation.

## Separation of concerns vs. locality of behavior

- Separation of concerns spreads one behavior across many files; you must jump
  around to understand what a single thing does.
- Locality of behavior keeps the code that does the thing on the thing that
  does it — everything you need is in one place.
- Prefer locality when it reduces navigation cost; reserve separation for
  boundaries that genuinely earn it.
- **When to apply:** file/layer structure decisions, "this belongs in its own
  layer" reflexes.

## Closures

- Closures are useful for abstracting operations over collections of objects.
- Like salt or type systems: a little improves everything, too much ruins the
  dish. "Callback hell" is the warning sign of overuse.
- Closure-heavy control flow compounds into something hard to follow — watch
  the depth.
- **When to apply:** callback-dense code, deeply nested higher-order functions.

## Logging

- Logging is drastically underrated; strong engineers treat it as a core
  discipline, not an afterthought.
- Log at major logical branches so production behavior is reconstructable.
- In distributed systems, carry a request/correlation ID through the logs.
- Allow log level to be adjusted dynamically, ideally per-user, so you can
  turn up detail on a live problem.
- **When to apply:** anything heading to production, on-call/debuggability
  reviews.

## Concurrency

- Fear concurrency; that fear is rational. Reach for the simplest model that
  works.
- Prefer stateless request handlers, independent job queues, and optimistic
  concurrency control for web systems.
- Thread-local state is a reasonable tool inside framework code.
- Avoid webs of interdependent concurrent operations sharing mutable state.
- **When to apply:** anything with threads, locks, shared mutable state, or
  "let's parallelize this."

## Optimizing and performance

- Premature optimization really is a trap; do not optimize on a hunch.
- Require a real-world profile before optimizing — the slow part is routinely
  not where intuition points.
- The bottleneck is often network or I/O, not CPU; Big O tempts you to
  hand-optimize loops that were never the problem.
- Profile, fix the measured hot spot, measure again.
- **When to apply:** "this might be slow" changes, micro-optimizations, any
  perf work without numbers.

## APIs

- A good API needs little thought to use; a bad one forces the caller to think
  about the implementation.
- Design from the caller's point of view, not the implementer's.
- Layer it: simple cases get a simple interface, advanced cases get more
  options — do not tax everyone for the rare case (the Java "just iterate a
  list" ceremony is the anti-pattern).
- Put the API on the object it naturally belongs to; avoid gratuitous
  abstraction layers.
- **When to apply:** designing or reviewing any public function, class, or
  module interface.

## Parsing

- Recursive descent is the most intuitive, maintainable way to write a parser.
- Parser generators tend to produce impenetrable code; the academic default
  toward them adds complexity for little gain.
- Parsing is not as hard as its reputation — reach for the simple hand-written
  approach first.
- **When to apply:** any parsing, tokenizing, or grammar work.

## Visitor pattern

- Treat the visitor pattern as a smell. It scatters related logic and adds
  ceremony; prefer a simpler, more local structure.
- **When to apply:** proposals that reach for visitor to traverse a structure.

## Front end

- The frontend complexity demon is unusually strong and industry-wide. Even
  trivial apps — a form, a brochure page — get over-engineered.
- Splitting into a heavy SPA plus a separate API (e.g. SPA + GraphQL) creates
  two complexity lairs where one would do.
- Simpler, HTML-centric approaches (server-rendered pages, htmx/hyperscript
  style) are legitimate and often sufficient.
- Heavy frameworks carry real job-market value, but weigh that against the
  complexity they commit you to; match the tool to the app's actual needs.
- **When to apply:** frontend architecture choices, "we need a SPA/GraphQL"
  defaults for simple UIs.

## Fads

- Fads are constant, especially on the frontend; the backend is calmer only
  because it has already exhausted more bad ideas.
- Most "revolutionary" approaches are recycled old ones. Genuine new ideas
  exist but are frequently hijacked as vehicles for complexity.
- Decades of history argue for calm skepticism toward revolutionary claims —
  not cynicism, just wait-and-see.
- **When to apply:** adopting the newest framework/paradigm because it is new.

## Fear of looking dumb (FOLD)

- Pretending to understand hands the complexity demon a win; unspoken confusion
  lets bad complexity survive review.
- When a senior developer admits they do not understand something, it gives
  everyone junior permission to do the same — and surfaces the real problem.
- Ask the "dumb" question; it is usually the most valuable one in the room.
- **When to apply:** design reviews, reading unfamiliar code, any moment you are
  nodding along without understanding.

## Impostor syndrome

- Feeling like an impostor is close to universal among developers, including
  the most accomplished ones — it is the normal state, not a defect.
- Accepting that everyone feels it takes most of its power away.
- Frustration and doubt are part of the work; you can keep improving anyway.
- **When to apply:** morale, mentoring, your own low-confidence moments.

## Recommended reads

- "Worse Is Better" (Richard Gabriel and the surrounding essays) — why the
  simpler, less complete thing often wins.
- "A Philosophy of Software Design" (John Ousterhout) — deep modules, narrow
  interfaces, complexity as the core concern.
- **When to apply:** going deeper on the philosophy behind these heuristics.

## Closing

- The through-line is one sentence: complexity is very, very bad. Every
  heuristic here is a way of keeping it out.
- **When to apply:** whenever you are unsure — ask which option adds less
  complexity, and lean that way.
