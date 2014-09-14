//
//  TGLTimeEntryService.h
//  iTogglLib
//
//  Created by Christoph Krautz on 14/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TGLTogglClient.h"
#import "TGLTimeEntry.h"

@class TGLTogglClient;

@interface TGLTimeEntryService : NSObject

- (instancetype)initWithClient:(TGLTogglClient *)client;

- (TGLTimeEntry *)currentTimeEntry;
- (NSArray *)entriesBetween:(NSDate *)start And:(NSDate *)end;
- (TGLTimeEntry *)createAndStartTimeEntry:(TGLTimeEntry *)entry;
- (TGLTimeEntry *)stopTimeEntry:(TGLTimeEntry *)entry;

@end
