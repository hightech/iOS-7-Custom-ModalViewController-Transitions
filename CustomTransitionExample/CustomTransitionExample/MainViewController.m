//
//  MainViewController.m
//  CustomTransitionExample
//
//  Created by Blanche Faur on 10/24/13.
//  Copyright (c) 2013 Blanche Faur. All rights reserved.
//

#import "MainViewController.h"
#import "TransitionDelegate.h"

@interface MainViewController ()

@property (nonatomic, strong) TransitionDelegate *transitionController;

@end

@implementation MainViewController
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
