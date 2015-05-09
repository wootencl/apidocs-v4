# Overview

The PokitDok API allows you to perform X12 transactions, find healthcare providers, and get information on health care 
procedure pricing. The API uses JavaScript Object Notation ([JSON](http://json.org/)) for requests and responses and 
also allows batch processing of [ASC X12](http://x12.org/) 5010 compatible [EDI](http://www.x12.org/about/faqs.cfm#a1) 
files. All API traffic is encrypted over HTTPS and authentication is handled with OAuth2.

The API is designed according to REST (Representational State Transfer) principles. The available API calls are 
organized into Resources. These resources are represented by endpoints that clients can invoke to describe and modify 
their state. All resources have the same available top level parameters available for finer grained access.
