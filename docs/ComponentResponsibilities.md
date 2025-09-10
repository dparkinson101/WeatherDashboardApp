# Component Documentation

## SearchBar
The location search bar component that allows the users to search and select their location.
### SearchView
Comprised of a text input bar, a selector for the time peroid, and a submit button, this sends off the location info to the ViewModel with a submition signal.
### SearchViewModel
The ViewModel processes the following signals / slots:
- `Location submition event`
- `Location resolution event`
- `Weather submition event`

It is in charge of resolving the location to a corrrasponding location code and then using that in the WeatherAPIModel request to resolve the weather of that location.

## WeatherDisplay
The weather display is in charge of showing the current weather for a resolved location and displaying the weather in a grid according to the time peroid requested.

It listens to the following slots:
- `Weather resolution event`

## Additional Models
### LocationAPIModel
The location api model is in charge of resolving the plaintext name to an API location code that can we used in the weather request.
### WeatherAPIModel
The weather api model is in charge of using the current location and weather prediction peroid to request the weather report. It also sends out the `Weather resolution event`