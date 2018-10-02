# Amazon AWS Simple Email Service (SES)

## How to generate new SMTP credentials

Important to note, as stated on the AWS UI, SMTP credentials are not the same as IAM credentials!
You'll have to create an IAM user but **the SMTP credentials have to be generated via SES, not via IAM!**

To do that:

1. Open SES in AWS Console
1. Select SMTP Settings in the left sidebar
1. Click the Create my SMTP Credentials button
1. Follow the guide to create a new IAM user, and store the generated SMTP credentials

This should be clear if you can read (unlike me :P) :

IMG

Of course it's not exactly obvious, as an actual IAM user will be created, with an actual IAM policy:

So you'd think that if you attach the IAM policy to a user that should allow you
to send emails via SMTP using the IAM user's credentials.
That is not the case, SMTP credentials != the IAM credentials,
you always have to create it from the SES SMTP Settings dashboard/page!
