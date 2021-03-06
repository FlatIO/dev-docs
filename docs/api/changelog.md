---
title: Flat REST API Changelog
description: Discover the latest changes of Flat's REST API
permalink: api/changelog.html
nav: rest
pid: api-changelog
---

We regularly update our API and services, you can discover all the changes to our public specification. While we try to avoid breaking changes during the Beta Period, they will be written below in bold if any.

## Upcoming deprecations

* After 2020-03-01:
  * `GET /users/{user}/scores` will no longer list private and shared scores, but only public scores of a Flat account.

## v2.12.0 (2021-02-18)

* update(scores): `ResourceCollaborator` now includes a `invited` boolean property to know if the collaborator is still a pending invite.
* feat(assignments): Export grades as CSV and Excel files (`GET /classes/{class}/assignments/{assignment}/submissions/csv` and `/classes/{class}/assignments/{assignment}/submissions/excel`)
* update(assignments): Assignment creation (`POST /classes/{class}/assignments`) and assignments objects now include a `type` (`AssignmentType`).
* update(assignments): Assignments objects (`Assignment`) now include a cover URL (`cover`) and the corresponding file identifier (`coverFile).
* update(assignments): Assignment copy (`POST /classes/{class}/assignments/{assignment}/copy`) now accepts an optional `assigment` identifier. This can be used to override a draft assignment with the content from another assignment.
* style: Lint OpenAPI v3 specification

## v2.11.0 (2020-10-26)

* feat(edu): `PUT /organizations/users/{user}` has new parameters to edit accounts: `username`, `firstname`, `lastname`, `email`.
* feat(edu): `POST /classes/{class}/assignments` has new parameters:
  * `toolset` id to enable [a toolset](https://flat.io/help/en/education/toolset.html) for the assignment.
  * `nbPlaybackAuthorized` to limit the number of time the playback can be used
  * `maxPoints` for grading purpose
  * `googleClassroom.topicId` to add the assignment under a specific Google Classroom course topic
  * `assigneeMode` and `assignedStudents` to assign specific students
  * `lockScoreTemplate` to lock assigned templates
  * `dueDate` and `scheduledDate` are nullable to unset properties
  * returns new information about LTI assigments, Canvas assignments and MusicFirst assignments
* feat(edu): `PUT /classes/{class}/assignments/{assignment}/submissions` has:
  * New parameters for grading (`draftGrade`, `grade`)
  * A new parameter for teacher to return a submission (`return`) and
  * Computed comments counters (`comments`)
  * Returned object `AssignmentSubmission` now includes `maxPoints` for the maximum number of points when the grade was set.
* feat(edu): New endpoints under `/classes/{class}/assignments/{assignment}/submissions/{submission}/comments` to create, list, update and delete comments for the submission.
* update(scores): `GET /scores/{score}/revisions/{revision}/{format}` query string `parts` now only accepts parts UUIDs.
* update(edu): `GET /organizations/users` query string `licenseExpirationDate` now also accepts `active` and `notActive` values, and has a new query option `onlyIds`
* **DEPRECATED**: `PUT /classes/{class}/assignments/{assignment}/submissions` parameters `studentComment` and `returnFeedback` have been removed. `returnFeedback` has been replace by a boolean `return` to return a submission as a teacher.

## v2.10.0 (2020-06-03)

* feat(edu): `POST /v2/organizations/users` now accepts optional `firstname` and `lastname`
* update(edu): `GET /v2/organizations/users` now accepts sort options and filters
* feat(edu): added `GET /v2/organizations/users/count` to count users matching specified filters
* feat(edu): removed deprecated `role` property from `POST /organizations/invitations` (previously renamed to `organizationRole`)
* feat(assignments): added `POST/DELETE /v2/classes/{class}/assignments/{assignment}/archive` to archive/unarchive assignments
* feat(assignments): returned assignments object from `GET /v2/classes/{class}/assignments/{assignment}` now includes the main type of the assignment: `newScore`, `scoreTemplare` or `sharedWriting`.
* feat(edu): users returned by `GET /v2/groups/{group}/users` can now be filtered by the sync source: `googleClassroom`, `microsoftGraph` or `clever`.
* feat(scores): scores details returned by `GET /v2/scores/{score}` (and similar) now includes the audio samples list used by our playback. The `instruments` property now includes a normalized list of instruments that is not dependent from the samples used.


## v2.9.0 (2020-01-10)

* Schema is now using OpenAPI 3.0.2 (previous schemas were using OpenAPI 2)
* feat(scores): New metadata and update of `GET/PUT /v2/scores/{score}`:
  * `arranger` property has been added
  * `plays` statistics are now returned (`ScorePlaysCounts`)
* feat(scores): New `now` proprty on the `DELETE` method to schedule a deletion to be executed shortly (avoid keeping in trash)
* feat(edu): Attachments (`MediaAttachment` and `ClassAttachmentCreation`) have new type `googleDrive` for attached Drive file, and a new `googleDriveFileId` property. If the attachment is a `googleDrive` item, the `iconUrl` and `mimeType` properties are also returned
* feat(edu): Add `microsoftGraph` info to `ClassDetails` (e.g. `GET /v2/classes` and `GET /v2/classes/{class}`)
* feat(account): Add `firstname` and `lastname` properties for education accounts

## v2.8.0 (2019-04-27)

* feat(scores): New metadata and update of `PUT /v2/scores/{score}`:
  * `subtitle`, `composer`, `lyricist` and `licenseText` properties has been added
  * when updating `title`, `subtitle`, `composer`, `lyricist` and `licenseText` via the API, the modifications events will be pushed to our real-time engine, and a new version will be scheduled (asynchronous)
  * `description` can now be up to 2000 characters (was previously 1000)
* feat(submissions): Added education submissions states (`created`, `turnedIn`, `returned`)
* feat(revisions): Return the last modification `event` when fetching a revision metadata (UUID)
* feat(locale): added Turkish (`tr`)
* feat(licenses): added new license source `appStore`
* feat(user): added `isFlatTeam` property to public profiles
* chore(specs): Inline schemas `UserInstruments`, `ResourceSharingKey`, `ScoreData`, `ScoreDataEncoding`, `CollectionTitle`

## v2.7.0 (2018-09-11)

* update(spec): specify `produces` and `consumes` on endpoints instead of globally
* feat(scores): now support Guitar Pro (GP3, GP4, GP5, GPX, GP), PowerTab, TuxGuitar and MuseScore files in POST /scores
* feat(scores): add support for `filename` when importing scores
* feat(collections): `parent` collection can now be a collection id when listing collections
* feat(collections): includes parent collections when listing scores
* feat(collections): add `creationDate` property in collection details
* feat(comments): add `staffUuid` for contextualized comments, which will completely replace `staffIdx` in the future
* feat(rights): now return a `isCollaborator` boolean property with the Score or Collection rights
* update(account): added new locales supported

## v2.6.0 (2018-04-23)

* feat(collections): Add new Collections API endpoints
  * `POST /collections`: Create new collection
  * `GET /collections`: List collections
  * `GET /collections/{collection}`: Get collection details
  * `PUT /collections/{collection}`: Update collection details
  * `DELETE /collections/{collection}`: Delete collection
  * `POST /collections/{collection}/untrash`: Untrash collection
  * `GET /collections/{collection}/scores`: List scores contained in a collection
  * `PUT /collections/{collection}/scores/{score}`: Add a score to a collection
  * `DELETE /collections/{collection}/scores/{score}`: Remove a score from a collection
* feat(collections): Add new OAuth2 scopes for new features:
  * `collections.readonly`: Allow read-only access to a user's collections.
  * `collections.add_scores`: Allow to add scores to a user's collections.
  * `collections`: Full, permissive scope to access all of a user's collections.
* feat(score): Added new method to untrash a score (`POST /v2/scores/{score}/untrash`)
* feat(score): `DELETE /v2/scores/{score}` can now be used without admin rights. This new behavior will unshare the score from the current account.
* feat(score): `POST /scores/{score}/fork` now accepts a collection identifier to copy a score to a specific collection.
* feat(comments): Comments can now be filtered by type with the new query string `type` (`document` or `inline`).
* update(openapi): Some schema definitions have been renamed, they are now used for Scores and Collections
  * `ScoreRights` -> `ResourceRights`
  * `ScoreCollaborator` -> `ResourceCollaborator`
  * `ScoreCollaboratorCreation` -> `ResourceCollaboratorCreation`
  * existing _score sharing key_ -> `ResourceSharingKey`
* **DEPRECATED**: `GET /scores/{score}/revisions/{revision}/{format}` no longer support part indexes for single/set of parts exports, but our own part UUIDs.
* **DEPRECATED** on 2019-09-01: `GET /users/{user}/scores` will no longer list private and shared scores, but only public scores of a Flat account.

## v2.5.2 (2018-02-07)

* fix(score): missing ScoreRights.aclRead type

## v2.5.1 (2018-01-16)

* fix(user): Add missing escape in `pattern` (`UserCreation.username`).

## v2.5.0 (2017-10-22)

* feat(scores): Add video & audio tracks support for scores: `/v2/scores/{score}/tracks`.

## v2.4.0 (2017-10-02)

* feat(scores): New metadata and update of `PUT /v2/scores/{score}`:
  * Added metadata in API `subtitle`, `lyricist`, `composer`, `description`, `tags`, `creationType`, `license`, `licenseText`, `durationTime`, `numberMeasures`, `mainTempoQpm`, `publicationDate`.
  * `PUT /v2/scores/{score}`: Remove `title` property, this one can be updated by saving a new revision of the score data.
  * `PUT /v2/scores/{score}`: New settable properties: `description`, `tags`, `creationType`, `license`.

## v2.3.0 (2017-08-28)

* feat(user): Add profile theme and instruments played.
* feat(edu): Add new cursor-based pagination for `GET /v2/organizations/users` and `GET /v2/organizations/invitations`.
* feat(edu): Add new methods:
  * `PUT /v2/organizations/users/{user}`: Admin endpoint to update managed accounts.
  * `DELETE /v2/organizations/users/{user}`: Admin endpoint to delete or convert edu accounts to consumer accounts.
* feat(edu): Classes have a new state `inactive` that can be activated using the new method `POST /v2/classes/{class}/activate`.
* feat(edu): Assignments have a new state `draft` and can have a new attachment type `exercise`.
* feat(edu): Return Canvas LMS Instance domain in classes details
* feat(edu): Return Clever.com section information in classes details

## v2.2.0 (2017-07-02)

* feat(edu): Public release of the first education APIs:
  * `/v2/classes`: Classes management
  * `/v2/classes/{class}/assignments`: Flat Assignments and Submissions
  * `/v2/organizations/users`: Organization accounts management
  * `/v2/organizations/invitations`: Organization invitations for admins and teachers
  * `/v2/organizations/lti/credentials`: LTI credentials management
  * `/v2/groups/{group}` and `/groups/{group}/users`: List of groups and users part of groups
  * `/v2/scores/{score}/submissions`: Submissions linked to a score
* feat(edu): New OAuth2 scopes:
  * `edu.classes`: Full, permissive scope to manage the classes.
  * `edu.classes.readonly`: Read-only access to the classes.
  * `edu.assignments`: Read-write access to the assignments and submissions.
  * `edu.assignments.readonly`: Read-only access to the assignments and submissions.
  * `edu.admin`: Full, permissive scope to manage all the admin of an organization.
  * `edu.admin.lti`: Access and manage the LTI Credentials for an organization.
  * `edu.admin.lti.readonly`: Read-only access to the LTI Credentials of an organization.
  * `edu.admin.users`: Access and manage the users and invitations of the organization.
  * `edu.admin.users.readonly`: Read-only access to the users and invitations of the organization.
* fix(spec): Add missing scopes in specification for `GET /v2/scores/{score}/revisions/{revision}` and `GET /v2/scores/{score}/revisions/{revision}/{format}`

## v2.1.0 (2017-04-17)

* feat(scores): Add support of private links sharing with `sharingKey`.
* feat(comments): Make "revision" optional when creating comments and support of "last" keyword.
* fix(revisions): Missing `id` property in `ScoreRevision`.
* update(spec): Specify `binary` response type for `GET /v2/scores/{score}/revisions/{revision}/{format}`

## v2.0.0 (2017-04-10)

* chore(api): First API public release with `/v2/me`, `/v2/scores`, `/v2/users` and `/v2/groups`.
