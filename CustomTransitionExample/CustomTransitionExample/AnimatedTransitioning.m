//
//  AnimatedTransitioning.m
//  CustomTransitionExample
//
//  Created by Blanche Faur on 10/24/13.
//  Copyright (c) 2013 Blanche Faur. All rights reserved.
//

#import "AnimatedTransitioning.h"
#import "MainViewController.h"
#import "SecondViewController.h"

@implementation AnimatedTransitioning

//===================================================================
// - UIViewControllerAnimatedTransitioning
//===================================================================

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.25f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *inView = [transitionContext containerView];
    SecondViewController *toVC = (SecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    MainViewController *fromVC = (MainViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (self.isPresenting) {
        [inView addSubview:toVC.view];
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        [toVC.view setFrame:CGRectMake(0, screenRect.size.height, fromVC.view.frame.size.width, fromVC.view.frame.size.height)];
        
        [UIView animateWithDuration:0.25f
                         animations:^{
                             
                             [toVC.view setFrame:CGRectMake(0, 0, fromVC.view.frame.size.width, fromVC.view.frame.size.height)];
                         }
                         completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
    }else{
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        [UIView animateWithDuration:0.25f
                         animations:^{
                             
                             [fromVC.view setFrame:CGRectMake(screenRect.size.width, 0, fromVC.view.frame.size.width, fromVC.view.frame.size.height)];
                         }
                         completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                             [fromVC.view removeFromSuperview];
                         }];

    }
}


@end
