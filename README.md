iOS-7-Custom-ModalViewController-Transitions
============================================

Sample project implementing new custom ModalViewController Transitions on iOS 7. We have a UIViewController view as a subview/modal on top of another UIViewController view, such as that the subview/modal should be transparent and whatever components are added to the subview should be visible. We decided not to use a segue in our Storyboard.

![RootViewController](https://raw.github.com/hightech/iOS-7-Custom-ModalViewController-Transitions/master/Screenshots/screenshot1.png "RootViewController")
![RootViewController](https://raw.github.com/hightech/iOS-7-Custom-ModalViewController-Transitions/master/Screenshots/screenshot2.png "RootViewController")

Requirements
============================================
Our sample requires iOS 7 and above.

Installation
============================================

* Add `TransitionDelegate.h/m` and `AnimatedTransitioning.h/m` to your project (4 files total). Or to drag a folder called `Transition Delegate` with files inside to your project.
* In your `RootViewController.m` file, include with `#import "TransitionDelegate"` and do the following to instantiate and to present a modal view controller with a **clearColor** in background.

```
#import "RootViewController.h"
#import "TransitionDelegate.h"

@interface RootViewController ()
@property (nonatomic, strong) TransitionDelegate *transitionController;
@end

@implementation RootViewController
@synthesize transitionController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.transitionController = [[TransitionDelegate alloc] init];
}

- (IBAction)displaySecondVC:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    vc.view.backgroundColor = [UIColor clearColor];
    [vc setTransitioningDelegate:transitionController];
    vc.modalPresentationStyle= UIModalPresentationCustom;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
```
Usage
============================================
Check out the sample Xcode project in `CustomTransitionExample`.

Recommendations
============================================
This is outlined in the ['Custom Transitions Using View Controllers'](https://developer.apple.com/wwdc/videos/?id=218) talk from WWDC 2013, which also covers how to implement your own transition delegate.

Contact
============================================
[@sharpimedia](https://www.twitter.com/sharpimedia) or [@hightechartist](https://www.twitter.com/hightechartist) on Twitter

License
============================================
Copyright © 2013 Blanche Faur.

This code is distributed under the terms and conditions of the [MIT License](https://github.com/hightech/iOS-7-Custom-ModalViewController-Transitions/blob/master/LICENSE). 

