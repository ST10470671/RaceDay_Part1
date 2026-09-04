HTTP Method	Route	Description	Role Required	Request Body	Expected Response
POST	/api/auth/register	Registers a new user on the RaceDay system.	None	firstName, lastName, email, password, role	201 Created – User registered successfully. 400 Bad Request – Invalid information.
POST	/api/auth/login	Authenticates a user and allows them to access the system.	None	email, password	200 OK – Login successful. 401 Unauthorized – Invalid email or password.
GET	/api/profile	Retrieves the profile information of the logged-in user.	Logged-in User	None	200 OK – Profile returned. 401 Unauthorized – User is not logged in.
PUT	/api/profile	Updates the profile information of the logged-in user.	Logged-in User	firstName, lastName, phoneNumber	200 OK – Profile updated. 400 Bad Request – Invalid information.
GET	/api/events	Retrieves a list of all available RaceDay events.	None	None	200 OK – List of events returned.
GET	/api/events/{id}	Retrieves information about a specific event.	None	None	200 OK – Event returned. 404 Not Found – Event does not exist.
POST	/api/events	Creates a new race event.	Organiser	eventName, eventDate, location, description	201 Created – Event created. 400 Bad Request – Invalid information.
PUT	/api/events/{id}	Updates an existing race event.	Organiser	eventName, eventDate, location, description	200 OK – Event updated. 404 Not Found – Event does not exist.
DELETE	/api/events/{id}	Deletes an existing race event.	Organiser	None	204 No Content – Event deleted. 404 Not Found – Event does not exist.
GET	/api/events/{eventId}/categories	Retrieves all race categories belonging to a specific event.	None	None	200 OK – Categories returned. 404 Not Found – Event does not exist.
POST	/api/events/{eventId}/categories	Creates a new race category for an event.	Organiser	categoryName, distanceKm, entryFee, maxParticipants	201 Created – Category created. 404 Not Found – Event does not exist.
PUT	/api/categories/{id}	Updates an existing race category.	Organiser	categoryName, distanceKm, entryFee, maxParticipants	200 OK – Category updated. 404 Not Found – Category does not exist.
DELETE	/api/categories/{id}	Deletes an existing race category.	Organiser	None	204 No Content – Category deleted. 404 Not Found – Category does not exist.
POST	/api/enrolments	Registers a participant for a race category.	Participant	categoryId	201 Created – Participant successfully enrolled. 409 Conflict – Participant is already enrolled.
GET	/api/enrolments/my	Retrieves all race enrolments belonging to the logged-in participant.	Participant	None	200 OK – Enrolments returned.
DELETE	/api/enrolments/{id}	Cancels a participant's enrolment.	Participant	None	204 No Content – Enrolment cancelled. 404 Not Found – Enrolment does not exist.
GET	/api/events/{eventId}/enrolments	Allows an organiser to view participants enrolled in an event.	Organiser	None	200 OK – Enrolment list returned. 404 Not Found – Event does not exist.
POST	/api/results	Records a participant's race result.	Organiser	enrolmentId, finishTimeSeconds, position, completed	201 Created – Result recorded. 404 Not Found – Enrolment does not exist.
PUT	/api/results/{id}	Updates an existing race result.	Organiser	finishTimeSeconds, position, completed	200 OK – Result updated. 404 Not Found – Result does not exist.
GET	/api/events/{eventId}/results	Retrieves all results for a particular event.	None	None	200 OK – Results returned. 404 Not Found – Event does not exist.
GET	/api/participants/{participantId}/results	Retrieves the race results of a participant.	Participant	None	200 OK – Results returned. 404 Not Found – Participant or results do not exist.
