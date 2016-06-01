## Cash Prices
> Example fetching cash price information:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/prices/cash?cpt_code=87799&zip_code=32218
```

```python
pd.cash_prices(zip_code='32218', cpt_code='97001')
```

```ruby
pd.cash_prices({ zip_code: '32218', cpt_code: '87799'})
```

```csharp
client.pricesCash(
    new Dictionary<string, string> {
        { "zip_code", "32218" },
        { "cpt_code", "87799" }
});
```

```java
HashMap<String, String> query = new HashMap<String, String>();
query.put("zip_code", "32218");
query.put("cpt_code", "87799");

Map<String, Object> results = pd.cashPrices(query);
```


*Available modes of operation: real-time*

The Cash Prices endpoint allow access to our internal collection of pricing
data. The data comes from actual providers selling actual services. For a
location where a cash price has not been collected, a price is estimated using a
multivariate model.

While the endpoint requires a five-digit zip code, only the first three digits
are significant. This is because the index is only granular to the first three
digits of the zip code, commonly called a "geozip" or a "ZIP Code Prefix". These
three digits refer to the geographical regions surrounding major cities or
metropolitan areas. There are approximately 900 "geozips" in the United States.

| Endpoint     | HTTP Method | Description                                                                                 |
|:-------------|:------------|:--------------------------------------------------------------------------------------------|
| /prices/cash | GET         | Return a list of prices for a given procedure (by CPT Code) in a given region (by ZIP Code) |

The /prices/cash endpoint accepts the following parameters:

| Parameter| Type     | Description                                |
|:---------|:---------|:-------------------------------------------|
| cpt_code | {string} | The CPT code of the procedure in question  |
| zip_code | {string} | Zip code in which to search for procedures |

The /prices/cash response contains the following fields:

| Field                  | Type      | Description                                                               |
|:-----------------------|:----------|:--------------------------------------------------------------------------|
| average_price          | {decimal} | The average cash price for the procedure                                  |
| cpt_code               | {string}  | The CPT code of the procedure                                             |
| pokitdok_procedure_urn | {string}  | A URN that uniquely identifies the procedure                              |
| procedure_description  | {string}  | The description of the procedure                                          |
| geo_zip_area           | {string}  | The three character zip code tabulation area code                         |
| high_price             | {decimal} | The maximum price for the procedure                                       |
| low_price              | {decimal} | The lowest price for the procedure                                        |
| median_price           | {decimal} | The median price for the procedure                                        |
| standard_deviation     | {decimal} | The standard deviation, or variation measure, of prices for the procedure |

Currently the Cash Prices endpoint only supports the top fifty procedures. A list of these procedures and their corresponding cpt_codes can be seen below.

<a name="cpt_codes"></a>

| Procedure              												| cpt_code      | 
|:----------------------------------------------------------------------|:--------------|
| Botox Injections      												| 64612		    |
| Skin Tag Removal      												| 11200		    |
| Carotid Duplex Ultrasound  											| 93880		    |
| Urgent Care Visit      												| 99203		    |
| MRI (Knee)		      												| 73721		    |
| Pap Smear/ Gynecological Exam      								    | 88142		    |
| Total Hip Replacement      						  					| 27130		    |
| Breast Augmentation      												| 19325		    |
| EKG				      												| 93000		    |
| Annual Physical Exam      											| 99385		    |
| Physical Therapy Session      					  					| 97001		    |
| Lasik Surgery - Double Eye 											| 65760		    |
| Desensitization/ Immune Therapy      									| 95115		    |
| Reclast Infusion      												| 96365		    |
| PSA Blood Test & DRE Exam (Prostate Cancer Screening) 				| 84153		    |
| Echocardiogram	      												| 93306		    |
| X-ray (Lumbar spine)      											| 72100		    |
| Flu Shot			      												| 90658		    |
| Rotator Cuff Surgery      											| 29827		    |
| Psychiatric Consultation      										| 90791		    |
| Allergy Testing       												| 95017		    |
| Cataract Surgery      												| 66984		    |
| Shoulder Scope        												| 29805		    |
| Gastric Bypass         												| 43846		    |
| Septorhinoplasty (Nasal Obstruction)      							| 30420		    |
| Blepharoplasty (Eyelid)  												| 15822		    |
| Facelift (forehead)     												| 15824		    |
| Polysomnogram (Sleep Study)      										| 95810		    |
| In-vitro Fertilization     											| 58970		    |
| Cesarean Section      												| 59510		    |
| Total Knee Replacement      											| 27447		    |
| Lap Band Surgery      												| 43770		    |
| Colonoscopy		      												| 45378		    |
| Lithotripsy (Kidney Stone)      										| 50590		    |
| CT Scan (Chest)     	 												| 71250		    |
| Ultrasound Abdomen Complete      										| 76700		    |
| Ultrasound Right Upper Quadrant (Gallbladder)      					| 76705		    |
| Holter Monitor (24 hour)      										| 93224		    |
| Chiropractic Visit      												| 98940		    |
| Prenatal Example      												| 59426		    |
| Mammogram			      												| 77051		    |
| Cardiac Stress Test      												| 93015		    |
| Trigger Point Injection      											| 20552		    |
| Testosterone/ Erectile Dysfunction Evaluation   						| 84402		    |
| Lipid Profile		      												| 80061		    |
| Myringotomy Tubes (Ear Tubes)      									| 69436		    |
| Wart Removal      													| 17110		    |
