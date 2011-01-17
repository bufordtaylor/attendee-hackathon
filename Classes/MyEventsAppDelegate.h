//
//  MyEventsAppDelegate.h
//  MyEvents
//
//  Created by Kiel Oleson on 2010-11-27.
//  Copyright 2010 Eventbrite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MyEventsXMLParser.h"
#import "MyEventsAppDelegate.h"
#import "State.h"


@class MainViewController;

@interface MyEventsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    NSManagedObjectContext *managedObjectContext;
    NSManagedObjectModel *managedObjectModel;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    MainViewController *mainViewController;
    State * state;
    MyEventsXMLParser * parser;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain, readonly) State * state;

- (NSString *)applicationDocumentsDirectory;

@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end
