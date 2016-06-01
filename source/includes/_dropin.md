# Drop-in UI
The PokitDok Drop-in UI enables anyone to add eligibility checks to their own website with a fully styled and functional UI.

* Patient eligibility in seconds
* One simple drop-in with full customization
* All major insurance carriers
* Detailed info including deductible status and co-pays


## Get Client ID
First you will need to <a href='https://platform.pokitdok.com/signup' target='_blank'>sign up for a PokitDok Platform account</a> and grab your ```Client ID``` from the Platform dashboard.


## Configure HTML

```html
<script src="pokitdok.js"></script>
```

Download the `pokitdok.js` file <a href="">here</a> and include it in your website.


```html
<div id="dropin-ui"></div>
```

Then add a container with a specific ID that will house your drop-in UI.


## Configure Javascript

```javascript
PokitDok.dropin(<INSERT YOUR CLIENT ID HERE>, {
   container: 'dropin-ui'
   type: 'eligibility'
})
```

Call the `PokitDok.dropin` function, using your PokitDok Platform `Client ID` and <a href='/#options'>options</a>.

You can also configure the drop-in on the <a href='https://platform.pokitdok.com' target='_blank'>Platform dashboard</a>.

## Options

> Example with options:

```javascript
Pokitdok.dropin(<INSERT YOUR CLIENT ID HERE>, {
    container: 'dropin-ui',
    type: 'eligibility',
    onFormSuccess: function() {
        // do stuff here
    },
    onFormLoad: function() {
        // do stuff here
    }
}
```

`container` and `type` are required options for the drop-in UI to work.

Name              | Description
------------------|--------------------------------------------------------------------------------------
container         | The id of the HTML container that the drop-in UI will be housed in.
type              | The only type of drop-in UI currently supported is `eligibility`
onFormSuccess     | Function that gets called when the form has been submitted successfully
onFormLoad        | Function that gets called when the form has been loaded successfully
