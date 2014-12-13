//
//  TGLTimeEntryService.h
//  iTogglLib
//
//  Created by Christoph Krautz on 14/09/14.
//  Copyright 2014 Christoph Krautz
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <Foundation/Foundation.h>

#import "TGLTogglClient.h"
#import "TGLTimeEntry.h"

@class TGLTogglClient;

@interface TGLTimeEntryService : NSObject

- (instancetype)initWithClient:(TGLTogglClient *)client NS_DESIGNATED_INITIALIZER;

- (TGLTimeEntry *)currentTimeEntry;
- (NSArray *)entriesBetween:(NSDate *)start And:(NSDate *)end;
- (TGLTimeEntry *)createAndStartTimeEntry:(TGLTimeEntry *)entry;
- (TGLTimeEntry *)stopTimeEntry:(TGLTimeEntry *)entry;
- (TGLTimeEntry *)updateTimeEntry:(TGLTimeEntry *)entry;
- (BOOL)deleteTimeEntry:(TGLTimeEntry *)entry;

@end
