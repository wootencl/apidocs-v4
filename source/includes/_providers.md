## Providers
> example fetching provider information by NPI:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/providers/1467560003
```
            
> example searching providers by zipcode and specialty:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/providers/?zipcode=29307&specialty=rheumatology&radius=20mi
```
*Available modes of operation: real-time only*

The Providers endpoints provide access to PokitDok's provider directory.
The Providers endpoints can be used to search for Providers, view biographical,
education and credential information, and view specialty taxonomies. Any of
the above listed keywords can be used to show additional fields, perform
searches, and page through results.

Available Provider Endpoints:

Endpoint | HTTP Method | Description
-------- | ----------- | -----------
/providers/ | GET | Get a list of providers meeting certain search criteria
/providers/{id} | GET | Retrieve the data for a specified provider; the ID is the provider's NPI

The /providers/ endpoint accepts the following search parameters:

Field | Type | Description
----- | ---- | -----------
city | {string} | Name of city in which to search for providers (e.g. "San Mateo" or "Charleston")
first_name | {string} | The provider's first name
last_name | {string} | The provider's last name
organization_name | {string} | The business practice name
radius | {string} | Search distance from geographic centerpoint, with unit (e.g. "1mi")
specialty | {string} | The provider's specialty name (e.g. "RHEUMATOLOGY")
state | {string} | Name of U.S. state in which to search for providers (e.g. "CA" or "SC")
zipcode | {string} | Geographic center point in which to search for providers (e.g. "94401")
sort | {string} | Accepted values include 'distance' (default) or 'rank'.  'distance' sort requires city & state or zipcode parameters otherwise sort will be 'rank'.


The response from the /providers/ endpoints contain the following fields:

Field | Type | Description
----- | ---- | -----------
provider.birth_date | {string} | The provider's birth year
provider.board_certifications | {array} | The provider's board certifications
provider.board_subcertifications | {array} | The provider's board sub-certifications
provider.degree | {string} | The provider's degree ("MD" or "DO")
provider.education | {dict} | The provider's medical school and graduation year
provider.fax | {string} | The provider's fax number
provider.first_name | {string} | The provider's first name
provider.gender | {string} | The provider's gender
provider.last_name | {string} | The provider's last name
provider.licenses | {array} | Additional license information
provider.licensures | {array} | State licensure dates, numbers, and activation status
provider.locations | {array} | List of locations associated with the provider. Each location object includes address information with geocode data, fax, and phone when available. The role of the location is also included (e.g. "practice" and/or "mailing" )
provider.middle_name | {string} | The provider's middle name
provider.npi | {string} | The provider's NPI
provider.organization_name | {string} | The business practice name
provider.phone | {string} | The provider's phone number
provider.prefix | {string} | The provider's prefix (Mr., Mrs., Dr., etc)
provider.residencies | {array} | Provider residency and fellowship information
provider.specialty | {array} | List of specialties from the specialty taxonomy associated with the provider
provider.specialty_primary | {array} | List of provider's primary specialties
provider.specialty_secondary | {array} | List of provider's secondary specialties
provider.suffix | {string} | The provider's suffix (MD, Jr., etc)
provider.uuid | {uuid} | The provider's unique PokitDok Platform identifier
provider.verified | {boolean} | Provider PokitDok verification status
provider.description | {string} | Optional: (verified providers only) Provider full-text description
provider.facebook_url | {string} | Optional: (verified providers only) Provider Facebook URL
provider.small_image_url | {string} | Optional: (verified providers only) Provider small image URL
provider.twitter_url | {string} | Optional: (verified providers only) Provider Twitter URL
provider.website_url | {string} | Optional: (verified providers only) Provider website URL
distance | {string} | When sort is 'distance' (default) this is the distance from the city & state or zipcode centroid
