## Files

*Available modes of operation: batch/async*

The Files endpoint accepts a raw ASC X12 EDI file for processing. This is
included for legacy purposes, and it is highly recommended that you consider
using one of the other endpoints that accept JSON request payloads.

Endpoint | HTTP Method | Description
-------- | ----------- | -----------
/files/ | POST | Submit a EDI file to the specified trading partner for processing.