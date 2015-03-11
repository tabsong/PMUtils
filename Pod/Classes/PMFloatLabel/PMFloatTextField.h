//
//  PMFloatLabel.h
//  Pods
//
//  Created by Peter Meyers on 1/9/15.
//
//

#import <UIKit/UIKit.h>

@class PMFloatTextField;
@protocol PMFloatTextFieldDelegate <UITextFieldDelegate>


/**
 *  Asks the delegate if a given float text field should allow the float label to appear
 *  above the text view.
 *
 *  @param floatTextField The float text view to show or not show the floating label above
 *  @param isText         YES if the float text field's text property will have any contents. Otherwise NO.
 *  @param isEditing      YES if the float text field has first responder status. Otherwise NO.
 *
 *  @return A boolean indicating whether the float text field should allow the float label to appear.
 */
- (BOOL) floatTextField:(PMFloatTextField *)floatTextField shouldShowFloatLabelWithText:(BOOL)isText editing:(BOOL)isEditing;

@optional

/**
 *  Tells the delegate a swipe cell changed the position of its content view.
 *
 *  @param cell     The swipe cell whose content view moved to a new position.
 *  @param position The new position of the content view.
 */
/**
 *  Asks the delegate for a CGFloat defining the vertical spacing between the bottom of the 
 *  float label and the top of the float text field.
 *
 *  @param floatTextField The float text field to space the float label with.
 *  @param isEditing      A boolean indicating whther the flaot text field has first responder status.
 *
 *  @return A CGFloat indicating the vertial distance of the float label above the float text field.
 */
- (CGFloat) floatTextField:(PMFloatTextField *)floatTextField floatLabelVerticalSpacing:(BOOL)isEditing;

/**
 *  Asks the delegate to provide an attributed string to apply to the float label that is displayed
 *  above the float text field.
 *
 *  @param floatTextField The float text field to display a float label over.
 *  @param isEditing      A boolean indicating whther the flaot text field has first responder status.
 *
 *  @return An attributed string that will be applied to the float label that is displayed
 *  above the float text field.
 */
- (NSAttributedString *) floatTextField:(PMFloatTextField *)floatTextField floatLabelAttributedString:(BOOL)isEditing;

@end


@interface PMFloatTextField : UITextField

/**
 *  The object that acts as the delegate of the float text field. The delegate must adopt
 *	the PMFloatTextFieldDelegate protocol. The float text field maintains a weak reference to the delegate object.
 */
@property(nonatomic, weak) id<PMFloatTextFieldDelegate> delegate;

@end
