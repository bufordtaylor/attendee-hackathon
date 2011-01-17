//
//  MyEventsAppDelegate.m
//  MyEvents
//
//  Created by Kiel Oleson on 2010-11-27.
//  Copyright 2010 Eventbrite. All rights reserved.
//

#import "MyEventsAppDelegate.h"

#import "MainViewController.h"

@implementation MyEventsAppDelegate


@synthesize window;

@synthesize mainViewController;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
    // Add the main view controller's view to the window and display.
    [window addSubview:mainViewController.view];
    [window makeKeyAndVisible];
    
    
    if ([[self state] currentAttendee] == nil) {
        [[self state] setCurrentAttendee:(Attendee *)[NSEntityDescription insertNewObjectForEntityForName:@"Attendee" inManagedObjectContext:[self managedObjectContext]]];
    }
    
    parser = [[MyEventsXMLParser alloc] init];
    
    NSXMLParser * actualParser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"localtestdata" ofType:@"xml"]]];
    [actualParser setDelegate:parser];
    [actualParser parse];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {

    // Saves changes in the application's managed object context before the application terminates.
    NSError *error = nil;
    if (managedObjectContext) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

- (void) applicationDidEnterBackground:(UIApplication *)application {
    
    // Saves changes in the application's managed object context before the application terminates.
    NSError *error = nil;
    if (managedObjectContext) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

- (void)dealloc {

    [window release];
    [managedObjectContext release];
    [managedObjectModel release];
    [persistentStoreCoordinator release];
    [mainViewController release];
    [super dealloc];
}

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext {
    
    if (managedObjectContext) {
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel {
    
    if (managedObjectModel) {
        return managedObjectModel;
    }
    managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
    return managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (persistentStoreCoordinator) {
        return persistentStoreCoordinator;
    }
    
    NSURL *storeUrl = [NSURL fileURLWithPath:[[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"MyEvents.sqlite"]];
    
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible
         * The schema for the persistent store is incompatible with current managed object model
         Check the error message to determine what the actual problem was.
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return persistentStoreCoordinator;
}

#pragma mark -
#pragma mark Application's Documents directory

/**
 Returns the path to the application's Documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (State *) state {
    if (state) {
        return state;
    }
    // pull state from persistent store.
    NSEntityDescription * stateEntity = [NSEntityDescription entityForName:@"State" inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity:stateEntity];
    
    NSError * error;
    NSArray * results = [self.managedObjectContext executeFetchRequest:request error:&error];
    [request release];
    State * newState = nil;
    
    if ([results count] > 1) {
        NSLog(@"MULTIPLE SYSTEM STATES OH NOOOOOES");
    }
    else if ([results count] == 0) {
        NSLog(@"No existing system state - creating one.");
        newState = (State *)[NSEntityDescription insertNewObjectForEntityForName:@"State" inManagedObjectContext:self.managedObjectContext];
    }
    else {
        NSLog(@"found a state");
        newState = [results objectAtIndex:0];
    }
    state = newState;
    NSLog(@"retaining state");
    [state retain];
    return state;
}



@end
