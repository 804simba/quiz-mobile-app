Flutter Stateful widgets lifecycle
Every flutter widget has a built in lifecycle which is executed
by flutter at certain points of time.

The thsree (3) extremely important ones are:
- initState(): Executed by flutter when the stateful widget is initialized.
- build(): Executed by flutter when the stateful widget is built for the first time and after setState() was called.
- dispose(): Executed by flutter right before the Widget will be deleted.