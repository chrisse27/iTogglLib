//
//  TGLProject.h
//  iTogglLib
//
//  Created by Christoph Krautz on 15/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGLProject : NSObject

/* (id)
 */
@property (nonatomic, readonly) NSInteger identifier;

/* The name of the project (string, required, unique for client and workspace)
 */
@property (nonatomic, readonly) NSString *name;

/* workspace ID, where the project will be saved (wid, integer, required)
 */
@property (nonatomic, readonly) NSInteger workspaceId;

/* client ID (cid, integer, not required)
 */
@property (nonatomic, readonly) NSInteger clientId;

/* whether the project is archived or not (boolean, by default true)
 */
@property (nonatomic, readonly) BOOL active;

/* whether project is accessible for only project users or for all workspace users (is_private, boolean, default true)
 */
@property (nonatomic, readonly) BOOL isPrivate;

/* whether the project can be used as a template (boolean, not required)
 */
@property (nonatomic, readonly) BOOL template;

/* id of the template project used on current project's creation (template_id)
 */
@property (nonatomic, readonly) NSInteger templateId;

/* whether the project is billable or not (boolean, default true, available only for pro workspaces)
 */
@property (nonatomic, readonly) BOOL billable;

/* whether the estimated hours is calculated based on task estimations or is fixed manually (auto_estimates, boolean, default false, not required, premium functionality)
 */
@property (nonatomic, readonly) BOOL autoEstimates;

/* if auto_estimates is true then the sum of task estimations is returned, otherwise user inserted hours (estimated_hours, integer, not required, premium functionality)
 */
@property (nonatomic, readonly) NSInteger estimatedHours;

/* timestamp that is sent in the response for PUT, indicates the time task was last updated (read-only)
 */
@property (nonatomic, readonly) NSDate *at;

/* id of the color selected for the project
 */
@property (nonatomic, readonly) NSInteger color;

/*  hourly rate of the project (float, not required, premium functionality)
 */
@property (nonatomic, readonly) float rate;

/* timestamp indicating when the project was created (UTC time) (created_at, read-only)
 */
@property (nonatomic, readonly) NSDate *createdAt;

@end
