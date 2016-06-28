//
//  AppDelegate.m
//  BlockHomework
//
//  Created by Stepan Paholyk on 6/28/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

typedef void (^blockWithoutArgAndParam)(void);
typedef void (^blockWithArg)(NSString*);

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // level 1
    void (^blockWithoutArgAndParam)(void);  // def
    blockWithoutArgAndParam = ^{
        NSLog(@"blockWithoutArgAndParam");  // init (def and init can be implement in 1 step)
    };
    blockWithoutArgAndParam();              // call
    
    void(^blockWithArg)(NSString*);
    
    blockWithArg = ^(NSString* str) {
        NSLog(@"%@", str);
    };
    
    blockWithArg(@"Hello block with param");
    
    blockWithArg =^ (NSString* tempStr) {
        NSLog(@"%@", tempStr);
    };
    
    blockWithArg(@"Hello block with param via typedef");
    
    [self testBlockMethod:^{
        NSLog(@"Block");
    }];
    
    // level 2
    
    Student* student1 = [[Student alloc] init];
    student1.firstName = @"Frank";
    student1.lastName = @"Underwood";
    
    Student* student2 = [[Student alloc] init];
    student2.firstName = @"Damion";
    student2.lastName = @"Murraylar";
    
    Student* student3 = [[Student alloc] init];
    student3.firstName = @"Morgan";
    student3.lastName = @"Latson";
    
    Student* student4 = [[Student alloc] init];
    student4.firstName = @"Rolando";
    student4.lastName = @"Lanning";
    
    Student* student5 = [[Student alloc] init];
    student5.firstName = @"Caprice";
    student5.lastName = @"Latson";
    
    Student* student6 = [[Student alloc] init];
    student6.firstName = @"Nida";
    student6.lastName = @"Bence";
    
    Student* student7 = [[Student alloc] init];
    student7.firstName = @"Clar";
    student7.lastName = @"Underwood";

    NSArray* classRoom = [[NSArray alloc] initWithObjects:student1, student2, student3, student4, student5, student6, student7, nil];
    
    NSArray* sortedClassRoom = [classRoom sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([[obj1 lastName] isEqualToString:[obj2 lastName]]) {
            return [[obj1 firstName] compare:[obj2 firstName]];
        } else {
            return [[obj1 lastName] compare:[obj2 lastName]];
        }
    }];
    
    for (Student* fellow in sortedClassRoom) {
        NSLog(@"%@ %@", fellow.firstName, fellow.lastName);
    }
    
    return YES;
}

- (void) testBlockMethod:(void(^)(void)) testBlock {
    testBlock();
    NSLog(@"Block via method");
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
