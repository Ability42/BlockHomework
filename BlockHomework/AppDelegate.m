//
//  AppDelegate.m
//  BlockHomework
//
//  Created by Stepan Paholyk on 6/30/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "AppDelegate.h"
#import "Patient.h"

@interface AppDelegate ()

@property (strong,nonatomic) NSArray *patientArray;

@end

typedef NSString * (^TestBlockParam)(NSString * str);
typedef  void (^PatientBlock)(Patient * patient);

#define MIN_TEMP 35.f
#define MAX_TEMP 42.f

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

/* Patient treat block */
    
    PatientBlock doctorsBlock =^ (Patient * patient) {
        
        if (patient.temperature < 36.9f) {
            [patient takePill];
        } else if (patient.temperature >= 36.9f ) {
            [patient makeShot];
        }
    };
    
    Patient* patient1 = [Patient paitentWithName:@"Vova" temperature:36.5f andBlock:doctorsBlock];
    
    Patient* patient2 = [Patient paitentWithName:@"Petya" temperature:40.2f andBlock:doctorsBlock];
    
    Patient* patient3 = [Patient paitentWithName:@"Dima" temperature:42.0f andBlock:doctorsBlock];
    
    Patient* patient4 = [Patient paitentWithName:@"Sasha" temperature:35.5f andBlock:doctorsBlock];
    
    _patientArray = @[patient1, patient2, patient3, patient4];
    
    
    
    return YES;
}

- (float)randFloatMin:(float)low andMax:(float)high {
    float diff = high - low;
    float new = (((float) rand() / RAND_MAX) * diff) + low;
    return round(10 * new) / 10;
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
