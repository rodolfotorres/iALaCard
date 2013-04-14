//
//  iALaCardViewController.m
//  iALaCard
//
//  Created by Rodolfo Torres on 3/22/13.
//  Copyright (c) 2013 Rodolfo Torres. All rights reserved.
//

#import "iALaCardViewController.h"

@interface iALaCardViewController ()

@end

@implementation UIViewController(iALaCardViewExtension)

//returns the parent controller
- (iALaCardViewController *)iALaCardViewController
{
    UIViewController *viewController = self.parentViewController;
    while (!(viewController == nil || [viewController isKindOfClass:[iALaCardViewController class]])) {
        viewController = viewController.parentViewController;
    }
    
    return (iALaCardViewController *)viewController;
}
@end

@implementation iALaCardViewController

//getter for the controls
-(NSMutableDictionary * ) controls
{
    if(!_controls)
    {
        _controls = [[NSMutableDictionary alloc] init];
    }
    
    return _controls;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startup) name:DOCUMENT_READY object:nil];
    
    [self startup];
}

//startup operations
//initializes all controlls for the application and stores them in the dict
- (IBAction)startup
{
    [aLaCardManager sharedALaCardManager];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"iPhone" bundle:nil];
    self.topViewController = [storyboard instantiateViewControllerWithIdentifier:ACCOUNT_CONTROLLER];
    
    [self.controls setObject:self.topViewController forKey:ACCOUNT_CONTROLLER];
    [self.controls setObject:[storyboard instantiateViewControllerWithIdentifier:ABOUT_CONTROLLER] forKey:ABOUT_CONTROLLER];
    [self.controls setObject:[storyboard instantiateViewControllerWithIdentifier:HISTORY_CONTROLLER] forKey:HISTORY_CONTROLLER];
}



@end
