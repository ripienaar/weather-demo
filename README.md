What?
=====

Ruby app used to do demos in talks


Signup with forecast.io and get a API key then run:

```
FORECAST_API=your_key FORECAST_LON=35.897778 FORECAST_LAT=14.5125 FORECAST_LOCATION="Valletta, Malta" bundle exec ruby config.ru -p 9292 -o 0
```

And get a weather forecast for your location
