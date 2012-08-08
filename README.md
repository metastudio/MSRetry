Objective-C library which allows user to retry certain actions

# How it works

When you call `retry:(MSRetryActionBlock)actionBlock withMessage:(NSString *)message`
function it shows alert view with your message and buttons "Cancel" and "Retry".
If user taps "Cancel" nothing is going, but if user taps "Retry" then `actionBlock`
will be runned. If you call `retry:(MSRetryActionBlock)actionBlock withMessage:(NSString *)message`
when alert vies is shown, then action will be putted in queue and when user
taps "Retry" all actions in queue will be runned.

## More complex example of using

You run several actions in same time and all of them are depending on
internet connetion. User doesn't have internet connection and all acctions will fail.
You will show alert for every action then user have to tap "Retry" for every
action. But with this queue user have to tap only once and all actions will
be retried.

# How to use

Clone as submodule to your project:

```sh
git submodule add https://github.com/metastudio/MSRetry.git lib/MSRetry
```

Add [UIAlertView-Blocks](https://github.com/jivadevoe/UIAlertView-Blocks) library as submodule:

```sh
git submodule add https://github.com/jivadevoe/UIAlertView-Blocks.git lib/UIAlertView-Blocks
```

Add `.h` and `.m` files from both libraries to your Xcode project.

Import `MSRetryAlertQueue.h` file:

```objective-c
#import "MSRetryAlertQueue.h"
```

And call your repeated action in block:

```objective-c
[MSRetryAlertQueue retry:^{
        [[UserProgram currentProgram] loadCurrentProgram];
} withMessage:error.localizedDescription];
```
