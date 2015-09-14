# API Callbacks

Some API activities, like claims, may take some time to process.  We offer API callbacks to help you avoid
polling the activities API to check for results to your requests.  If you'd like to use API callbacks in your
application, be sure to include a callback_url parameter in your API requests.  As responses are received from a trading
partner, we'll post the activity information back to the callback_url specified in your original API request.
The body of each callback POST request will be the same JSON representation of an activity that you'd receive from the
activities API.  Most activities will only receive one callback when a response is received and the activity is completed.
However, the claims API is an exception.  Some applications may receive additional callbacks on their claims requests
when they've registered for 835 processing.  Those applications will receive a callback when the initial claims
acknowledgement is received from the trading partner.  They'll also receive another callback when the claim payment
data is received.  The most recent information will always be present in the result field of the activity POSTed
to the callback URL.

https is required for all callback_url values.  Application developers may also choose to restrict their API callbacks
to a specific network location and use basic http authentication to protect their callback endpoints.
If you wish to enable those additional security settings for API callbacks, you may do so by editing your App details
in the API Dashboard.


If you're testing API callbacks on claims API requests using the MOCKPAYER trading partner id, you can get a second
callback that simulates claim payment results by adding
```
    "application_data": {
        "mock_claim_payment": true
    }
```
to your claims API test requests.