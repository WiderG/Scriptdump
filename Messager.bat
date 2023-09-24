@echo off
setlocal enabledelayedexpansion

:: Set your Discord webhook URL here
set "webhook_url=YOURWEBHOOKHERE"

:loop
:: Prompt the user to enter a message
set /p "message=Enter your message (type 'exit' to quit or 'upgrade' to be linked to the newer version of this program.): "

:: Check if the user wants to exit
if "!message!"=="exit" (
    goto :end
)
if "!message!"=="upgrade" (
    start "" https://github.com/WiderG/DiscordWebhookMessager
)

:: Construct the JSON payload
set "payload={""content"": ""!message!""}"

:: Send the POST request using curl
curl -X POST -H "Content-Type: application/json" -d "!payload!" "!webhook_url!"

:: Check for errors
if %errorlevel% neq 0 (
    echo Error: Failed to send message.
) else (
    echo Message sent successfully.
)

:: Repeat the loop
goto :loop

:end
:: Cleanup and exit
echo Exiting...
exit /b 0
