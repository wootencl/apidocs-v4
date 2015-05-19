# JSON And EDI Support
All endpoints that result in the transmission of EDI transaction sets to our
trading partners accept parameters via a JSON representation of an EDI
transaction set. This keeps application developers from having to interact
directly with raw EDI files. However, EDI files can also be sent directly to
our /files/ endpoint. The content-type header of a POST request informs the
endpoint what is being sent. Normal, JSON API requests use a content type of
"application/json", but the /files/ endpoint can use either
"application/edi-x12", "text/plain", or "application/octet-stream" to indicate
that an EDI file is being sent.
