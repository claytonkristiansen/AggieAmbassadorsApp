<!DOCTYPE html>
<html>
  <head>
    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
  </head>
  <body>
    <h1>Reminder that <%= @event.title %></h1>
    <p>
      The meeting will take place at <%= @event.location %> at <%= @event.event_date %>, <%= @event.event_time %><br>
    </p>
    <p>Confirm at </p>
    <p>Thanks and have a great day!</p>
  </body>
</html>