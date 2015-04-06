//
//  ViewController.m
//  SocialMedia
//
//  Created by Cesar Brenes on 3/23/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

- (IBAction)facebookAction:(id)sender {
    NSString *postText = @"Probando publicación en facebook desde dispositivo iOS";
    UIImage *image = self.exampleImage.image;
    
    
    [self shareInFacebook:postText imageToPost:image];
}


-(void)shareInFacebook:(NSString*)postText imageToPost:(UIImage*)imageToPost{
    
//    tenemos facebook logueado en nuestro dispositivo
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        
        SLComposeViewController *facebook = [[SLComposeViewController alloc] init];
        facebook = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebook setInitialText:postText];
        [facebook addImage:imageToPost];
        [self presentViewController:facebook animated:YES completion:nil];
        
        [facebook setCompletionHandler:^(SLComposeViewControllerResult result){
            NSString *output;
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    output = @"El usuario cancelo la publicación";
                    break;
                case SLComposeViewControllerResultDone:
                    output = @"Post Satisfactorio";
                    break;
                default:
                    break;
            }
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook Status" message:output delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
            [alert show];
        }];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Debe autenticarse en su cuenta de facebook desde la sección preferences de su dispositivo" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
        [alert show];
    }
}


- (IBAction)twitterAction:(id)sender {
    NSString *postText = @"Probando publicación en twitter desde dispositivo iOS";
    UIImage *image = self.exampleImage.image;
    [self shareTwitter:postText imagePost:image];
}


-(void)shareTwitter:(NSString*)messageToPost imagePost:(UIImage*)imagePost{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        
        SLComposeViewController *twitter = [SLComposeViewController new];
        twitter = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [twitter setInitialText:messageToPost];
        [twitter addImage:imagePost];
        
        [self presentViewController:twitter animated:YES completion:nil];
        
        [twitter setCompletionHandler:^(SLComposeViewControllerResult result){
            NSString *output;
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    output = @"El usuario cancelo la publicación";
                    break;
                case SLComposeViewControllerResultDone:
                    output = @"Post Satisfactorio";
                    break;
                default:
                    break;
            }
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Twitter Status" message:output delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
            [alert show];
        }];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Debe autenticarse en su cuenta de twitter desde la sección preferences de su disposición" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
        [alert show];
    }

}


- (IBAction)textMessageAction:(id)sender{
    [self shareByMMS:@"83466344" imageToSend:self.exampleImage.image textBody:@"Imagen enviada desde dispositivo iOS" imageName:@"RealMadrid.jpg"];
}


-(void)shareByMMS:(NSString*)phoneNumber imageToSend:(UIImage*)imageToSend textBody:(NSString*)textBody imageName:(NSString*)imageName{
    MFMessageComposeViewController *mms = [MFMessageComposeViewController new];
    [mms setMessageComposeDelegate:(id)self];
    if ([MFMessageComposeViewController canSendText]) {
        NSArray *numbersArray = [[NSArray alloc] initWithObjects:phoneNumber, nil];
        NSData *imageData = UIImagePNGRepresentation(imageToSend);
        [mms addAttachmentData:imageData typeIdentifier:@"imagen" filename:imageName];
        [mms setRecipients:numbersArray];
        [mms setBody:textBody];
        [mms setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        [self presentViewController:mms animated:YES completion:nil];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"El dispositivo no soporta MMS" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil, nil];
        [alert show];
    }
}


-(void)messageComposeViewController:(MFMessageComposeViewController*)controller didFinishWithResult:(MessageComposeResult)result{
    [self dismissViewControllerAnimated:YES completion:nil];

}


- (IBAction)mailAction:(id)sender {
    [self shareEmail:@"cbrenes@lacreativeria.com" imageToSend:self.exampleImage.image textBody:@"Prueba de correo desde dispositivo iOS" subject:@"Prueba iOS" imageName:@"realMadrid"];
}


-(void)shareEmail:(NSString*)address imageToSend:(UIImage*)imageToSend textBody:(NSString*)textBody subject:(NSString*)subject imageName:(NSString*)imageName{

    MFMailComposeViewController *mailController = [MFMailComposeViewController new];
    [mailController setMailComposeDelegate:(id)self];
    NSArray *addressArray = [[NSArray alloc] initWithObjects:address, nil];
    NSData *imageData = UIImagePNGRepresentation(imageToSend);
    [mailController addAttachmentData:imageData mimeType:@"image/png" fileName:imageName];
    
    [mailController setMessageBody:textBody isHTML:NO];
    [mailController setToRecipients:addressArray];
    [mailController setSubject:subject];
    [mailController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:mailController animated:YES completion:nil];
}


-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{

    [self dismissViewControllerAnimated:YES completion:nil];

}



@end
