# Import the required module for sending email
Import-Module -Name "Microsoft.PowerShell.Utility"

# Define the email template
$emailSubject = "Welcome to our Newsletter!"
$emailBody = @"
Dear [Name],

Thank you for subscribing to our newsletter. We will keep you updated on the latest news and promotions.

Best regards,
The Newsletter Team
"@

# Read the CSV file containing the list of recipients
$recipients = Import-Csv -Path "C:\Path\To\Recipients.csv"

# Loop through each recipient and send the email
foreach ($recipient in $recipients) {
    $name = $recipient.Name
    $email = $recipient.Email

    # Replace the [Name] placeholder in the email body with the recipient's name
    $formattedEmailBody = $emailBody -replace "\[Name\]", $name

    # Send the email
    Send-MailMessage -To $email -From "newsletter@example.com" -Subject $emailSubject -Body $formattedEmailBody -SmtpServer "smtp.example.com"
}
