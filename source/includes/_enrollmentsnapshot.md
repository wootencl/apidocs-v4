## Enrollment Snapshot
> Example submitting an enrollment snapshot for the MOCKPAYER trading partner

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" -XPOST -F file=@current_membership_enrollment.834 -F trading_partner_id=MOCKPAYER  https://platform.pokitdok.com/api/v4/enrollment/snapshot
```
```python
pd.enrollment_snapshot('MOCKPAYER', '/path/to/current_membership_enrollment.834')
```

> example fetching a list of enrollment snapshots owned by the current application

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/enrollment/snapshot
```
```python
#retrieve an index of enrollment snapshots
pd.enrollment_snapshots()
```

> example fetching information for a specific enrollment snapshot owned by the current application

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/enrollment/snapshot/5317f51527a27620f2ec7533
```
```python
#get information for a specific enrollment snapshot
pd.enrollment_snapshots(snapshot_id='5317f51527a27620f2ec7533')
```

> example fetching enrollment data associated with a specific enrollment snapshot owned by the current application

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/enrollment/snapshot/5317f51527a27620f2ec7533/data
```
```python
#get information for a specific enrollment snapshot
pd.enrollment_snapshot_data('5317f51527a27620f2ec7533')
```


*Available modes of operation: batch/async only*

The enrollment snapshot endpoint allows client applications to establish the current state of benefits enrollment for a
group that will be managed via the [enrollment](#benefits-enrollment) endpoint.
Many enrollment trading partners require full X12 834 files to be delivered each time changes are made to membership
information for a group.  The enrollment snapshot functionality allows you to easily establish the current state of a
group using your application such that you can focus on making [enrollment](#benefits-enrollment) requests when new members are added
or when existing members need to make changes.  All of the trading partner specifics around the handling of full files
will be handled in the background for your application.  Typically, the enrollment snapshot functionality will be used
when your application first begins handling enrollment transactions for a group.  As enrollment transactions are acknowledged
by a trading partner, new enrollment snapshots are automatically created to reflect the current state of benefits enrollment
for the group.

Enrollment snapshot may also be used periodically to synchronize with another membership system or as part of an audit.
Many applications may find that they only need to use enrollment snapshot once for each group using their application
and then they can move forward making only [enrollment](#benefits-enrollment) API requests to manage additions, changes
and terminations. Applications may also find the enrollment snapshot index and data access suitable for providing
point-in-time reporting for groups using their system.


Endpoint | HTTP Method | Description
-------- | ----------- | -----------
/enrollment/snapshot | POST | Submit a X12 834 file as the current snapshot of a group's benefits enrollment data
/enrollment/snapshot | GET  | List enrollment snapshots owned by the current application
/enrollment/snapshot/{id} | GET  | Get information about a specific enrollment snapshot owned by the current application
/enrollment/snapshot/{id}/data | GET  | List enrollment data associated with a specific enrollment snapshot owned by the current application

The enrollment snapshot endpoint requires these parameters when creating a new enrollment snapshot:

| Parameters                                 | Description                                                               |
|:-------------------------------------------|:--------------------------------------------------------------------------|
| file                                       |  X12 834 file containing the full benefits enrollment for a group         |
| trading_partner_id                         |  the id of the trading partner to be associated with this enrollment data |

