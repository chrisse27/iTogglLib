//
//  TGLProject+Json.m
//  iTogglLib
//
//  Created by Christoph Krautz on 15/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLProject+Json.h"

#import "TGLTogglClient.h"

static NSString * const TGLJsonKeyProjectIdentifier = @"id";
static NSString * const TGLJsonKeyProjectName = @"name";
static NSString * const TGLJsonKeyProjectColor = @"color";

@implementation TGLProject (Json)

+ (TGLProject *)projectFromDictionary:(NSDictionary *)dictionary
{
    TGLProject *project = [[TGLProject alloc] init];
    
    project.identifier = [[dictionary objectForKey:TGLJsonKeyProjectIdentifier] integerValue];
    project.name = [dictionary objectForKey:TGLJsonKeyProjectName];
    project.color = [[dictionary objectForKey:TGLJsonKeyProjectColor] integerValue];
    
    return project;
}

@end
