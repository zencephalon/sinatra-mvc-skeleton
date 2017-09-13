Weather
===

## Deployment

https://weather--sms.herokuapp.com

## Description
**Get Weather Forecast via SMS!**

Weather is a fully responsive forecast application that utilizes Twilio and WU APIs, enabling users(registered with valid US phone number) to check weather using text messaging, when no internet is available or just for convenience.
The forecasts available to all users are: 5 day, 10 day, hourly 5 day and hourly 10 day. In addition forecast history can be traced back up to 60 years for some cities. Registered users have the option to check their search history and edit or delete their accounts.

## Interface

<p align="center">
<img src="/screenshots/index.png">
Upon opening the application users can directly check forecast for any city or register to use the SMS option.
</p>

<p align="center">
<img src="/screenshots/register.png">
  Register page with some info.  
</p>

<p align="center">
<img src="/screenshots/fiveday.png">
  Five day forecast.  
</p>

<p align="center">
<img src="/screenshots/midviewoftenday.png">
  Mid view of ten day forecast.  
</p> 

<p align="center">
<img src="/screenshots/historyform.png">
  Form to check history.  
</p>

<p align="center">
<img src="/screenshots/historyinfo.png">
  History info for the date selected.  
</p>

<p align="center">
<img src="/screenshots/mobileregister.png"><br>
Mobile view of the register form.
</p>

<p align="center">
<img src="/screenshots/mobileprofile.png"><br>
Mobile view of the user profile page.
</p>


## Tech Stack
Ruby, JavaScript, Jquery, Sinatra, HTML5, CSS3, WU and Twilio API
### Dependencies for local development:

* Ruby (2.3.1)
* Sinatra (1.4.7)